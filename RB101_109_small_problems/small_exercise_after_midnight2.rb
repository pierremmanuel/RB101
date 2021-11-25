def after_midnight(time_string)
  time_array = time_string.split(':').map(&:to_i)
  time_in_minutes = time_array[0] * 60 + time_array[1]
  time_in_minutes == 1440 ? time_in_minutes = 0 : time_in_minutes
end

def before_midnight(time_string)
  time_in_minutes = after_midnight(time_string)
  time_to_midnight = (time_in_minutes - 1440).abs
  time_to_midnight == 1440 ? time_to_midnight = 0 : time_to_midnight
end


p after_midnight('00:00')
p before_midnight('00:00')
p after_midnight('12:34')
p before_midnight('12:34')
p after_midnight('24:00')
p before_midnight('24:00')
