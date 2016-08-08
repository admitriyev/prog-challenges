#!/bin/ruby

n = gets.strip.to_i
a = Array.new(n)
for a_i in (0..n-1)
    a_t = gets.strip
    a[a_i] = a_t.split(' ').map(&:to_i)
end

diag_1 = 0
diag_2 = 0
for i in (0..n-1)
  diag_1 += a[i][i]
  diag_2 += a[i][n-i-1]
end
result = (diag_1-diag_2).to_i.abs
puts "#{result}"
