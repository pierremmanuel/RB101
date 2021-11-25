require 'date'

# Best solution
def friday_13th(year)
  unlucky_count = 0
  thirteenth = Date.civil(year, 1, 13)
  12.times do
    unlucky_count += 1 if thirteenth.friday?
    thirteenth = thirteenth.next_month
  end
  unlucky_count
end

# I tried to do sg without the Date module, couldn't finish it...
DAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)
MONTHS = %w(January February March April May June July August
            September October November December)

def leap_year?(year)
  1756.step(year, 4) { |yr| return true if yr == year }
  false
end

def first_of_january(year)
  counter = 0
  current_year = 1753
  loop do
    break if current_year == year
    counter += 1 if leap_year?(current_year) == false
    counter += 2 if leap_year?(current_year) == true
    current_year += 1
  end
  index = counter % 7
  DAYS[index]
end








def friday_13th(year)
  leap_year?(year) ? number_of_days = 366 : number_of_days = 365
  day_of_the_week = DAYS.index(first_of_january(year))

  number_of_days.times do |day|

    day_of_the_week += 1
  end

 end
