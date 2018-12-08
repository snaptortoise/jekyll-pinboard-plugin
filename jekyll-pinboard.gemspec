Gem::Specification.new do |s|
  s.name        = 'jekyll-pinboard'
  s.version     = '0.2.2'
  s.date        = '2018-12-08'
  s.summary     = "A Jekyll plugin that makes your Pinboard bookmarks accessible"
  s.description = "This plugin makes your Pinboard bookmarks accessible within your Jekyll templates."
  s.authors     = ["George Mandis"]
  s.email       = 'george@mand.is'
  s.files       = ["lib/jekyll-pinboard.rb"]
  s.homepage    =
    'https://github.com/snaptortoise/jekyll-pinboard-plugin'
  s.license       = 'MIT'
  
  s.add_runtime_dependency "jekyll", "~> 2.0", ">= 2.0.1"
  
  s.add_development_dependency "json", "~> 2.0", ">= 2.0.1"
end