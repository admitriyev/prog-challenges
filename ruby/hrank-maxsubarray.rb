t = gets.strip.to_i


for i in (0..t-1)
  n = gets.strip.to_i
  a = gets.strip.split(' ').map(&:to_i)
  #puts a.inspect

  max_so_far = 0
  max_ending_here = 0
  max_negative = nil
  all = 0

  a.each { |x|
    max_ending_here = max_ending_here + x
    if(max_ending_here < 0)
              max_ending_here = 0
    end
    if(max_so_far < max_ending_here)
              max_so_far = max_ending_here
    end
    if x > 0
      all += x
    else
      if max_negative.nil? || max_negative < x
        max_negative = x
      end
    end
  }
  if all == 0 && !max_negative.nil?
    all = max_negative
    max_so_far = max_negative
  end
  puts "#{max_so_far} #{all}"
end
