# require modules here
require "yaml"


def load_library(file_path)
 library = YAML.load_file("#{file_path}")
 emotes = { get_meaning: {}, get_emoticon: {}}
 library.each do |meaning, emoticons|
   emotes[:get_meaning][emoticons[1]] = meaning
   emotes[:get_emoticon][emoticons[0]] = emoticons[1]
 end
 return emotes
end

def get_japanese_emoticon(file_path, emoticon)
  library = load_library(file_path)
  sorry_message = "Sorry, that emoticon was not found"
  if library[:get_emoticon].include?(emoticon)
    library[:get_emoticon][emoticon]
  else
    return sorry_message
  end
end

def get_english_meaning(file_path, meaning)
  library = load_library(file_path)
  sorry_message = "Sorry, that emoticon was not found"
  if library[:get_meaning].include?(meaning)
    library[:get_meaning][meaning]
  else
    return sorry_message
  end
end