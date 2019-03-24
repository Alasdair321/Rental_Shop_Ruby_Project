require_relative('../DB/sql_runner')

class Lease

  attr_reader :id, :equipment_id, :customer_id, :start_date, :end_date

  def initialize(options)
    @id = options{id}.to_i if options{id}
    @equipment_id = options{equipment_id}
    @customer_id = options{customer_id}
    @start_date = options{start_date}
    @end_date = options{end_date}
  end

end
