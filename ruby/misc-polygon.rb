a = [1,2,3] #[3,4,5]

sum = a.inject {|sum, x| sum+x }

cuts = 0
a.each_with_index { |x,i|
  if x >= sum.to_f / 2
    cuts = 1
  end
}

puts cuts
