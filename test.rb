require_relative('./models/leaseslog.rb')
require_relative('./models/equipment.rb')
require_relative('./models/lease.rb')
require_relative('./models/currentleases.rb')
require_relative('./models/customer.rb')
require "pry-byebug"
# type = Equipment.types
#
# p type[0].type
# # p type[1].type
# p type[2].type
#
# sizes = Equipment.sizes_of_type
# p sizes[0][0].id

types = Equipment.types
sizes = Equipment.sizes_of_type

index = 0
for type in types
  p type.type
  for size in sizes[index]
  p size.id
  p size.size
  end
  index += 1
end
