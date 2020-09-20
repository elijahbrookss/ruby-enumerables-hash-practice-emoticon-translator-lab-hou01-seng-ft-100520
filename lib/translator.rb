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
    |key, value|
    p key
  end
  
end

get_japanese_emoticon("./lab/emoticons.yml", ":)")