# require modules here
require "yaml"
require "pry"

def load_library(file_location) #string
  emotes = YAML.load_file(file_location)
  
  hash = emotes.each_with_object({}) do |(key, value), new_hash| 
    
    new_hash[key.to_sym] = {
      :english => value[0],
      :japanese => value[1]
    }
    
  end
  
  hash
  
end
def get_japanese_emoticon(file_location, emote)
  emotes = load_library(file_location)
  emotes.each do 
    |name, language_hash|
    if language_hash[:english] == emote then
      return language_hash[:japanese]
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_location, emote)
  emotes = load_library(file_location)
  emotes.each do 
    |name, language_hash|
    if language_hash[:japanese] == emote then
      return name.to_s
    end
  end
  
  return "Sorry, that emoticon was not found"
end