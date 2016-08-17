n = 3 #gets.strip.to_i
x = [1,2,3] #gets.strip.split(' ').map(&:to_i)
y = [2,3,2] # [-1, 4,3] # #gets.strip.split(' ').map(&:to_i)

xsum = x.inject {|sum,i| sum + i}
ysum = y.inject {|sum,i| sum + i}

t = -1
if xsum == ysum
  tmp = 0
  for i in (0..n-1)
    tmp += (y[i] - x[i]).abs
  end
  t = tmp / 2
end
    puts t
