# my_min

def my_min(array)   # time complexity => O(n^2), space complexity = O(n)
    not_shortest = true
    array.each.with_index do |el1, i1|
        not_shortest = false
        array.each.with_index do |el2, i2|
            if i1 == i2
                next
            elsif el1 > el2
                not_shortest = true
                break
            end
        end
        return el1 if !not_shortest
    end  
end

def my_iter_min(array)
    smallest = array[0]

    array.each do |el|
        smallest = el if el < smallest
    end
    return smallest
end