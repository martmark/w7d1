def bad_two_sum?(arr, target)
    
    arr.each_with_index do |num, i|
        j = i + 1
        while j < arr.length
            return true if num + arr[j] == target
        end
    end
    false
end