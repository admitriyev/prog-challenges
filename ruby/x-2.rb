# "ab" in a(1)b(1) ---> true
# "z" in a(4)b(4) --> false
# "aaaa" in a(3)b(3) ---> false
# "aab" in a(3)b(3) ---> true
# "aaba" in a(3)b(3) ---> true

#s = 'ab'
#arr = { 'a' => 1, 'b' => 1 }
#s = 'z'
#arr = { 'a' => 4, 'b' => 4}
#s = 'aaaa'
#arr = { 'a' => 3, 'b' => 3 }
#s = 'aab'
#arr = { 'a' => 3, 'b' => 3 }
s = 'aaba'
arr = { 'a' => 3, 'b' => 3 }

# count
map_count = s.chars.inject(Hash.new(0)) { |total, e|
  total[e] += 1
  total
}
puts map_count.inspect

good = true
map_count.each { |m|
  good = false if arr[m[0]].nil? || m[1] > arr[m[0]]
}
puts good
