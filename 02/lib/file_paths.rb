class FileFinder
  attr_reader :file_paths

  def initialize(file_path = "/#{Dir.pwd}/**", file_extension = ".html", text_to_find)
    @file_path = file_path
    @file_extension = file_extension
    @file_paths = []
    @text_to_find = text_to_find
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