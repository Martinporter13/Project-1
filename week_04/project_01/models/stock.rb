require_relative('../db/sql_runner')
require_relative('./customers')

class Stock

  attr_reader   :id
  attr_accessor :item_name, :inventory, :price

  def initialize(stock)
    @id = stock['id'].to_i if stock['id']
    @item_name = stock['item_name']
    @inventory = stock['inventory']
    @price = stock['price'].to_i
  end

  def save()
    sql = "INSERT INTO stock
    (item_name, inventory, price) VALUES ($1, $2, $3) RETURNING id"
    values = [@item_name, @inventory, @price]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.delete_all()

      sql = "DELETE FROM stock"
      SqlRunner.run(sql)

  end

  def self.all()
    sql = "SELECT * FROM stock"
    results = SqlRunner.run(sql)
    return results.map { |stock| Stock.new(stock)}
  end

  def self.find(id)
    sql = "SELECT * FROM stock WHERE id = $1"
    values = [id]
    customer = SqlRunner.run(sql, values).first()
    p customer
    return Stock.new(customer)
  end

  def update()
    sql = "UPDATE stock SET (item_name, inventory, price) = ($1, $2, $3)
    WHERE id = $4"
    values = [@item_name, @inventory, @price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()

    sql = "DELETE FROM stock WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def customers()

     sql = "SELECT customers.* FROM customers INNER JOIN rentals
      ON customers.id = rentals.customer_id WHERE rentals.stock_id = $1"
      values = [@id]

      customers = SqlRunner.run(sql, values)
      return customers.map{|customer| Customer.new(customer)}
    end
end
