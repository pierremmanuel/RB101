def time_of_day(integer)
result = []
n, rest = integer.divmod(1440)
result << rest.divmod(60)
result.flatten!
hours = format('%02d', result[0])
minutes = format('%02d', result[1])
result = "#{hours}:#{minutes}"
end

p time_of_day(0)
p time_of_day(-3)
p time_of_day(35)
p time_of_day(-35)
p time_of_day(-1437)
p time_of_day(3000)
p time_of_day(800)
p time_of_day(-4231)
