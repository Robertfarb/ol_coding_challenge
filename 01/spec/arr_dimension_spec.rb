require 'rspec'
require 'arr_dimension'

describe "#array_dimension" do
  before(:each) do
    @input3d = "[[2], [2, [3]]]"
    @uneven_input = "[[["
  end

  it "throws an error if the input is not a string" do
    expect{get_dimension([])}.to raise_error("Input must be a string")
  end

  it "doesn't allow you to input an empty string" do
    expect { get_dimension("") }.to raise_error("Input string can't be empty!")
  end

  it "correctly counts dimensions of 3d array" do
    expect(get_dimension(@input3d)).to eq(3)
  end

  it "does not modify original json str" do
    json_str = "[[1], 2, [3, [[[5]]]]]"
    duped_str = json_str.dup
    get_dimension(json_str)
    expect(duped_str).to eq(json_str)
  end

  it "throws an error when input array is uneven (invalid JSON)" do
    expect{get_dimension(@uneven_input)}.to raise_error
  end
end