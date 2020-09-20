# require modules here
require "yaml"

def load_library(file_location) #string
  emotes = YAML.load_file(file_location)
  
  new_hash = emotes.each_with_object({}) do 
    |(key, value), new_hash| 
    
    new_hash[key.to_sym] = {
      :english => {
        key => value[0]
      },
      :japanese => {
        key => value[1]
      }
    }

  end
end

def get_japanese_emoticon(file_location, emote)
  emotes = load_library(file_location)
  emotes.each do
    |key, value|
    #key symbol for name
    value[:english].each do
      |name, emote_value|
      if emote_value == emote then
        return value[:japanese][name]
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_location, emote)
  emotes = load_library(file_location)
  emotes.each do
    |key, value|
    #key symbol for name
    value[:japanese].each do
      |name, emote_value|
      if emote_value == emote then
        return name
      end
    end
  end
  return "Sorry, that emoticon was not found"  
end

get_english_meaning("./lib/emoticons.yml", "☜(⌒▽⌒)☞")




