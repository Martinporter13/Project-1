require_relative('../db/sql_runner')

class Rental

  attr_reader(:customer_id, :stock_id, :id )

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id'].to_i
    @stock_id = options['stock_id'].to_i
  end

end 
