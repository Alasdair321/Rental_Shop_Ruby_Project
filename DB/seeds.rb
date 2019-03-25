require_relative("../Models/equipment.rb")
require_relative("../Models/customer.rb")
require_relative("../Models/lease.rb")

Equipment.delete_all
Customer.delete_all
Lease.delete_all

#equipment----------------------------------------------------------------------
ski_small = Equipment.new({
  "type" => "skis",
  "size" => "small",
  "total_quantity" => 15,
  "cost" => 15
  })
ski_medium = Equipment.new({
  "type" => "skis",
  "size" => "medium",
  "total_quantity" => 20,
  "cost" => 15
  })
ski_large = Equipment.new({
  "type" => "skis",
  "size" => "large",
  "total_quantity" => 15,
  "cost" => 15
  })

ski_boots_3 = Equipment.new({
  "type" => "boots",
  "size" => "3",
  "total_quantity" => 5,
  "cost" => 10
  })
ski_boots_4 = Equipment.new({
  "type" => "boots",
  "size" => "4",
  "total_quantity" => 5,
  "cost" => 10
  })
ski_boots_5 = Equipment.new({
  "type" => "boots",
  "size" => "5",
  "total_quantity" => 5,
  "cost" => 10
  })
ski_boots_6 = Equipment.new({
  "type" => "boots",
  "size" => "6",
  "total_quantity" => 5,
  "cost" => 10
  })
ski_boots_7 = Equipment.new({
  "type" => "boots",
  "size" => "7",
  "total_quantity" => 5,
  "cost" => 10
  })
ski_boots_8 = Equipment.new({
  "type" => "boots",
  "size" => "8",
  "total_quantity" => 5,
  "cost" => 10
  })
ski_boots_9 = Equipment.new({
  "type" => "boots",
  "size" => "9",
  "total_quantity" => 5,
  "cost" => 10
  })
ski_boots_10 = Equipment.new({
  "type" => "boots",
  "size" => "10",
  "total_quantity" => 5,
  "cost" => 10
  })
ski_boots_11 = Equipment.new({
  "type" => "boots",
  "size" => "11",
  "total_quantity" => 5,
  "cost" => 10
  })
ski_boots_12 = Equipment.new({
  "type" => "boots",
  "size" => "12",
  "total_quantity" => 5,
  "cost" => 10
  })
ski_boots_13 = Equipment.new({
  "type" => "boots",
  "size" => "13",
  "total_quantity" => 5,
  "cost" => 10
  })
ski_boots_14 = Equipment.new({
  "type" => "boots",
  "size" => "14",
  "total_quantity" => 5,
  "cost" => 10
  })

helmet_small = Equipment.new({
  "type" => "helmet",
  "size" => "small",
  "total_quantity" => 15,
  "cost" => 5
  })
helmet_medium = Equipment.new({
  "type" => "helmet",
  "size" => "medium",
  "total_quantity" => 20,
  "cost" => 5
  })
helmet_large = Equipment.new({
  "type" => "helmet",
  "size" => "large",
  "total_quantity" => 15,
  "cost" => 5
  })

poles = Equipment.new({
  "type" => "poles",
  "size" => "one-size",
  "total_quantity" => 50,
  "cost" => 5
  })

jacket_small = Equipment.new({
  "type" => "jacket",
  "size" => "small",
  "total_quantity" => 20,
  "cost" => 5
  })
jacket_medium = Equipment.new({
  "type" => "jacket",
  "size" => "medium",
  "total_quantity" => 20,
  "cost" => 5
  })
jacket_large = Equipment.new({
  "type" => "jacket",
  "size" => "large",
  "total_quantity" => 20,
  "cost" => 5
  })

trouser_small = Equipment.new({
  "type" => "trouser",
  "size" => "small",
  "total_quantity" => 20,
  "cost" => 5
  })
trouser_medium = Equipment.new({
  "type" => "trouser",
  "size" => "medium",
  "total_quantity" => 20,
  "cost" => 5
  })
trouser_large = Equipment.new({
  "type" => "trouser",
  "size" => "large",
  "total_quantity" => 20,
  "cost" => 5
  })

glove_small = Equipment.new({
  "type" => "gloves",
  "size" => "small",
  "total_quantity" => 20,
  "cost" => 5
  })
glove_medium = Equipment.new({
  "type" => "gloves",
  "size" => "medium",
  "total_quantity" => 20,
  "cost" => 5
  })
glove_large = Equipment.new({
  "type" => "gloves",
  "size" => "large",
  "total_quantity" => 20,
  "cost" => 5
  })

goggles = Equipment.new({
  "type" => "goggles",
  "size" => "one-size",
  "total_quantity" => 30,
  "cost" => 10
  })

  ski_small.save
  ski_medium.save
  ski_large.save
  ski_boots_3.save
  ski_boots_4.save
  ski_boots_5.save
  ski_boots_6.save
  ski_boots_7.save
  ski_boots_8.save
  ski_boots_9.save
  ski_boots_10.save
  ski_boots_11.save
  ski_boots_12.save
  ski_boots_13.save
  ski_boots_14.save
  helmet_small.save
  helmet_medium.save
  helmet_large.save
  poles.save
  jacket_small.save
  jacket_medium.save
  jacket_large.save
  trouser_small.save
  trouser_medium.save
  trouser_large.save
  glove_small.save
  glove_medium.save
  glove_large.save
  goggles.save


#customers----------------------------------------------------------------------
customer1 = Customer.new({
  "first_name" => "Agnes",
  "surname" => "McTavish",
  "contact_number" => "03742056812",
  "contact_email" => "email1@email.com"
  })

customer2 = Customer.new({
  "first_name" => "Morag",
  "surname" => "McDougal",
  "contact_number" => "02485719465",
  "contact_email" => "email2@email.com"
  })

customer3 = Customer.new({
  "first_name" => "Robert",
  "surname" => "McNab",
  "contact_number" => "06821937546",
  "contact_email" => "email3@email.com"
  })

customer4 = Customer.new({
  "first_name" => "Hamish",
  "surname" => "McArthur",
  "contact_number" => "01347295027",
  "contact_email" => "email4@email.com"
  })

customer1.save
customer2.save
customer3.save
customer4.save

#leases-------------------------------------------------------------------------
lease1 = Lease.new({
  "equipment_id" => ski_medium.id,
  "customer_id" => customer1.id,
  "start_date" => "2019-03-24",
  "end_date" => "2019-03-31",
  "number_leased" => 1
  })

lease1.save
lease2 = Lease.new({
  "equipment_id" => ski_medium.id,
  "customer_id" => customer2.id,
  "start_date" => "2019-03-25",
  "end_date" => "2019-03-31",
  "number_leased" => 1
  })

lease2.save
lease3 = Lease.new({
  "equipment_id" => ski_medium.id,
  "customer_id" => customer3.id,
  "start_date" => "2019-03-26",
  "end_date" => "2019-03-31",
  "number_leased" => 1
  })

lease3.save
lease4 = Lease.new({
  "equipment_id" => ski_medium.id,
  "customer_id" => customer4.id,
  "start_date" => "2019-03-27",
  "end_date" => "2019-03-31",
  "number_leased" => 1
  })

lease4.save

p Lease.find_all_leases_by_id(2)
# p Lease.total_leased_equipment_id(2, "2019-03-31")
