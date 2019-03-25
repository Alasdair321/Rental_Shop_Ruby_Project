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
    # total_leased = Lease.total_leased_equipment_id(@equipment_id, @start_date)
    # available = Equipment.availability(@equipment_id, @number_leased, total_leased)
    # if available == true
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
    # else
    #   return available
    # end
  end

  def self.total_leased_equipment_id(e_id, date)
    sql = "SELECT SUM(number_leased)
          FROM leases
          WHERE equipment_id = $1
          AND
          $2 BETWEEN start_date AND end_date"
    values = [e_id, date]
    result = SqlRunner.run(sql, values)
    total_leased_equipment = result.first
    return total_leased_equipment['sum'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM leases"
    SqlRunner.run(sql)
  end
end
