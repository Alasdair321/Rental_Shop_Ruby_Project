require_relative('../DB/sql_runner')

class Lease

  attr_reader :id, :equipment_id, :customer_id, :start_date, :end_date, :number_leased

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @equipment_id = options["equipment_id"]
    @customer_id = options["customer_id"]
    @start_date = options["start_date"]
    @end_date = options["end_date"]
    @number_leased = options["number_leased"]
  end

  def save()
    #finds all leases with ID and puts into ARRAY
    leases_by_id_array = Lease.find_all_leases_by_id(@equipment_id)
    #creates array of dates from start to end date
    proposed_lease_date_range = date_range_array(@start_date, @end_date)
    #checks each date in date range for matching dates in leases with the same equipment_id
    counter_array = [] #empty array to be filled by matching instances for each date
    for date in proposed_lease_date_range
      counter = 0
      for lease in leases_by_id_array
        lease_date_range = date_range_array(lease.start_date, lease.end_date)
        for date_lease_object in lease_date_range
          if date == date_lease_object #if proposed date matches other lease date then count + 1
            counter += 1
          end
        end
      end
      counter_array.push(counter) #adds counted instances to counter array
    end
    #check if difference in stock and leased is greater or equal to requested amount:
    if Equipment.find(@equipment_id).total_quantity - counter_array.max >= @number_leased
      #if true then save lease and return string reservation successful
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
      return "Reservation successful"
    else
      #if there was insufficient stock on any day in the duration then return string:
      return "Insufficient stock for selected dates."
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
    return total_leased_equipment['sum'].to_i
  end

  def self.find_all_leases_by_id(id)
    sql = "SELECT *
          FROM leases
          WHERE equipment_id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.map { |lease| Lease.new(lease)  }
  end

  def date_range_array(start_d, end_d)
    date_start = Date.strptime(start_d)
    date_end = Date.strptime(end_d)
    date_range = date_start..date_end
    date_range_array = date_range.to_a
    return date_range_array
  end




  def self.delete_all()
    sql = "DELETE FROM leases"
    SqlRunner.run(sql)
  end
end
