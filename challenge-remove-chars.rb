=begin
 Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
end
=end




File.open(ARGV[0]).each_line do |line|

	split_text = line.split(',')
	result = ''
	split_text[0].strip.chars.to_a.each { |a|
		if a == ' ' || !split_text[1].include?(a)
			result << a
		end
	}
	puts result

end