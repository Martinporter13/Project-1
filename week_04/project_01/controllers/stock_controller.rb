require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/stock.rb' )
also_reload( '../models/*' )

get '/stock' do
  @stocks = Stock.all()
  erb ( :"stock/index" )
end

get '/stock/new' do
  @customer = Customer.all
  erb(:"stock/new")
end

post '/stock' do
  Stock.new(params).save
  redirect to '/stock'
end

get '/stock/:id' do
  @stock= Stock.find(params['id'].to_i)
  erb( :"stock/show" )
end

get '/stock/:id/edit' do
  @customer = Customer.all
  @stock = Stock.find(params['id'].to_i)
  erb(:"stock/edit")
end

post '/stock/:id' do
  stock = Stock.new(params)
  stock.update
  redirect to "/stock/#{params['id']}"
end

post '/stock/:id/delete' do
  Stock.find(params['id'].to_i).delete
  redirect to("/stock")
end
