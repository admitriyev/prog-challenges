def  insertionSort( ar)
    x = ar.last
    num = ar.size - 1
    done = false
    for i in (0..num-1)
        if ar[num-1-i] > x
            ar[num-i] = ar[num-1-i]
        else
            ar[num-i] = x
            done = true
        end
        ar.each { |x| print "#{x} " }
        puts
        break if done
    end
    if !done
      ar[0] = x
      ar.each { |x| print "#{x} " }
      puts
    end
end

insertionSort( [2, 3, 4, 5, 6, 7, 8, 9, 10, 1] )
