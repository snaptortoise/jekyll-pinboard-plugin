# Jekyll Pinboard Plugin
# https://github.com/snaptortoise/jekyll-pinboard-plugin
# Author: George Mandis (http://george.mandi.is, https://snaptortoise.com)

require "open-uri"
require "json"

Jekyll::Hooks.register :site, :after_init do |site|
    pinboard_token =  site.config['pinboard']['token']
    pinboard_tags = site.config['pinboard']['tags']
    site.config['pinboard']['data'] = {}

    pinboard_tags.each_with_index do |tag, key|
      json_data = open("https://api.pinboard.in/v1/posts/all?auth_token=" + pinboard_token + "&format=json&tag=" + tag).read
      
      begin        
        site.config['pinboard']['data'][tag] = JSON.parse(json_data)    
      rescue
        puts "Pinboard might be down. There was an error parsing JSON from: " + "https://api.pinboard.in/v1/posts/all?auth_token=" + pinboard_token + "&format=json&tag=" + tag
      end
      
    end
end