#require 'debug'

INFINITY = 2**2000

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

def dijkstra(g, w, r)
  q = g.map.with_index { |x,i| i }
  #puts "r=#{r}, q=#{q.inspect}"
  dist = [INFINITY] * g.size
  prev = Array.new(g.size)

  dist[r] = 0

  while !q.empty?
    u = min_vertex(q, dist)
    q.delete_at(q.index(u))
    if !g[u].nil?
      g[u].each do |v|
        #puts "v=#{v} u=#{u} w=#{w[v..u]}"
        alt = dist[u]==INFINITY ? w[v..u] : dist[u] + w[v..u]
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

n, m = gets.strip.split(' ').map(&:to_i)

graph = Array.new
weights = Hash.new

# build adjaceny list
for j in (0..m-1)
  a,b,c = gets.strip.split(' ').map(&:to_i)
  a0 = a - 1
  b0 = b - 1
  #puts weights[a0..b0]
  weights[a0..b0] = 2**c if weights[a0..b0].nil? || weights[a0..b0] > (2**c)
  weights[b0..a0] = 2**c if weights[b0..a0].nil? || weights[b0..a0] > (2**c)
  ni = a-1
  if graph[ni].nil?
    graph[ni] = [b-1]
  else
    graph[ni].push(b-1) if graph[ni].index(b-1).nil?
  end
  ni = b-1
  if graph[ni].nil?
    graph[ni] = [a-1]
  else
    graph[ni].push(a-1) if graph[ni].index(a-1).nil?
  end
end

#puts "graph : #{graph.inspect}"
#puts "weights: #{weights}"

sum = 0
for i in (0..n-2)
  p = dijkstra(graph, weights, i)
  for j in ((i+1)..(n-1))
    sum += p[j]
  end
  puts "dist (#{i}): #{p}"
end

#puts "#{sum.to_s(10)}"
puts "#{sum.to_s(2)}"
