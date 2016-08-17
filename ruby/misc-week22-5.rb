# n = 3
# m = 4
# q = [
#   [1, 3, '110'],
#   [3, '100'],
#   [2, 1, '011'],
#   [3, '010']
# ]

n,m = gets.strip.split(' ').map(&:to_i)
q = []

for i in (0..m-1)
  this_q = gets.strip.split(' ')
  #puts this_q.inspect
  this_q[0] = this_q[0].to_i
  if this_q[0] == 1 || this_q[0] == 2
    this_q[1] = this_q[1].to_i
  end
  q << this_q
end



u = [0]*n

q.each { |qi|
  bi = (qi[0] == 1 || qi[0] == 2) ? 2 : 1
  qi[bi] = qi[bi].to_i(2)
  prn = nil
  for i in (0..n-1)
    mask = (qi[bi] >> (n-i-1)) & 1
    if mask > 0
      index = i
      if qi[0] == 3
        prn = (prn.nil?) ? u[index].to_s : (prn + ' ' + u[index].to_s)
      elsif qi[0] == 2
        u[index] = (u[index] ^ qi[1])
      else
        u[index] = qi[1]
      end
    else
      if u[i] == 0
        index = i
        if qi[0] == 1
          u[index] = qi[1]
        elsif qi[0] == 2
          u[index] = (u[index] ^ qi[1])
        end
      end
    end
  end
  puts(prn) if !prn.nil?
  #puts u.inspect
}
