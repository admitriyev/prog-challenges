# Enter your code here. Read input from STDIN. Print output to STDOUT

n, k = gets.strip.split(' ').map(&:to_i)
a = gets.strip.split(' ').map(&:to_i).sort
i = 0
while true
    #puts a.inspect
    m1 = a[0]
    m2 = a[1]
    if m1 >= k
      break
    end
    new_a = m1 + (2 * m2)
    if new_a >= k
      a.shift(2)
      a << new_a
      #puts "#{i} shift"
    else
      a[1] = new_a
      a.shift(1)
      a = a.sort
      #puts "#{i} repl"
    end
    i += 1
end
puts i
