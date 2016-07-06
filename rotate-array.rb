def rotate_1(nums, k) 

	rotated_nums = []
	
	for i in 0..k-1
		rotated_nums[i] = nums[nums.length-k+i]
	end

	j = 0
	for i in (k)..(nums.length-1)
		rotated_nums[i] = nums[j]
		j += 1
	end

	rotated_nums.to_s
end

def rotate_3(nums, k)
	# reverse 1st part
	TODO
	# reverse 2nd part
	TODO
	#revers the whole thing
	nums.reverse!
end

puts rotate_1([1,2,3,4,5,6,7], 3)
