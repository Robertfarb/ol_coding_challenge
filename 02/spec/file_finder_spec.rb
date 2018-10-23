require 'rspec'
require 'file_paths'

describe "#find_word_in_files" do
  before(:each) do
    @shitty_listings = FileFinder.new("www.shittylistings.com")
    @file_path1 = ["/#{Dir.pwd}/lib/website/index.html", "/#{Dir.pwd}/lib/website/hermosa/2505-via-clarita.html"]
    @incorrect_file = "/#{Dir.pwd}/lib/website/hermosa/index.html"
  end

  it "operates correctly with default file path" do
    expect{@shitty_listings.find_word_in_files("www.shittylistings.com")}.not_to raise_error
  end

  it "finds files with searched string" do
    expect(@shitty_listings.find_word_in_files("www.shittylistings.com")).to eq(@file_path1)
  end

  it "doesn't include files without searched string" do
    expect(@shitty_listings.find_word_in_files("www.shittylistings.com")).not_to include(@incorrect_file)
  end
end