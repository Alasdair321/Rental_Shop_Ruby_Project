require_relative('../db/sql_runner')

class Customer

  attr_reader :id, :first_name, :surname, :contact_email, :contact_number

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @first_name = options["first_name"]
    @surname = options["surname"]
    @contact_number = options["contact_number"]
    @contact_email = options["contact_email"]
  end

  def save()
    sql = "INSERT INTO customers
    (
      first_name,
      surname,
      contact_number,
      contact_email
    )
    VALUES
    (
      $1, $2, $3, $4
    )
    RETURNING id"
    values = [@first_name, @surname, @contact_number, @contact_email]
    result = SqlRunner.run(sql, values)
    id = result.first['id']
    @id = id
  end

  def lease(customer_id)
    lease = Lease.find_by_customer(customer_id)
    return lease
  end

  def update()
    sql = "UPDATE customers
    SET
    (
      first_name,
      surname,
      contact_number,
      contact_email
    ) =
    (
      $1, $2, $3, $4
    )
    WHERE id = $5"
    values = [@first_name, @surname, @contact_number, @contact_email, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM customers
    WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM customers ORDER BY id ASC"
    customer_data = SqlRunner.run(sql)
    customer = map_items(customer_data)
    return customer
  end

  def self.map_items(customer_data)
    return customer_data.map { |customer| Customer.new(customer) }
  end

  def self.find(id)
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    customer = Customer.new(result)
    return customer
  end

  def format_name
    return "#{@first_name.capitalize} #{@surname.capitalize}"
  end

end
