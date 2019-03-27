require_relative('./models/leaseslog.rb')
require_relative('./models/equipment.rb')
require_relative('./models/lease.rb')
require_relative('./models/currentleases.rb')
require_relative('./models/customer.rb')

p Lease.find_all_leases_by_id(4)
