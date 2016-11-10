#  Jekyll Pinboard Plugin

Access your [Pinboard](pinboard.in) data in  [Jekyll](https://jekyllrb.com).

This  plugin that makes your tagged Pinboard bookmarks  accessible as a template variable in Jekyll. Useful for managing general bookmark and recommendation pages on your Jekyll site. You can get more creative and use it to keep a portfolio page up to date or simply publish parts of your Pinboard bookmarks in a different format.

## How it Works

 This plugin registers a Hook that will load all of your Pinboard links for specified tags into a variable you can use in your templates. It's slightly similar to the way Jekly natively handles [data files](https://jekyllrb.com/docs/datafiles/) with two key differences:
 
 - It's loading the data remotely from Pinboard everytime you run a build
 - If you're running `jekyll serve --watch` locally the Pinboard data will **not** refresh as content is updated. This is to avoid making gratuitous API calls and bogging down the rebuild.
 
 
## How to Install as a Gem
 
Add this line to your application's Gemfile:

```
gem 'jekyll-pinboard'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install jekyll-pinboard
```

Once it's installed into your evironment, add it to your `_config.yml`:

```YAML
gems:
  - jekyll-pinboard
```

Then run jekyll <cmd> --safe like normal.

## Lazy Install

You can move `lib/jekyll-pinboard.rb` from this repository into your `_plugins` folder and you should be good to go.
 
## How to Use

First, make sure you've specified your Pinboard token and the tags you want to pull data from in your `_config.yml` file. You can find your token at [pinboard.in/settings/password](https://pinboard.in/settings/password). 

```YAML
 pinboard:
   token: username:token
   tags:
     - tag1
     - tag2
     - tag3
````

Etc.

 In your templates you can access your Pinboard bookmarks (referred to as `posts` in [the API](https://pinboard.in/api/)) like this:

```Liquid
site.pinboard.posts.all # An object containing all of your bookmarks  
site.pinboard.posts.tags.travel # An object containing all posts belonging to a specific tag
```

As an example, if you specified `travel` as one of your tags and want to iterate over all those bookmarks you could do something like this:

```Liquid
<ul>
{% for item in site.pinboard.posts.tags.travel %} 
  <li>
    <a href='{{ item.href }}'>{{ item.description }}</a> - {{ item.extended }}
  </li>
{% endfor %}
</ul>
````

If you wanted to iterate over all of the bookmarks in your account it would look something like this:

```Liquid
<ul>
{% for item in site.pinboard.posts.all %} 
  <li>
    <a href='{{ item.href }}'>{{ item.description }}</a> - {{ item.extended }}
  </li>
{% endfor %}
</ul>
````


You'll have access to all of the data associated with these bookmarks that you would normally see using the [Pinboard API](https://pinboard.in/api/). A bookmark has the following attributes:

- href
- description
- extended
- meta
- hash
- time
- shared
- toread
- tags

## GitHub Pages

This is not supported by [GitHub Pages](https://pages.github.com/versions/). You will need to generate your site locally and push it if you want to host on GitHub.

**Note:** If you use this plugin and host your generated site on GitHub pages be mindful that **your private API token for Pinboard is included** in `_config.yml`. You probably don't want to publish that publicly!


## Support

It's a very minimal plugin, which I think is its strength, but pull requests and discussions are welcome. 

If you're using this plugin on your own Jekyll site reach out and let me know! 
