=begin
 Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
end
=end


File.open(ARGV[0]).each_line do |line|

	line.strip!
	if (line =~ /^\s*$/).nil?
		sentence = nil

		j = 0
		for i in 0..(line.length-1)
			if (line[i] =~ /[A-Za-z]/).nil?
				w = line[j..(i-1)].reverse
				w.strip!
				if !w.empty?
					if sentence.nil?
						sentence = w
					else
						sentence += ' ' + w
					end
					#puts 'DBG ' + sentence + '<'
				end
				j = i + 1
			end
		end

		if j <= i 
			if sentence.nil?
				sentence = line[j..i].reverse
			else
				sentence += ' ' + line[j..i].reverse
			end
		end

		if !sentence.nil?
			puts sentence.reverse
		end
	end
end