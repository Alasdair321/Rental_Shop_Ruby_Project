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
#does not work
post '/leases' do
  Lease.new(params).save
  erb(:create_lease)
end

get '/leases/all-equipment' do
  @all_equipment = Equipment.all
  erb(:new_equipment)
end

get '/leases/new-equipment' do
  erb(:create_equipment)
end

post '/leases/all-equipment' do
  Equipment.new(params).save
  redirect to("/leases/all-equipment")
end

get '/leases/all-equipment/:id/edit' do
  @equipment = Equipment.find(params['id'])
  erb(:edit_equipment)
end

post '/leases/all-equipment/:id' do
  equipment = Equipment.new(params)
  equipment.update
  redirect to ("/leases/all-equipment")
end

post '/leases/all-equipment/:id/delete' do
  equipment = Equipment.find(params['id'])
  equipment.delete
  redirect to ("/leases/all-equipment")
end

get '/leases/all-customers' do
  @customers = Customer.all
  erb(:new_customer)
end
