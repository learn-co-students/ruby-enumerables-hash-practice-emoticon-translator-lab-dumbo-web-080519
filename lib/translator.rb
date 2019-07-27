# require modules here
require 'yaml'
def load_library(file_path)
  original = YAML.load_file(file_path)
  final = {"get_meaning" => {}, "get_emoticon" => {}}
  original.each do |meaning, emoticons|
    final["get_meaning"][emoticons[1]] = meaning
    final["get_emoticon"][emoticons[0]] = emoticons[1]
  end
  final
end

def get_japanese_emoticon(file_path = './lib/emoticons.yml', english_emoticon)
  original = load_library(file_path)
  if original["get_emoticon"].include?(english_emoticon) 
    original["get_emoticon"][english_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path = './lib/emoticons.yml', japanese_emoticon)
  original = load_library(file_path)
  if original["get_meaning"].include?(japanese_emoticon) 
    original["get_meaning"][japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end