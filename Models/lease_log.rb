class CurrentLeases

  attr_reader :surname, :contact_number, :contact_email, :type, :size, :cost, :start_date, :end_date

  def initialize(options)
    @surname = options["surname"]
    @contact_number = options["contact_number"]
    @contact_email = options["contact_email"]
    @type = options["type"]
    @size = options["size"]
    @cost = options["cost"]
    @start_date = options["start_date"]
    @end_date = options["end_date"]
  end

  def self.all()
    sql = "SELECT customers.first_name,
    customers.surname,
    customers.contact_number,
    customers.contact_email,
    equipment.type,
    quipment.size,
    equipment.cost,
    leases.start_date,
    leases.end_date
    FROM leases
    INNER JOIN customers
    ON leases.customer_id = customers.id
    INNER JOIN equipment
    ON leases.equipment_id = equipment.id"
    leases = SqlRunner.run(sql)
    lease_array = map_items(leases)
    return lease_array
  end

  def self.map_items(leases)
    return leases.map { |lease| Lease_log.new(lease) }
  end

end
