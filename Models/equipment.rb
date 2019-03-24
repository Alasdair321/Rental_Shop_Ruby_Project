require_relative('../DB/sql_runner')

class Equipment

  attr_reader :id, :type, :size, :quantity, :cost

  def initialize(options)
    @id = options{id}.to_i if options{id}
    @type = options{type}
    @size = options{size}
    @quantity = options{quantity}
    @cost = options{cost}
  end

end
