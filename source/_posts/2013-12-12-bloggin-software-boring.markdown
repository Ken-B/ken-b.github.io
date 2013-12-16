---
layout: post
title: "Bloggin software (boring :)"
date: 2013-12-12
comments: true
---

*This is just a post for me to use later in case I lose my laptop (let's hope that doesn't happen [:)](http://xkcd.com/541/)*

<!-- more --> 

# Setup Blogging with [Octopress]

### Install Ruby

[Ruby](http://en.wikipedia.org/wiki/Ruby_%28programming_language%29) needs to be installed, but only the package manager [gem](http://en.wikipedia.org/wiki/RubyGems) is used later. On Mac this is usual already installed (type `ruby --version` in a [terminal] to check).

I followed instructions from [this blog](http://www.madhur.co.in/blog/2011/09/01/runningjekyllwindows.html), although this guy now has all-in-one portable installation file for windows [now](http://www.madhur.co.in/blog/2013/07/20/buildportablejekyll.html), but bandwith is precious in these areas :)

- 	Download RubyInstaller 1.93 (not 2.0) from http://rubyinstaller.org/downloads
-	on the same page, download the corresponding DevKit
-	install RubyInstaller to a directory without spaces, eg. `C:\Coding\Ruby`
-	run DevKit, meaning unwrap to a directory without spaces, eg. `C:\Coding\RubyDevKit`
-	run start > programs > Ruby 193 > "Start command prompt with ruby"
-	`cd C:\Coding\RubyDevKit`
-	`ruby dk.rb init`
-	`ruby dk.rb install`

### Install Git

[Git](http://en.wikipedia.org/wiki/Git_%28software%29) was already installed, otherwise download and install from http://git-scm.com/.

### Get Octopress from Git source

[Octopress] is an open-source framework around the [Jekyll](http://jekyllrb.com/) static site generate (also used by github Pages).

Right-click in folder where you want your blog site subfolder (`D:\Copy\Travel\Blog`) and select `Git Bash here` (otherwise start>programs>Git>"Git bash" and [`CD`](http://en.wikipedia.org/wiki/Cd_%28command%29) to directory):

-	`git clone git://github.com/imathis/octopress.git ken-b.github.io`
-	`cd ken-b.github.io`

### Install the ruby dependencies 

-	`gem install bundler`
-	`bundle install`

# First Time usage

- create on http://github.com a new repository called `ken-b.github.io`
- open and update the _config.yml file in `D:\Copy\Travel\Blog\octopress`, it's self-explanatory.

- install the default theme (still in the `D:\Copy\Travel\Blog\octopress` folder)
	- `rake install`

- setup github (only if newly created and thus empty repository)
	- `rake setup_github_pages` and enter `git@github.com:ken-b/ken-b.github.io.git`

- For site generation and deployment run
	- `rake generate`
	- `rake deploy`	

- Commit source for blog:
	- `git add .`
	- `git commit -m 'first setup'`
	- `git push origin source` 

**edit 13/12/2013:** I just saw that octopress handles this quite cleverly. Because GitHub does not allow jekyll plugins, octopress generates the site. The site itself is pushed under the master branch and used for the webpage, while the octopress code is under the source branch. Neat.

# Ongoing usage

### Start a new blog post


In a [command window][terminal] in the octopress folder 

	rake new_post["Title of the new post"]

will create a new [markdown](http://en.wikipedia.org/wiki/Markdown) file named `YYYY-MM-DD-title-of-new-post.markdown` in the `\octopress\source\_posts\` subfolder. Then edit this file with notepad, sublime or--as I do--the free [MarkdownPad 2](http://markdownpad.com).

When done, to preview run

	rake preview 

and check the preview on http://localhost:4000/.

### Editing posts


Markdown is [very easy to write and remember](http://web.archive.org/web/20040402182332/http://daringfireball.net/projects/markdown/), it's like writing in notepad but then [some magic happens](http://trevor-hopkins.com/fiction/miracle2.jpg) and--voilà--out comes a formatted site.	

There's a [plugin for adding images](http://octopress.org/docs/plugins/image-tag/) using

	{{ "{% img [class names] /path/to/image [width] [height] [title text [alt text]]" }} %}

and a [plugin for video's](http://octopress.org/docs/plugins/video-tag/) using

	{{ "{% video url/to/video [width height] [url/to/poster]" }} %}

### Deploying

If you're happy with the preview result, run

	rake gen_deploy

### Mapping

I used the forekd [jekyll-mapping](http://matthewowen.github.com/jekyll-mapping/) from [throughnothing](https://github.com/throughnothing/jekyll-mapping). I added an `if context['page']['mapping']['show']` statement in the ruby script (my first ruby coding ever!) to have the map only show when an extra subkey `show` is defined for the `mapping` key in YML of the post.

### Troubleshooting

If it does not seem to update, try `jekyll serve --trace`, which has more debugging output (I found out after misusing the image tag and not seeing the site update).

Also, don't use tabs in the YML header of your posts, only spaces to indent (that's about 1h of my life I won't get back :\ )

I tried fancyimage_tab.rb jekyll plugin, the old gallery_tab plugin, img_popup and some custom mix of the latter, none of which got working nicely. Finally I followed a German [blog](http://uli-heller.github.io/blog/2013/08/04/gallery/) and all went smoothly. They are efficient, ze germanz.

# TODO

* Adapt the rather boring default theme
* Find out what the possibilities are for class name with image plugin. So far I've seen `left`, `right` and `left half`. Hopefully there's a plugin for a picture album, don't want to use facebook for this (because not everyone's on it).
* Get the render_index_map working from jekyll-mapping. So far I've used the fork of `throughnothing`, but this does not include the full index map. 

[terminal]: http://en.wikipedia.org/wiki/System_console
[Octopress]: http://octopress.org