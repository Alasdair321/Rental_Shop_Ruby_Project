require('sinatra')
require('sinatra/contrib/all')
require_relative('models/customer.rb')
require_relative('models/equipment.rb')
require_relative('models/lease.rb')
also_reload('./models/*')

get '/leases' do
  @current_leases = CurrentLeases.all
  erb(:index)
end

get '/leases/new-lease' do
  erb(:create)
end
