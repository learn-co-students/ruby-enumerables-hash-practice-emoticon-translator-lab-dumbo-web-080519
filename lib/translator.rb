require "yaml"
require "pry"

def load_library(translator)
  emoji_hash = YAML.load_file(translator)
  library_hash = {"get_meaning" => {}, "get_emoticon" => {}}
  emoji_hash.each do |word, emoticon_array|
    library_hash["get_meaning"][emoticon_array[1]] = word
    library_hash["get_emoticon"][emoticon_array[0]] = emoji_hash[word][1]
  end
  library_hash
end


def get_japanese_emoticon(file_path, english_emoticon)
  call_library = load_library(file_path)
  japanese_result_emoticon = call_library["get_emoticon"][english_emoticon]
  japanese_result_emoticon ? japanese_result_emoticon : "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, japanese_emoticon)
  call_library = load_library(file_path)
  english_result_emoticon = call_library["get_meaning"][japanese_emoticon]
  english_result_emoticon ? english_result_emoticon : "Sorry, that emoticon was not found"
end