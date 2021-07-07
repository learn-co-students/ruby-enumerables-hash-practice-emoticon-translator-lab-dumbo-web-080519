require 'yaml'
require 'pry'


def load_library(filepath)
  emoticons = YAML.load_file(filepath)
  puts emoticons.inspect
  hash = {:get_meaning => {},:get_emoticon => {}}
  emoticons.each do |key,value|
    hash[:get_meaning][value[1]]= key
    hash[:get_emoticon][value[0]]= value[1]
    #binding.pry
  end
  hash
end


def get_japanese_emoticon(filepath,emoticon)
emoticons = load_library(filepath)
emoticons[:get_emoticon].each do |key, value|
    if emoticon == key
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end


def get_english_meaning(filepath, emoticon)
  emoticons = load_library(filepath)
  emoticons[:get_meaning].each do |key, value|
    if emoticon == key
      return value
    end
  end
  return "Sorry, that emoticon was not found"
  end
