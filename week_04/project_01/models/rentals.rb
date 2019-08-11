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
  end

  def self.all()
    sql = "SELECT * FROM rentals"
    rentals = SqlRunner.run(sql)
    return rentals.map{ |rental| Rental.new(rental)}
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


  def self.destroy(id)
      sql = "DELETE FROM rentals
      WHERE id = $1"
      values = [id]
      SqlRunner.run( sql, values )
  end

end
