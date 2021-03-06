def dms(angle)
  angle >= 0 ? (angle %= 360) : (angle = 360 - (angle.abs % 360))
  angle == 0 ? (remainder = 0) : (remainder = angle % angle.to_i)
  minutes, seconds = (remainder * 3600).divmod(60)
  format(%(%d°%02d'%02d"), angle, minutes, seconds)
end

p dms(30)
p dms(76.73)
p dms(254.6)
p dms(93.034773)
p dms(0)
p dms(400)
p dms(-40)
p dms(-420)
