require 'rspec'
require 'arr_dimension'

describe "#array_dimension" do
  before(:each) do
    @input_3d = "[1, [2, 3, [4]]]" # [ '42', '36' ]
    @input2 = "[[2], [2, [3]]]"
    @json_string2 = "[[[]]"
    @uneven_input = "[[["
  end

  it "throws an error if the input is not a string" do
    expect do
      get_dimension([])
    end.to raise_error("Input must be a string")
  end

  it "doesn't allow you to input an empty string" do
    expect do
      get_dimension("")
    end.to raise_error("Input string can't be empty!")
  end

  it "correctly counts dimensions of 3d array" do
    expect(get_dimension(@input2)).to eq(3)
  end

  it "does not modify original json str" do
    json_str = "[[1], 2, [3, [[[5]]]]]"
    duped_str = json_str.dup
    get_dimension(json_str)
    expect(duped_str).to eq(json_str)
  end
end