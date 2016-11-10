# Jekyll Pinboard Plugin
# https://github.com/snaptortoise/jekyll-pinboard-plugin
# Author: George Mandis (http://george.mandi.is, https://snaptortoise.com)

require "open-uri"
require "json"

Jekyll::Hooks.register :site, :after_init do |site|
    pinboard_token =  site.config['pinboard']['token']
    pinboard_tags = site.config['pinboard']['tags']
    site.config['pinboard']['data'] = {}
    site.config['pinboard']['posts'] = {}
    site.config['pinboard']['posts']['tags'] = {}
    
    # retrieve all the book marks
    all_posts = JSON.parse(open("https://api.pinboard.in/v1/posts/all?auth_token=" + pinboard_token + "&format=json").read)
    site.config['pinboard']['posts']['all'] = all_posts
    
    # go through all of bookmarks and organize by tag
    all_posts.each_with_index do |post, key|
      tags = post['tags'].split(' ')
      tags.each do |tag|
        if (site.config['pinboard']['posts']['tags'].include? tag)
          site.config['pinboard']['posts']['tags'][tag].push(post)
        else
          site.config['pinboard']['posts']['tags'][tag] = [post]
        end
      end
    end
end