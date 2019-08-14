require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/customers.rb' )
also_reload( '../models/*' )

get '/customers' do
  @customers = Customer.all()
  erb ( :"customers/index" )
end

get '/customers/new' do
  @stock = Stock.all
  erb(:"customers/new")
end

post '/customers' do
  Customer.new(params).save
  redirect to '/customers'
end

get '/customers/:id' do
  @customer = Customer.find(params['id'].to_i)
  @rental = Rental.all
  erb( :"customers/show" )
end

get '/customers/:id/edit' do
  @stock = Stock.all
  @customer = Customer.find(params['id'].to_i)
  erb(:"customers/edit")
end

post '/customers/:id' do
  customer = Customer.new(params)
  customer.update
  redirect to "/customer/#{params['id']}"
end

post '/customers/:id/delete' do
  Customer.find(params['id'].to_i).delete
  redirect to("/customers")
end
