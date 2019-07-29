# require modules here
require "yaml"

def load_library(data)
  # code goes here
  yml = YAML.load_file(data)
  new_hash = {:get_meaning => {}, :get_emoticon => {}}
  yml.each do |key, element|
    new_hash[:get_meaning][element[1]] = key
    new_hash[:get_emoticon][element[0]] = element[1]
  end
  new_hash
end

def get_japanese_emoticon(yaml_file, w_emo)
  data = load_library(yaml_file)
   a = data[:get_emoticon][w_emo] ? data[:get_emoticon][w_emo] : "Sorry, that emoticon was not found"
end

def get_english_meaning(yaml_file, j_emo)
  data = load_library(yaml_file)
  a = data[:get_meaning][j_emo] ? data[:get_meaning][j_emo] : "Sorry, that emoticon was not found"
end