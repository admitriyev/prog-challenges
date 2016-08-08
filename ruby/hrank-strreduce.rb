s = gets.strip

def reduce_once(a)
  new_a = []
  is_reduced = false
  popped = 0
  a.each { |e|
    if new_a.last == e && popped < 1
      new_a.pop
      popped = 1
      is_reduced = true
    else
      new_a.push(e)
      popped = 0
    end
  }
  return is_reduced, new_a
end

def sreduce(a)
  reduced, result = reduce_once(a)
  if !reduced
    result
  else
    sreduce(result)
  end
end

a1 = sreduce(s.chars)
result = a1.empty? ? 'Empty String' : a1.join
puts result
