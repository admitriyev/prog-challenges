=begin
 Sample code to read in test cases:
File.open(ARGV[0]).each_line do |line|
# Do something with line, ignore empty lines
#...
end
=end

MAX_VOTES_NEEDED = 270

$num_of_issues = nil
$issue_map = Hash.new
$state_map = Hash.new
current_state = nil

# Calculate best strategy in a state
def state_strategy(state)
	needed_cost = 0
	votes_needed = (state[:votes] / 2) + 1
	sorted_issues = state[:issues].sort { |k1,k2| k1[:cost_per_vote] <=> k2[:cost_per_vote] }
	#puts "DBG #{sorted_issues.inspect}"
	result_issues = Array.new
	sorted_issues.each { |issue|
		if votes_needed > 0 && issue.values[0][:votes] > 0 && issue.values[0][:cost_per_vote] > 0
			result_issues << issue
			votes_needed -= issue.values[0][:votes]
			needed_cost += $issue_map[issue.keys[0]][:cost]
		end
	}
	state[:needed_cost] = needed_cost
	state[:state_cost_per_vote] = needed_cost.to_f / state[:votes]
	state[:needed_issues] = result_issues
	return state
end

# Parse input
File.open(ARGV[0]).each_line do |line|

	if !line.strip.empty?
		line_parts = line.split(':')
		if $num_of_issues.nil?
			$num_of_issues = line_parts[1].to_i
		else
			# is this the list of issues with costs?
			if line_parts.length > 1 && $state_map.length <= 0
				$issue_map[line_parts[0].strip] = { :cost => line_parts[1].to_i }
			else # this is a state stuff
				# is this first line which is a state name?
				if line_parts.length <= 1
					current_state = line_parts[0].strip
					issues = Array.new
					$state_map[current_state] = { 
						:issues => issues, 
						:votes => nil,
						:needed_cost => nil,
						:state_cost_per_vote => nil,
						:needed_issues => nil
					}
				else 
					if line_parts[0].strip.downcase == 'votes'
						$state_map[current_state][:votes] = line_parts[1].to_i
					else
						# this is an issue in the state
						this_issue = line_parts[0].strip
						this_votes = line_parts[1].strip.to_i
						# puts "DBG #{this_issue}, #{this_votes}"
						if $issue_map.has_key?(this_issue) && this_votes > 0
							cost_per_vote = $issue_map[this_issue][:cost].to_f / this_votes
						else
							cost_per_vote = -1
						end
						$state_map[current_state][:issues] << { 
							this_issue => { :votes => this_votes, :cost_per_vote => cost_per_vote } 
						}
					end
				end
			end
		end
	end

end

# DEBUG
#puts num_of_issues.to_s
#puts $issue_map.inspect
#puts $state_map.inspect


# Calculate all states separately
$state_map.each { |state| 
	state_strategy($state_map[state[0]])
	#puts "DBG STATE: #{state.inspect}"
}

# Final calculation
best_issues = Array.new

#puts "DBG STATES: #{$state_map.first[1][:state_cost_per_vote]}"
$state_map = $state_map.sort { |k1,k2| k1[1][:state_cost_per_vote] <=> k2[1][:state_cost_per_vote] }
puts "DBG STATE_MAP: #{$state_map}"
needed_election_votes = MAX_VOTES_NEEDED
$state_map.each { |state|
	if needed_election_votes > 0 
		state[1][:needed_issues].each { |v| best_issues << v.keys[0] }
		needed_election_votes -= state[1][:votes]
	end
}
puts "DBG needed_election_votes=#{needed_election_votes}"
best_issues.sort.uniq.each{ |a| puts a }