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
  @customers = Customer.all
  @equipment = Equipment.all
  erb(:new_lease)
end

post '/leases' do
  Lease.new(params).save
  erb(:create_lease)
end
#
# get '/leases/new-customer' do
#   erb(:new_customer)
# end
#
# post '/leases' do
#   Customer.new(params)
#   erb(:create_customer)
# end
