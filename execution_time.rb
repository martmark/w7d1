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

def my_iter_min(array) # time complexity => O(n), space complexity => O(n)
    smallest = array[0]

    array.each do |el|
        smallest = el if el < smallest
    end
    return smallest
end




def my_sub_sum(array)  # time complexity => n^2 + n^2 + n => 2(n^2) + n => O(n^2)
    subs = []

    array.each.with_index do |el1, i|
        (i..array.length).each do |j|
            subs << array[i..j]
        end
    end

    subsums = Array.new
    
    subs.each do |sub|
        sum = 0
        sub.each do |int|
            sum += int
        end
        subsums << sum
    end

    largest = subsums[0]

    subsums.each do |sum|
        largest = sum if sum > largest
    end
    return largest

end


def my_better_subsum(array)
    largest = 0
    current = 0

    array.each do |el|
        current += el 
        current = 0 if current < 0
        largest = current if current > largest
    end
    
    return largest
end
