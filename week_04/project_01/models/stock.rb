require_relative('../db/sql_runner')

class Stock

  attr_reader(:item_name, :inventory, :price, :id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @item_name = options['item_name']
    @inventory = options['inventory']
    @price = options['price']
  end

end 
