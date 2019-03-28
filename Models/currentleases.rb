require_relative('../db/sql_runner')

class CurrentLeases

  attr_reader :id, :first_name, :surname, :contact_number, :contact_email, :type, :size, :cost, :number_leased, :start_date, :end_date

  def initialize(options)
    @id = options["id"]
    @first_name = options["first_name"]
    @surname = options["surname"]
    @contact_number = options["contact_number"]
    @contact_email = options["contact_email"]
    @type = options["type"]
    @size = options["size"]
    @cost = options["cost"]
    @number_leased = options["number_leased"]
    @start_date = options["start_date"]
    @end_date = options["end_date"]
  end

  def self.all_leases()
    sql = "SELECT
    leases.id,
    customers.first_name,
    customers.surname,
    customers.contact_number,
    customers.contact_email,
    equipment.type,
    equipment.size,
    equipment.cost,
    leases.number_leased,
    leases.start_date,
    leases.end_date
    FROM leases
    INNER JOIN customers
    ON leases.customer_id = customers.id
    INNER JOIN equipment
    ON leases.equipment_id = equipment.id
    ORDER BY first_name"
    leases = SqlRunner.run(sql)
    lease_array = map_items(leases)
    return lease_array
  end

  def self.map_items(leases)
    return leases.map { |lease| CurrentLeases.new(lease) }
  end

  def self.all_leases_by_customer(id)
    sql = "SELECT
    leases.id,
    customers.first_name,
    customers.surname,
    customers.contact_number,
    customers.contact_email,
    equipment.type,
    equipment.size,
    equipment.cost,
    leases.number_leased,
    leases.start_date,
    leases.end_date
    FROM leases
    INNER JOIN customers
    ON leases.customer_id = customers.id
    INNER JOIN equipment
    ON leases.equipment_id = equipment.id
    WHERE leases.customer_id = $1"
    values = [id]
    leases = SqlRunner.run(sql, values)
    lease_array = map_items(leases)
    return lease_array
  end

  def format_name
    return "#{@first_name.capitalize} #{@surname.capitalize}"
  end

end
