require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/customers_controller')
require_relative('controllers/stock_controller')
require_relative('controllers/rentals_controller')
also_reload( '../models/*' )

get '/' do
  erb( :index )
end
