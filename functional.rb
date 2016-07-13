class UserQuery
	attr_reader :query

	def initialize(query)
		@query = query
	end

	def with(query)
		self.class.new(query)
	end

	def call
		puts query.length
	end

end

user_query = UserQuery.new('some query')
user_query.call
user_query.with('other query').call

class PersistPerson
	attr_reader :user_repo

	def initialize(user_repo)
		@user_repo = user_repo
	end

	def call(person)
		user_repo.save(person)
	end
end

class UserRepo
	def save(person)
	end
end

persister = PersistPerson.new(UserRepo.new)
persister.call(name: 'Jane')

# Higher order functions

sum_of_powers = ->(a, b, power_function){
  power_function.(a) + power_function.(b)
}
 
puts sum_of_powers.(3 , 2, ->(x){ x * x })

# blocks

def sum_of_powers_b(a,b)
	if block_given?
  		yield(a) + yield(b) 
  	else 
  		-99
  	end
end
 
puts (sum_of_powers_b(3, 2) { |x|  x * x } )
puts sum_of_powers_b(3, 2) 
