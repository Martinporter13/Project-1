require_relative('../db/sql_runner')
require_relative('./stock')

class Customer

attr_reader :id
attr_accessor :name

  def initialize(customer)
    @id = customer['id'].to_i if customer['id']
    @name = customer['name']
  end

  def save()
    sql = "INSERT INTO customers
    (name) VALUES ($1) RETURNING id"
    values = [@name]
    results = SqlRunner.run(sql, values)
    @id = results.first['id'].to_i
  end

  def self.delete_all()

      sql = "DELETE FROM customers"
      SqlRunner.run(sql)

  end

  def self.all()
    sql = "SELECT * FROM customers"
    results = SqlRunner.run(sql)
    return results.map { |customer| Customer.new(customer)}
  end

  def self.find(id)
    sql = "SELECT * FROM customers WHERE id = $1"
    values = [id]
    customer = SqlRunner.run(sql, values).first()
    p customer
    return Customer.new(customer)
  end

  def update()

  sql = "UPDATE customers SET name = $1 WHERE id = $2"
  values = [@name, @id]
  SqlRunner.run(sql, values)
end

def delete()

  sql = "DELETE FROM customers WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
end
def stock()

     sql = "SELECT stock.* FROM stock INNER JOIN rentals
      ON stock.id = rentals.stock_id WHERE rentals.customer_id = $1"
      values = [@id]

      stock= SqlRunner.run(sql, values)
      return stock.map{|stock| Stock.new(stock)}
    end
end
