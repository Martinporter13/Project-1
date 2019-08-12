require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( '../models/rentals.rb' )
require_relative( '../models/customers.rb' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

get '/rentals' do
  @rentals = Rental.all
  erb (:"rentals/index")
end

get '/rentals/new' do
  @customers = Customer.all
  @stocks = Stock.all
  erb(:"rentals/new")
end

post '/rentals' do
  rental = Rental.new(params)
  rental.save
  redirect to("/rentals")
end

get '/rentals/:id' do
  @stocks = Stock.all
  @rental = Rental.find(params['id'].to_i)
  erb(:"rentals/show")
end

post '/rentals/:id/delete' do
  Rental.find(params[:id].to_i).delete
  redirect to("/rentals")
end
