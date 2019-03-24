require_relative('../DB/sql_runner')

class Customer

  attr_reader :id, :first_name, :surname, :contact_email, :contact_number

  def initialize(options)
    @id = options{id}.to_i if options{id}
    @first_name = options{first_name}
    @surname = options{surname}
    @contact_number = options{contact_number}
    @contact_email = options{contact_email}
  end

end
