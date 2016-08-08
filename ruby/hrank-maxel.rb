n = gets.strip.to_i
a = Array.new
for i in (0..n-1)
    line = gets.strip
    q = line.to_i
    case q
        when 1
            a.push line.split(' ')[1].to_i
        when 2
            a.pop
        when 3
            puts a.max
    end
end
