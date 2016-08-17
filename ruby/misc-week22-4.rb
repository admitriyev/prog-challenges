#n = gets.strip.to_i
n = 3
n = 5

#a = gets.strip.split(' ').map(&:to_i)
#a = [0,-1,-1]
#a = [1, 2, 3, 4]
a = [-1, -1, -1, -1, 0]

result = 1

af = 1
for i in 1..(n-1)
  if a[i] < 0
    af *= (i+1)
  end
end
result = af % (10**9 +7)

#puts af
#puts neg
puts result
