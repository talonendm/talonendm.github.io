---
layout: post
title: p5 games - template
subtitle: p5 template - how to create new repo from this template
tags:
  - git 
  - p5.js
  - github
  - github template
  - gh-pages
  - Christmaself
  - Katakana
comments: true
cover-img: /assets/pics/cover/photo/sunflower.JPG
thumbnail-img: /assets/pics/thumbnail/instagram/IMG_20160717_171645.jpg
published: true
---

# Create new repo in github

In this example "onnenpyora" repo was created and p5 template code files were copied into it.

Go to your GitHub pages, in my case: [https://github.com/talonendm/](https://github.com/talonendm/).
Create new repository: onnenpyora
Add a README file: This is where you can write a long description for your project.

Windows, start Git Bash and do the following commands:

~~~

cd git # or wherever you have your repositories
git clone https://github.com/talonendm/onnenpyora.git
cd onnenpyora
git branch gh-pages  # note this is not needed
git checkout gh-pages

git push -u origin gh-pages

cd ..

cp p5template/sketch.js onnenpyora/sketch.js
cp p5template/index.html onnenpyora/index.html
cp p5template/style.css onnenpyora/style.css

cd onnenpyora

git add .
git commit -m "template copied"
git push origin gh-pages

~~~

Go to new [gh-page](https://talonendm.github.io/onnenpyora/) and test that it works. P5.vscode is very useful for editing the code, see my notes [here](https://talonendm.github.io/2020-11-16-JStips/).





Chrome tips:

~~~
crtl shift i
application
see js code in browser
~~~


## lasergriddesign

Create new repository: lasergriddesign
Add a README file: This is where you can write a long description for your project.

Recommendation for license:
- If you want the least restrictions: The MIT License is the most permissive and easiest to integrate into other projects.
- If you want to protect against patent claims: Go for the Apache 2.0 License.
- If you want to ensure that derivatives remain open-source: Consider GPL 3.0.

When choosing a license, make sure you understand your goals and how you want others to interact with your code. GitHub provides a helpful interface when creating a new repository to select the license.

> GNU GPL v3.0 was selected


Windows, start Git Bash and do the following commands:

~~~

cd git # or wherever you have your repositories
git clone https://github.com/talonendm/lasergriddesign.git
cd lasergriddesign

# git branch gh-pages  # note this is not needed
# git checkout gh-pages
# git push -u origin gh-pages
# cd ..

cp p5template/sketch.js lasergriddesign/sketch.js
cp p5template/index.html lasergriddesign/index.html
cp p5template/style.css lasergriddesign/style.css

cd lasergriddesign

~~~

Edit files, e.g. update html-file with most recent js-packages, see [cdnjs](https://cdnjs.com/libraries/p5.js) for p5js.
For example, onnenpyora-repo uses old js-packages, and === is not recognized. (250301)

~~~

git add .
git commit -m "template copied and code changes done"
# Note: if multiple users, --- git push origin gh-pages
git push git@github-talonendm:talonendm/lasergriddesign

~~~

And app is hosted at: [https://talonendm.github.io/lasergriddesign/](https://talonendm.github.io/lasergriddesign/)


## Christmaself

gh-pages branch: [https://talonendm.github.io/christmaself/](https://talonendm.github.io/christmaself/)


## Katakana

Drawing instuctions for [Katakana](https://www.lexilogos.com/keyboard/katakana.htm) (japanese):

~~~

cd git # or wherever you have your repositories
git clone https://github.com/talonendm/katakana.git
cd katakana
git branch gh-pages
git checkout gh-pages

git push -u origin gh-pages

cd ..

git clone https://github.com/talonendm/p5template.git

cp p5template/sketch.js katakana/sketch.js
cp p5template/index.html katakana/index.html
cp p5template/style.css katakana/style.css

cd katakana

git add .
git commit -m "template copied"
git push origin gh-pages

~~~
Go to https://github.com/talonendm/katakana and change brach to gh-pages. Github Katakana repository was created on 28th of March, 2021.

## lippupeli

~~~

cd git # or wherever you have your repositories
git clone https://github.com/talonendm/lippupeli.git
cd lippupeli

# These are not needed, in settings as default
# git branch gh-pages
# git checkout gh-pages
# git push -u origin gh-pages

cd ..

git clone https://github.com/talonendm/p5template.git

cp p5template/sketch.js lippupeli/sketch.js
cp p5template/index.html lippupeli/index.html
cp p5template/style.css lippupeli/style.css

cd lippupeli

git add .
git commit -m "template copied"
git push origin gh-pages

# $ git push origin gh-pages
# remote: Invalid username or password.
# fatal: Authentication failed for 'https://github.com/talonendm/lippupeli.git/'

# you need: (multiple hosts in .ssh folder like "Host github-talonendm")
git push git@github-talonendm:talonendm/lippupeli

~~~




Go to https://github.com/talonendm/lippupeli and change brach to gh-pages. Github lippupeli repository was created on 2nd of February, 2024.

![b.01.Rijsttafel](/assets/pics/page/repo/lippupeligithub.jpg){: .mx-auto.d-block :}

