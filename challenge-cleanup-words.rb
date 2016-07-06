=begin
 Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
end
=end


File.open(ARGV[0]).each_line do |line|

	matched_groups = line.scan(/[^A-Za-z]*([A-Za-z]*)/) 
	sentence = nil
	matched_groups.each { |g|
		g.each { |w|
			if !w.empty?
				if sentence.nil?
					sentence = w
				else
					sentence += ' ' + w
				end
			end
		}
	}
	if !sentence.nil?
		puts sentence.downcase
	end

end