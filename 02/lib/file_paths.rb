class FileFinder
  attr_reader :file_paths

  def initialize(file_path = "/#{Dir.pwd}/**", file_extension = ".html")
    @file_path = file_path
    @file_extension = file_extension
    @file_paths = []
  end

  def find_word_in_files(word)
    Dir.glob("#{@file_path}/*#{@file_extension}") do |html_file|
      if File.read(html_file).include?(word)
        @file_paths.push(html_file)
      end
    end
    file_paths
  end
end

## To find filepaths that include certain text:
#### 1) initialize an instance of FileFinder
#### 2) call find_Word_in_files() on the instance with the desired text as an argument

# finder1 = FileFinder.new()
# finder1.find_word_in_files("www.shittylistings.com")