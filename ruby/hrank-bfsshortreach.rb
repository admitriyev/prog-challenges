EDGE_VALUE = 6
INFINITY = 2**32

def bfs(g, r)
  seen = Array.new(g.size);
  q = Array.new
  q.push(r)
  seen[r] = true
  while !q.empty?
    i = q.shift;
    if !g[i].nil?
      for j in (0..g[i].size-1)
        if !seen[g[i][j]]
          q.push(g[i][j])
          seen[g[i][j]] = true
        end
      end
    end
  end
  #puts "seen : #{seen.inspect}"
  return seen
end

# TEST
#bfs([[1, 2], [0], [0], [3]], 0)
#exit

def min_vertex(q, dist)
  min_dist = INFINITY
  min_q = nil
  q.each_with_index { |x,i|
    if dist[x] <= min_dist
      min_dist = dist[x]
      min_q = q[i]
    end
  }
  return min_q
end

def dijkstra(g, r)
  q = g.map.with_index { |x,i| i }
  dist = [INFINITY] * g.size
  prev = Array.new(g.size)

  dist[r] = 0

  while !q.empty?
    u = min_vertex(q, dist)
    q.delete_at(q.index(u))
    if !g[u].nil?
      g[u].each do |v|
        alt = dist[u]==INFINITY ? EDGE_VALUE : dist[u] + EDGE_VALUE
        if alt < dist[v]
          dist[v] = alt
          prev[v] = u
        end
      end
    end
  end
  #puts "dist : #{dist.inspect}"
  #puts "prev : #{prev.inspect}"
  return dist
end

# TEST
#dijkstra([[1, 2], [0, 3], [0], [1]], 0)
#dijkstra([[1, 2], [0], [0], nil], 0)
#exit



# input

t = gets.strip.to_i

for i in (0..t-1)
  n, m = gets.strip.split(' ').map(&:to_i)
  graph = Array.new(n)

  # build adjaceny list
  for j in (0..m-1)
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

  s = gets.strip.to_i

  #puts "graph : #{graph.inspect}, s=#{s-1}"

  p = dijkstra(graph, s-1)
  p.delete_at(s-1)
  seen = bfs(graph, s-1)
  seen.delete_at(s-1)
  #puts "seen : #{seen.inspect}"

  p.each_with_index { |x,i|
    if x != INFINITY && seen[i] == true
      print x, ' '
    else
      print -1, ' '
    end
  }
  puts

end
