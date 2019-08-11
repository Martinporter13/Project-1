require_relative( "../models/customer.rb" )
require_relative( "../models/rental.rb" )
require_relative( "../models/stock.rb" )
require("pry-byebug")

Customer.delete_all()
Rental.delete_all()
Stock.delete_all()

customer1 = Customer.new({
  "name" => "Martin Porter"
  })

customer1.save()

customer2 = Customer.new({
  "name" => "Powerful Wizard"
  })

customer2.save()

customer3 = Customer.new({
  "name" => "Wicked Witch"
    })

customer3.save()


inventory1 = Inventory.new({
  "item_name" => "UW_control",
  "inventory" => 15,
  "price" => 30
  })

inventory1.save()

inventory2 = Inventory.new({
  "item_name" => "Jund",
  "inventory" => 10,
  "price" => 45
  })

inventory2.save()

inventory3 = Inventory.new({
"item_name" => "UR_phoenix",
"inventory" => 12,
"price" => 25
})

inventory3.save()

rental1 = Rental.new({
  "customer_id" => rental1.id,
  "stock_id" => stock1.id
  })

rental1.save()

rental2 = Rental.new({
  "customer_id" => rental2.id,
  "stock_id" => stock2.id
  })

rental2.save()

rental3 = Rental.new({
  "customer_id" => rental3.id,
  "stock_id" => stock3.id
  })

rental3.save()
