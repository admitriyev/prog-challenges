a = {:a => 1, :b => 2, :c => 10}

def foo(a)
  a = a.sort {|a1,a2| -a1[1] <=> -a2[1] }
  max_a = a[0][1]
  r = rand(max_a)
  label = a.last
  for i in (1..a.size-1)
    if r > a[i][1]
      label = a[i-1]
      break
    end
  end
  puts "r=#{r}, #{label}"
end

#puts min_a
#puts max_a
for i in 1..10
  foo(a)
end
