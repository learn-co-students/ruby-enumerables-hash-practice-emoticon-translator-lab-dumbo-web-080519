# lead YAML file
def load_library(filepath)
  require 'yaml'
  data = YAML.load_file(filepath)
  new_data = {
    "get_meaning" => {},
    "get_emoticon" => {}
  }
  data.each do |key, value|
    new_data["get_meaning"][value[1]] = key
    new_data["get_emoticon"][value[0]] = value[1]
  end
  new_data
end

# get japanese equivalent of english emoticon
def get_japanese_emoticon(filepath, emoticon)
  emoticons = load_library(filepath)
  emoticons["get_emoticon"].each do |key, value|
    if emoticon == key
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end

# get english meaning of japanese emoticon
def get_english_meaning(filepath, emoticon)
  emoticons = load_library(filepath)
  emoticons["get_meaning"].each do |key, value|
    if emoticon == key
      return value
    end
  end
  return "Sorry, that emoticon was not found"
end
