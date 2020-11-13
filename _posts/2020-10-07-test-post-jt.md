---
layout: post
title: My first blog post in github and short notes how to do it next time
subtitle: by jaakko
cover-img: /assets/pics/wide/wide_silja_bella.PNG
thumbnail-img: /assets/img/hello_world.jpeg
share-img: /assets/img/hello_world.jpeg
tags:
  - test
  - blog
published: true
---

## Why?

I had LinkedIn training organized by my employer. It was again encouraged to write blog posts etc., so here we go. I am passionated about data science and languages like R and Python. So those topics will be covered by this blog. In addition, I have created a lot of different projects in my past and being quite active again. My kids start to cope their selves and thus I am having more time. Now I can piece out data related stuff together. Let's see, if some projects / solutions help me to solve future challeges / goals e.g. at work. Being honest, time to time I need to use Google and find out the same simple solutions how to make simple models / plots. Probably in future I can just check it from my github pages.

## Create files into _posts/ folder

I found create github page and instructions how to create blog posts to my own github page [2]. First step was to fork [7] this repository and make my own edits as:

Create new file to _posts folder: https://github.com/talonendm/talonendm.github.io/tree/master/_posts
Blog post file name format is:
- YYYY-MM-DD-<"name of the post">.md

Edit post:
- Edit posts / files in github or in [Prose](https://prose.io/)
- File size limit 100mB / repo limit.

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
git commit -m ""         # e.g. picture added to assets/cover/ folder
git pull origin master    #  (if some changes have been made e.g. directly in the repo)
git push origin master
```

Or if sure that no changes in master..

```
#!/bin/bash
git add .
git commit -m ""         # e.g. picture added to assets/cover/ folder
git push origin master
```
e.g.
```
#!/bin/bash
git add .
git commit -m "git comments and changes"         # e.g. picture added to assets/cover/ folder
git push origin master
```



Update github pages (first time):

```
#!/bin/bash
git clone https://github.com/talonendm/talonendm.github.io.git
git add .
git commit -m "e.g. picture added to assets/cover/ folder"
git pull origin master     (if some changes have been made e.g. directly in the repo)
git push origin master
```

## iFrame
An HTML iframe is used to display a web page within a web page. Unfortunately I don't have my first home page at Helsinki University of Technology. This p5.js is quite new experiment, but it looks similar as in good old days:

<iframe width="860" height="515" src="https://talonendm.github.io/p5js-page/ex1/" frameborder="0" allowfullscreen></iframe>
[5, 6]


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