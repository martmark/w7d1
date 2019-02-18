def permutations(array)
    return [array] if array.length <= 1

    first = array.shift
    perms = permutations(array)
    total_permutations = []

    perms.each do |perm|
        (0..perm.length).each do |i|
            total_permutations << perm[0 ... i] + [first] + perm[i .. -1]
        end
     end
  
    return total_permutations
end

def anagrams(str1, str2) #time complexity = O(n!)
    begin_time = Time.now
    anags = permutations(str1.split(""))
    anags.each do |anag|
        return true if anag.join("") == str2
    end
    end_time = Time.now
    p msecs =  (end_time - begin_time) * 1000
    false
end

def second_anagram(str1, str2) # time complexity = O(n^2)
    begin_time = Time.now
    return false if str1.length != str2.length
    chars1 = str1.split("")
    chars2 = str2.split("")

    chars1.each do |char|
        i = chars2.find_index(char)
        chars2.delete(chars2[i]) unless i.nil?
    end
    p chars2.empty?
    end_time = Time.now
    p msecs =  (end_time - begin_time) * 1000
end


def third_anagram(str1, str2)  #time complexity => O(n^2) 
    begin_time = Time.now
    chars1 = str1.split("")
    chars2 = str2.split("")

    sorted1 = quicksort(chars1)
    sorted2 = quicksort(chars2)

    end_time = Time.now
    p msecs =  (end_time - begin_time) * 1000
    sorted1 == sorted2
end

def quicksort(array) 
    return array if array.length < 2

    pivot = array[0]

    left = array[1..-1].select { |ele| ele < pivot }
    right = array[1..-1].select { |ele| ele >= pivot }

    quicksort(left) + [pivot] + quicksort(right)
end

def fourth_anagram(str1, str2) # time complexity = O(n)
    return false if str1.length != str2.length

    hash1 = Hash.new(0)
    # hash2 = Hash.new(0)

    str1.each_char.with_index do |char, i|
        hash1[char] += 1
        hash1[str2[i]] -= 1
    end

    hash1.values.all? {|value| value == 0}
end

