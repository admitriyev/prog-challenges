qn = gets.strip.to_i

for i in (0..qn-1)
  n = gets.strip.to_i
  w = gets.strip.split(' ').map(&:to_i)
  a = gets.strip.split(' ').map(&:to_i)

  # build adjaceny list
  graph = Array.new(n)
  for j in (0..n-2)
    edge = gets.strip.split(' ').map(&:to_i)
    ni = edge[0]-1
    if graph[ni].nil?
      graph[ni] = [edge[1]-1]
    else
      graph[ni].push(edge[1]-1) if graph[ni].index(edge[1]-1).nil?
    end
    ni = edge[1]-1
    if graph[ni].nil?
      graph[ni] = [edge[0]-1]
    else
      graph[ni].push(edge[0]-1) if graph[ni].index(edge[0]-1).nil?
    end
  end
  #puts graph.inspect

  asum = 0
  anum = 0
  graph.each_with_index { |v,index|
      #puts a[w[index]]
      asum += a[w[index]]
      anum += 1
      if v.size > 0
        child_sum = w[index]
        v.each_with_index { |vv, j|
          child_sum += w[vv]
        }
        #puts a[child_sum]
        asum += a[child_sum]
        anum += 1
      end
  }

  #puts
  puts asum.to_f / anum

end
