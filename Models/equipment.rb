require_relative('../db/sql_runner')
require_relative('./lease')

class Equipment

  attr_reader :id, :type, :size, :total_quantity, :cost

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @type = options["type"]
    @size = options["size"]
    @total_quantity = options["total_quantity"]
    @cost = options["cost"]
  end

  def save()
    sql = "INSERT INTO equipment
    (
      type,
      size,
      total_quantity,
      cost
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@type, @size, @total_quantity, @cost]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def lease(equipment_id)
    lease = Lease.find_by_equipment(equipment_id)
    return lease
  end

  def update()
    sql = "UPDATE equipment
    SET
    (
      type,
      size,
      total_quantity,
      cost
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@type, @size, @total_quantity, @cost, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM equipment
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM equipment"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM equipment ORDER BY id ASC"
    equipment_data = SqlRunner.run(sql)
    equipment = map_items(equipment_data)
    return equipment
  end

  def self.map_items(equipment_data)
    return equipment_data.map { |equipment| Equipment.new(equipment) }
  end

  def self.find(id)
    sql = "SELECT * FROM equipment
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    equipment = Equipment.new(result)
    return equipment
  end




end
