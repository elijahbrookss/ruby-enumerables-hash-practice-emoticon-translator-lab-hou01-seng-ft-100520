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

p load_library("./lib/emoticons.yml")
