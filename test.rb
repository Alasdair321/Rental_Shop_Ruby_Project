require('date')
start_date_new = Date.strptime("2019-03-26")
end_date_new = Date.strptime("2019-03-30")
# p start_date
# p end_date
date_range_new = start_date_new..end_date_new
date_range_new_array = date_range_new.to_a
p date_range_new_array
