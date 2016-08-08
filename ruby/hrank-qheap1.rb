class Heap
  INFINITY = (2**31)
  @h

  def initialize
    @h = Array.new
  end

  def insert(p)
    @h << p
    sift_up(@h.size-1)
  end

  def remove(v)
    i = @h.index(v)
    @h[i] = -INFINITY
    sift_up(i)
    extract_min
  end

  def sift_up(i)
    while i > 0 && @h[parent(i)] > @h[i]
      th = @h[i]
      @h[i] = @h[parent(i)]
      @h[parent(i)] = th
      i = parent(i)
    end
  end

  def sift_down(i)
    max_index = i
    l = left_child(i)
    if l < @h.size && @h[l] < @h[max_index]
      max_index = l
    end
    r = right_child(i)
    if r < @h.size && @h[r] < @h[max_index]
      max_index = r
    end
    if i != max_index
      th = @h[i]
      @h[i] = @h[max_index]
      @h[max_index] = th
      sift_down(max_index)
    end
  end

  def parent(i)
    i/2
  end

  def left_child(i)
    2 * i
  end

  def right_child(i)
    (2 * i) + 1
  end

  def min
    @h[0]
  end

  def extract_min
    result = @h[0]
    @h[0] = @h.last
    @h.delete_at(@h.size-1)
    sift_down(0)
    return result
  end
end

# TEST
# a = Heap.new
# a.insert(4)
# a.insert(9)
# a.remove(4)
# exit

n = gets.strip.to_i
a = Heap.new
for i in (0..n-1)
    line = gets.strip
    q = line.to_i
    case q
        when 1
            a.insert line.split(' ')[1].to_i
        when 2
            a.remove line.split(' ')[1].to_i
        when 3
            puts a.min
    end
end
