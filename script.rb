#====================================================================================
# Recursion assignment part 1
# Write two methods that return the first n numbers of the Fibonacci sequence
# One method is iterative and one method is recursive, but they do the same thing
#====================================================================================

#Uses iteration
#Takes a number and returns an array with that many numbers in the fibonacci sequence
def fibs(n)
  result = []

  if n == 1
    result = [0]
    return result
  elsif n == 2
    result = [0, 1]
    return result
  elsif n > 2
    result = [0, 1]
    while result.length < n
      result << result[-1] + result[-2]
    end
  end
  
  puts result
  return result
end

#Uses recursion to achieve the same thing as above
def fibs_rec(n, result = [0, 1])

  if result.length == n
    puts result
    return result
  elsif n == 1
    result = [0]
    return result
  elsif n == 2
    return result
  elsif n > 2
    result << result[-1] + result[-2]
    fibs_rec(n, result)
  end
end

#====================================================================================
# Recursion assignment part 2
# Write a method that sorts an array using recursive merge sort
#====================================================================================

def merge_sort(my_array)

  #If the array has length 0 or 1 there's nothing to sort
  if my_array.length == 0 || my_array.length == 1
    return my_array

  #If the array contains more than 1 thing, break it into halves and sort each half
  else
    left_half = my_array[0..((my_array.length / 2) - 1)]
    right_half = my_array[(my_array.length / 2)..(-1)]

    #Reassign left_half and right_half so that the merged halves get merged correctly themselves
    if left_half.length > 1
      left_half = merge_sort(left_half)
    end

    if right_half.length > 1
       right_half = merge_sort(right_half)
    end

    merged_array = combine(left_half, right_half)
    
    return merged_array

  end
end

#Takes two sorted lists and merges them into one sorted list
def combine(left, right)
  sorted_array = []

  left.each do |left_num|
    right.each do |right_num|

      #this first case where they're equal is written to handle duplicates in the list
      if left_num == right_num
        if sorted_array.include?(left_num)
          sorted_array.push(left_num)
        else
          sorted_array.push(left_num)
          sorted_array.push(right_num)
        end

      elsif left_num < right_num
        unless sorted_array.include?(left_num)
          sorted_array.push(left_num)
        end

      elsif left_num > right_num
        unless sorted_array.include?(right_num)
          sorted_array.push(right_num)
        end
      end
    end
  end

  #the code above doesn't push the last value (the largest one) to the new array,
  #so this runs through both halves to find it and push it to the end
  left.each do |num|
    unless sorted_array.include?(num)
      sorted_array.push(num)
    end
  end

  right.each do |num|
    unless sorted_array.include?(num)
      sorted_array.push(num)
    end
  end

  return sorted_array
end

merge_sort_test = merge_sort([8, 14, 2, 6, 12, 9, 14, 17, 20, 14, 10, 11])
puts "sorted with merge sort: #{merge_sort_test}"