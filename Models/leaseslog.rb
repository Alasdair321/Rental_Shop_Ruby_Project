require_relative('../db/sql_runner')

class LeaseLog

  attr_reader :first_name, :surname, :contact_number, :contact_email, :type, :size, :cost, :number_leased, :start_date, :end_date

  def initialize(options)
    @first_name = options["customer_first_name"]
    @surname = options["customer_surname"]
    @contact_number = options["customer_contact_number"]
    @contact_email = options["customer_contact_email"]
    @type = options["equipment_type"]
    @size = options["equipment_size"]
    @cost = options["equipment_cost"]
    @number_leased = options["number_leased"]
    @start_date = options["start_date"]
    @end_date = options["end_date"]
  end

  def self.all_leases()
    sql = "SELECT
    customer_first_name,
    customer_surname,
    customer_contact_number,
    customer_contact_email,
    equipment_type,
    equipment_size,
    equipment_cost,
    number_leased,
    start_date,
    end_date
    FROM leases_log"
    leases = SqlRunner.run(sql)
    lease_array = map_items(leases)
    return lease_array
  end

  def self.map_items(leases)
    return leases.map { |lease| LeaseLog.new(lease) }
  end

end
