def phone_to_abc(phone)

  phone_abc = [
    '0', '1', 'abc', 'def', 'ghi',
    'jkl', 'mno', 'pqrs', 'tuv', 'wxyz'
  ]

  phone_map = phone.chars.map { |x| phone_abc[x.to_i].chars }
  result = phone_map[0]
  for i in 1..phone_map.size-1
    result = result.product(phone_map[i])
  end
  result.each { |x|
    puts "#{x.join}"
  }

end

phone_to_abc('86352')

#phone_to_abc('234')
#phone_to_abc('7202586352')
