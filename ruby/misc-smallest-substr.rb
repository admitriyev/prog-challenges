s = "this is a test string"
t = "tist"
min_len = 2**31
min_first = 0
min_last = 0

c_count = Hash.new
t.chars.each { |c|
  if c_count[c].nil?
    c_count[c] = { :num => 1, :found => 0 }
  else
    c_count[c][:num] += 1
  end
}

first = 0
last = 0
count = 0
while last < s.size

  # skip characters not in t
  c = c_count[s[last]]
  if !c.nil?
    c[:found] += 1

    count += 1 if c[:found] <= c[:num]

    # if window constraint is satisfied
    if count == t.size
      # advance begin index as far right as possible,
      # stop when advancing breaks window constraint.
      cb = c_count[s[first]]
      while (cb.nil? || cb[:found] > cb[:num])
        cb[:found] -= 1 if (!cb.nil? && cb[:found] > cb[:num])
        first += 1
        cb = c_count[s[first]]
      end

      # update minWindow if a minimum length is met
      this_len = last - first + 1;
      if (this_len < min_len)
        min_first = first;
        min_last = last
        min_len = this_len
      end
    end
  end
  last += 1
end

puts "#{s[first..(first+min_len-1)]}"
