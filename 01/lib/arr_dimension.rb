require 'json'

def get_dimension(json_str) 
  raise "Input must be a string" unless json_str.is_a?(String)
  raise "Input string can't be empty!" unless json_str.length >= 1

  # Check json_str, if it is a string parse it into JSON
  json_arr = json_str.is_a?(String) ? JSON.parse(json_str) : json_str
  arr_dimension = 1

  json_arr.each do |el| # O(n) n = number of elements in json_arr
    if el.is_a?(Array)
      # Recursively call get_dimension on the array, re-convert into a string so it passes first check.
      sub_dimension = get_dimension(el.to_s)
      arr_dimension = sub_dimension + 1 if sub_dimension + 1 > arr_dimension
    end
  end
  
  arr_dimension
end


# Time complexity: 
## Worst case: O(n^k), where n = number of elements in array, k = number of elements in subarray
# Space complexity: O(n)