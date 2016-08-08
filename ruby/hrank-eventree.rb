n, m = gets.strip.split(' ').map(&:to_i)

a = Array.new(m)
for a_i in (0..m-1)
    a_t = gets.strip
    a[a_i] = a_t.split(' ').map(&:to_i)
end

puts a.inspect

# TODO SOLVE IT
