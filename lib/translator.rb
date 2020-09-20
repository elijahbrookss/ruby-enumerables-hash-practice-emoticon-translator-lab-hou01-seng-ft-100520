# require modules here
require "yaml"

def load_library(file_location) #string
  emotes = YAML.load_file(file_location)
  
  new_hash = emotes.each_with_object({}) do 
    |(key, value), new_hash| 
    new_hash[key.to_sym] = {
      :english => value[0],
      :japanese => value[1]
    }
  end
end

def get_japanese_emoticon(file_location, emote)
  emotes = load_library(file_location)
  emotes.each do 
    |name, language_hash|
    if language_hash[:english] == emote then
      return language_hash[:japanese];
    end
  end
  return "Sorry, that emoticon was not found"
end

p get_japanese_emoticon("./lib/emoticons.yml", ":)")