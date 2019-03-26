require('sinatra')
require('sinatra/contrib/all')
require_relative('models/customer.rb')
require_relative('models/equipment.rb')
require_relative('models/lease.rb')
require_relative('models/currentleases.rb')
also_reload('./models/*')

get '/leases' do
  @current_leases = CurrentLeases.all_leases
  erb(:index)
end

get '/leases/new-lease' do
  erb(:new)
end

post '/leases' do
  erb(:create)
end
