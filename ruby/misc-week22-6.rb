n = gets.strip.to_i
q = []

for i in (0..n-1)
  this_q = gets.strip.split(' ')
  q << this_q
end

s = []

q.each { |qi|
  if qi[0] == '+'
    s << qi[1].to_i
  else
    s.pop
  end
  prefix = 0
  if s.size > 0
    num = s.size
    for i in (0..num-1)
      done = false
      for j in (i+1..num-1)
        if s[i] == s[j]
          prefix += 1
        else
          done = true
          break
        end
      end
      break if done == true
    end
  end
  #puts s.inspect
  puts prefix
}
