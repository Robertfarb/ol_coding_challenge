require 'json'

def get_dimension(json_str) 
  raise "Input must be a string" unless json_str.is_a?(String)
  raise "Input string can't be empty!" unless json_str.length >= 1

  json_arr = json_str.is_a?(String) ? JSON.parse(json_str) : json_str
  arr_dimension = 1

  json_arr.each do |el|
    if el.is_a?(Array)
      sub_dimension = get_dimension(el.to_s)
      arr_dimension = sub_dimension + 1 if sub_dimension + 1 > arr_dimension
    end
  end
  
  arr_dimension
end