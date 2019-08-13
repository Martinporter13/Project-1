require_relative('../db/sql_runner')
require_relative('./customers.rb')
require_relative('./stock.rb')


class Rental

  attr_reader :id
  attr_accessor :customer_id, :stock_id

  def initialize(rental)
    @id = rental['id'].to_i if rental['id']
    @customer_id = rental['customer_id'].to_i
    @stock_id = rental['stock_id'].to_i
  end

  def save()
    sql = "INSERT INTO rentals
    (customer_id, stock_id) VALUES ($1, $2) RETURNING id"
    values = [@customer_id, @stock_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
    stock = Stock.find(@stock_id)
    stock.remove_inventory()
    stock.update()

    # Find the stock by stock_id
    # Call a method no the stock to reduce Inventory
    # Update that stock
  end



  def self.all()
    sql = "SELECT * FROM rentals"
    rentals = SqlRunner.run(sql)
    return rentals.map{ |rental| Rental.new(rental)}
  end

  def self.find(id)
    sql = "SELECT * FROM rentals
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    rentals = Rental.new(result)
    return rentals
  end

  def self.delete_all()
      sql = "DELETE FROM rentals"
      SqlRunner.run(sql)
  end

  def customer()
    sql = "SELECT * FROM customers
    WHERE id = $1"
    values = [@customer_id]
    results = SqlRunner.run(sql, values)
    return Customer.new(results.first)
  end

  def stock()
    sql = "SELECT * FROM stock
    WHERE id = $1"
    values = [@stock_id]
    results = SqlRunner.run(sql, values)
    return Stock.new(results.first)
  end

  def update()

    sql = "UPDATE rentals SET (customer_id, stock_id) = ($1, $2) WHERE id = $3"
    values = [@customer_id, @stock_id, @id]
    SqlRunner.run(sql, values)
  end


  def delete()

    sql = "DELETE FROM rentals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
    stock = Stock.find(@stock_id)
    stock.add_inventory()
    stock.update()

    # Find stock by its id
    # Call amethod to increase inventory
    # Update stock
  end

end
