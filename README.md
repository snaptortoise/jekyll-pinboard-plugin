#  Pinboard Plugin for Jekyll

A [Jekyll](https://jekyllrb.com) plugin that makes your tagged [Pinboard](pinboard.in) bookmarks accessible as a template variable. Useful for managing general bookmark and recommendation pages on your Jekyll site. You can get more creative and use it to keep a portfolio page up to date or simply publish parts of your Pinboard bookmarks in a different format.

## How It Works

 This plugin registers a Hook that will load all of your Pinboard links for specified tags into a variable you can use in your templates. It's slightly similar to the way Jekly natively handles [data files](https://jekyllrb.com/docs/datafiles/) with two key differences:
 
 - It's loading the data remotely from Pinboard everytime you run a build
 - If you're running `jekyll serve --watch` locally the Pinboard data will **not** refresh as content is updated. This is to avoid making gratuitous API calls and bogging down the rebuild.
 
 
## How To Install
 
You can move `_plugins/jekyll-pinboard.rb` from this repository into your `_plugins` folder and you should be good to go.
 
## How To Use

First, make sure you've specified your Pinboard token and the tags you want to pull data from in your `_config.yml` file. You can find your token at [pinboard.in/settings/password](https://pinboard.in/settings/password). 

```YAML
 pinboard:
   token: username:token
   tags:
     - tag1
     - tag2
     - tag3
````

And so on.

 In your templates you can access the data like this:

```Liquid
site.pinboard.data['tag']
```

As an example, if you specified `travel` as one of your tags and want to iterate over all those bookmarks you could do something like this:

```Liquid
<ul>
{% for item in site.pinboard.data.travel %} 
  <li>
    <a href='{{ item.href}}'>{{ item.description}}</a> - {{ item.extended}}
  </li>
{% endfor %}
</ul>
````

You'll have access to all of the data associated with these bookmarks that you would normally see using the Pinboard API. A bookarmk has the following attributes:

- href
- description
- extended
- meta
- hash
- time
- shared
- toread
- tags

This is not supported by [GitHub Pages](https://pages.github.com/versions/). You will need to generate your site locally and push it if you want to host on GitHub.

## Support

It's a very minimal plugin, which I think is its strenght, but pull requests and discussions are welcome. Also, if you're using this plugin on your own Jekyll site let me know! 