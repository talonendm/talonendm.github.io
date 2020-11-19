---
layout: post
title: My first blog post in github and short notes how to do it next time
subtitle: Jekyll blogging by Jaakko
cover-img: /assets/pics/wide/wide_silja_bella.PNG
thumbnail-img: /assets/pics/thumbnail/photo/hello_stockholm.JPG
share-img: /assets/pics/thumbnail/photo/kaktus.JPG
tags:
  - test
  - blog
published: true
---

## Why?

I had LinkedIn training organized by my employer. It was again encouraged to write blog posts etc., so here we go. I am passionated about data science and languages like R and Python. So those topics will be covered by this blog. In addition, I have created a lot of different projects in my past and being quite active again. My kids start to cope their selves and thus I am having more time. Now I can piece out data related stuff together. Let's see, if some projects / solutions help me to solve future challeges / goals e.g. at work. Being honest, time to time I need to use Google and find out the same simple solutions how to make simple models / plots. Probably in future I can just check it from my github pages.

In addition:
- Time to time I need to give "free" IT advice to my loved ones. One way to make this more efficient is provide link to my own blog.
- I need to take care of my wife, and children laptops. Some setups etc. So, own blog works as good reference and I don't need to use Google same things again and again.
- What else I could do during dark November evenings and nights than create code and write blog posts? As I mentioned before, I have a lot of different type of materials (code, scientific, Java games, Android games, 3D printing etc.) that I haven't commented or archived.
- I would like to inspire offspring in coding. I guess [p5.js](https://p5js.org/) should be good choice and proof them that coding can be fun and easy.
- I want create more or at least improve my code before it is stored under ice, see: [Archive Program](https://archiveprogram.github.com/)
- Follow and write down what's happening in areas of my interest
- Do simple and funny things too and time to time challenge myself with topics that are not easy for me
- etc.

## Create files into _posts/ folder

I found create github page and instructions how to create blog posts to my own github page [2]. First step was to fork [7] this repository and make my own edits as:

Create new file to _posts folder: https://github.com/talonendm/talonendm.github.io/tree/master/_posts
Blog post file name format is:
- YYYY-MM-DD-<"name of the post">.md

Edit post:
- Edit posts / files in github or in [Prose](https://prose.io/)
- File size limit 100mB / repo limit.


Use [Front Matter Block](https://jekyllrb.com/docs/front-matter/) describing meta data in each post.

Remember to add to meta data: 
- published: true

Other meta data fields:

~~~
---
layout: post
title: 
subtitle: 
cover-img: /assets/ ...
thumbnail-img: /assets/ ..
share-img: /assets/ ..
tags:
  - tag1
  - tag2
published: true
---
~~~

## Git
Update github pages (copy paste) [8]: 
Git bash commans [10]:

```
#!/bin/bash
pwd
cd /c/github/talonendm.github.io # your local path   
ls
git add . 
git commit -m "."         # e.g. picture added to assets/cover/ folder
git pull origin master    #  (if some changes have been made e.g. directly in the repo)
git push origin master
```

Or if sure that no changes in master..

```
#!/bin/bash
cd git/talonendm.github.io/
git status
git add .
git commit -m "."         # e.g. picture added to assets/cover/ folder
git push origin master
```
e.g.
```
#!/bin/bash
cd git/talonendm.github.io/
git status
git add .
git commit -m "git comments and changes"         # e.g. picture added to assets/cover/ folder
git push origin master
```



Update github pages (first time):

```
#!/bin/bash
mkdir git
git clone https://github.com/talonendm/talonendm.github.io.git
git add .
git commit -m "e.g. picture added to assets/cover/ folder"
git pull origin master     (if some changes have been made e.g. directly in the repo)
git push origin master
```
Update github pages (next time):
```
#!/bin/bash
git status
git add .
git commit -m "e.g. picture added to assets/cover/ folder"
git pull origin master     (if some changes have been made e.g. directly in the repo)
git push origin master
```

## Enable Issues to forked repo
Forking a repo on GitHub but allowing new issues on the fork.
- Fork a repo
- Go to the Settings page of your fork , e.g. https://github.com/talonendm/talonendm.github.io/settings
- Check the box next to Issues
- See: [stackoverflow.com](https://softwareengineering.stackexchange.com/questions/179468/forking-a-repo-on-github-but-allowing-new-issues-on-the-fork)

### Issues
Create issues at Github pages. 

[Link issue to commit](https://stackoverflow.com/questions/1687262/link-to-the-issue-number-on-github-within-a-commit-message#:~:text=In%20order%20to%20link%20the,in%20your%20git%20commit%20message.) as
```
git commit -m "keyboard added test #1"
```
see, e.g. [issue 1](https://github.com/talonendm/talonendm.github.io/issues/1)


## iFrame
An HTML iframe is used to display a web page within a web page. Unfortunately I don't have my first home page at Helsinki University of Technology. This p5.js is quite new experiment, but it looks similar as in good old days:

<iframe width="860" height="515" src="https://talonendm.github.io/p5js-page/ex1/" frameborder="0" allowfullscreen></iframe>
[5, 6]


## Google Analytics

https://analytics.google.com/analytics/

I read few blog posts to find out how to add Google Analytics into github pages, like:

- https://curtisvermeeren.github.io/2016/11/18/Jekyll-Google-Analytics.html
- https://desiredpersona.com/google-analytics-jekyll/
- https://michaelsoolee.com/google-analytics-jekyll/

But in practice, you just need to get your tracking id from settings:
```
UA-<numbers>-<number> 
```

add copy paste it to _config.yml file *without* parenthesis. 

```
# Fill in your Google Analytics gtag.js ID to track your website using gtag
#gtag: ""

# Fill in your Google Analytics ID to track your website using Google Analytics
#google_analytics: ""

# Google Tag Manager ID
#gtm: ""
```

to

```
# Fill in your Google Analytics gtag.js ID to track your website using gtag
#gtag: ""

# Fill in your Google Analytics ID to track your website using Google Analytics
#google_analytics: UA-<numbers>-<number> 

# Google Tag Manager ID
#gtm: ""
```




## Markdown

Blocks of code are either fenced by lines with three back-ticks [9] and add e.g. python or javascript after ticks:

Python code:
```python
import json
import decimal
import pandas as pd
print ('Hello, world!')
```


### References 

1. [How to edit and add new posts in Jekyll blog online - Tutorial 8](https://www.youtube.com/watch?v=E0RbrYSMw3g "youtube")
2. [daattali](https://github.com/daattali/beautiful-jekyll/ "beautiful-jekyll")
3. [Github repo quota](https://github.com/settings/repositories)
4. [Jekyll](https://github.com/jekyll/jekyll)
5. [iFrame to Jekyll](https://stackoverflow.com/questions/28617683/can-i-bring-in-a-custom-video-iframe-into-jekyll-markdown-blogs)
6. [Guest Tutorial #4: Matrix Digital Rain in p5.js with Emily Xie](https://www.youtube.com/watch?v=S1TQCi9axzg)
7. [Lesson 6. How to fork a repo in GitHub Intro version control git](https://www.earthdatascience.org/workshops/intro-version-control-git/about-forks/)
8. [Git commands](https://github.com/talonendm/notes/blob/master/gitcommands.txt)
9. [Markdown Cheatsheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet#code)
10. [Shell Comments](https://bash.cyberciti.biz/guide/Shell_Comments)