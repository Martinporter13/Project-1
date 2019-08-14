require_relative( "../models/customers.rb" )
require_relative( "../models/rentals.rb" )
require_relative( "../models/stock.rb" )
require("pry-byebug")

Rental.delete_all()
Customer.delete_all()
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


      stock1 = Stock.new({
        "item_name" => "UW_control",
        "inventory" => 15,
        "price" => 30
        })

        stock1.save()

        stock2 = Stock.new({
          "item_name" => "Jund",
          "inventory" => 10,
          "price" => 45
          })

          stock2.save()

          stock3 = Stock.new({
            "item_name" => "UR_phoenix",
            "inventory" => 12,
            "price" => 25
            })

            stock3.save()

            rental1 = Rental.new({
              "customer_id" => customer1.id,
              "stock_id" => stock1.id
              })

              rental1.save()

              rental2 = Rental.new({
                "customer_id" => customer2.id,
                "stock_id" => stock2.id
                })

                rental2.save()

                rental3 = Rental.new({
                  "customer_id" => customer3.id,
                  "stock_id" => stock3.id
                  })

                  rental3.save()

                  customer1.name = "Harry"
                  customer1.update

                  stock1.item_name = "Tron"
                  stock1.update

                  rental1.customer_id = customer2.id
                  rental1.update

                
