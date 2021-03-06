require_relative('../db/sql_runner')
# require('pry')
require 'pry-byebug'

class Lease
  attr_reader :id, :equipment_id, :customer_id, :start_date, :end_date, :number_leased

  def initialize(options)
    # binding.pry
    @id = options['id'].to_i if options['id']
    @equipment_id = options['equipment_id'].to_i
    @customer_id = options['customer_id'].to_i
    @start_date = options['start_date']
    @end_date = options['end_date']
    @number_leased = options['number_leased']
  end

  def save
    equipment = Equipment.find(@equipment_id)
    # binding.pry
    # finds all leases with ID and puts into ARRAY
    leases_by_id_array = Lease.find_all_leases_by_id(@equipment_id)
    # creates array of dates from start to end date
    proposed_lease_date_range = date_range_array(@start_date, @end_date)
    # binding.pry
    # checks each date in date range for matching dates in leases with the same equipment_id
    counter_array = [0] # empty array to be filled by matching instances for each date
    proposed_lease_date_range.each do |date|
      counter = 0
      leases_by_id_array.each do |lease|
        lease_date_range = date_range_array(lease.start_date, lease.end_date)
        lease_date_range.each do |date_lease_object|
          counter += lease.number_leased.to_i if date == date_lease_object # if proposed date matches other lease date then count
        end
      end
      counter_array.push(counter) # adds counted instances to counter array
    end
    available = Equipment.find(@equipment_id).total_quantity.to_i - counter_array.max
    # check if difference in stock and leased is greater or equal to requested amount:
    if available >= @number_leased.to_i
      # if true then save lease and return string reservation successful
      sql = "INSERT INTO leases
    (
      equipment_id,
      customer_id,
      start_date,
      end_date,
      number_leased
    )
    VALUES
    (
      $1, $2, $3, $4, $5
    )
    RETURNING id"
      values = [@equipment_id, @customer_id, @start_date, @end_date, @number_leased]
      result = SqlRunner.run(sql, values)
      id = result.first['id']
      @id = id
      return "Reservation of #{equipment.type} size - #{equipment.size} was successful"
    else
      # if there was insufficient stock on any day in the duration then return string:
      return "Insufficient stock for selected dates for #{equipment.type} size - #{equipment.size}."
    end
  end

  def self.total_leased_equipment_id(e_id, date)
    sql = "SELECT SUM(number_leased)
          FROM leases
          WHERE equipment_id = $1
          AND
          $2 BETWEEN start_date AND "
    values = [e_id, date]
    result = SqlRunner.run(sql, values)
    total_leased_equipment = result.first
    total_leased_equipment['sum'].to_i
  end

  def self.find_all_leases_by_id(id)
    sql = "SELECT *
          FROM leases
          WHERE equipment_id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    result.map { |lease| Lease.new(lease) }
  end

  def date_range_array(start_d, end_d)
    date_start = Date.strptime(start_d)
    date_end = Date.strptime(end_d)
    date_range = date_start..date_end
    date_range_array = date_range.to_a
    date_range_array
  end

  def self.end_lease(id)
    sql = "SELECT * FROM leases
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    lease = Lease.new(result)

    sql = "SELECT * FROM equipment
    WHERE id = $1"
    values = [lease.equipment_id]
    result = SqlRunner.run(sql, values).first
    equipment = Equipment.new(result)

    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [lease.customer_id]
    result = SqlRunner.run(sql, values).first
    customer = Customer.new(result)

    sql = "INSERT INTO leases_log
          (
            lease_id,
            equipment_type,
            equipment_size,
            equipment_cost,
            customer_first_name,
            customer_surname,
            customer_contact_number,
            customer_contact_email,
            start_date,
            end_date,
            number_leased
          )
          VALUES
          (
          $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11
          )"
    values = [lease.id, equipment.type, equipment.size, equipment.cost, customer.first_name, customer.surname, customer.contact_number, customer.contact_email, lease.start_date, lease.end_date, lease.number_leased]
    SqlRunner.run(sql, values)
    delete_by_id(lease.id)
  end

  def self.find(id)
    sql = "SELECT * FROM leases
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    lease = Lease.new(result)
    lease
  end

  def delete
    sql = "DELETE FROM leases
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_by_id(id)
    sql = "DELETE FROM leases
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = 'DELETE FROM leases'
    SqlRunner.run(sql)
  end

  # def self.all()
  #   sql = "SELECT customers.first_name,
  #   customers.surname,
  #   customers.contact_number,
  #   customers.contact_email,
  #   equipment.type,
  #   equipment.size,
  #   equipment.cost,
  #   leases.start_date,
  #   leases.end_date
  #   FROM leases
  #   INNER JOIN customers
  #   ON leases.customer_id = customers.id
  #   INNER JOIN equipment
  #   ON leases.equipment_id = equipment.id"
  #   lease_data = SqlRunner.run(sql)
  #   leases = map_items(lease_data)
  #   return leases
  # end
  #
  # def self.map_items(lease_data)
  #   return lease_data.map { |lese| Lease.new(lese) }
  # end
end
