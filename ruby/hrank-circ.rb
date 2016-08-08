#!/bin/ruby

n, k, q = gets.strip.split(' ').map(&:to_i)
a = gets.strip.split(' ').map(&:to_i)
qa = Array.new(n)
for i in (0..q-1)
    qa[i] = gets.strip.to_i
end

#puts "#{n} #{k} #{q}"

a.rotate!(-k)
#puts a.inspect
#puts qa.inspect
qa.each { |x|
  puts a[x]
}
