=begin
 Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
end
=end




File.open(ARGV[0]).each_line do |line|


	rows = []
	line.split('|').each {|row| rows << row.split(' ') }
	rows.each { |r| r.map!{ |x| x.to_i } }
	rows.transpose.each { |category|
		max = category.max
		print "#{max} "
	}
	puts 

end