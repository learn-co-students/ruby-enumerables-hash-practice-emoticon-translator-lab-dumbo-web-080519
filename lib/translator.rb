require "yaml"
require "pry"

def load_library(file)
  raw_emoticons = YAML.load_file(file)
  emoticons = { get_meaning: {}, get_emoticon: {}}
  raw_emoticons.each do | key, value |
    emoticons[:get_meaning][value[1]] = key
    emoticons[:get_emoticon][value[0]] = value[1]
  end

  return emoticons
end

def get_japanese_emoticon(file, english_emoticon)
  emoticons = load_library(file)
  if emoticons[:get_emoticon].has_key?(english_emoticon)
    japanese_emoticon = emoticons[:get_emoticon][english_emoticon]
    return japanese_emoticon
  else
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, japanese_emoticon)
  emoticons = load_library(file)
  if emoticons[:get_meaning].has_key?(japanese_emoticon)
    english_meaning = emoticons[:get_meaning][japanese_emoticon]
    return english_meaning
  else
    return "Sorry, that emoticon was not found"
  end
end
