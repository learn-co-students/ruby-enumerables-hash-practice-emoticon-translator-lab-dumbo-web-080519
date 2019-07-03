require "yaml"

def load_library(file)
  data = YAML.load_file(file)
 
  formatted = {"get_emoticon" => {}, "get_meaning" => {}}
  
  data.each do |meaning, symbols|
    if !formatted["get_meaning"].has_key?(symbols[1])
      formatted["get_meaning"][symbols[1]] = meaning
    end
    if !formatted["get_emoticon"].has_key?(symbols[0])
      formatted["get_emoticon"][symbols[0]] = symbols[1]
    end
  end
  
  formatted
end

def get_japanese_emoticon(file, emoticon)
  library = load_library(file)
  library["get_emoticon"].fetch(emoticon, "Sorry, that emoticon was not found")
end

def get_english_meaning(file, emoticon)
  library = load_library(file)
  library["get_meaning"].fetch(emoticon, "Sorry, that emoticon was not found")
end