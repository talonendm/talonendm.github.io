---
layout: post
title: p5 games - template
subtitle: p5 template - how to create new repo from this template
tags:
  - git 
  - p5.js
  - template
comments: true
cover-img: /assets/pics/cover/photo/sunflower.JPG
thumbnail-img: /assets/pics/thumbnail/instagram/IMG_20160717_171645.jpg
published: true
---



### create new repo in github

<yourreponame>, e.g. onnenpyora

Add a README file: This is where you can write a long description for your project. Learn more.

in Bash do following commands:

~~~
cd git
git clone https://github.com/talonendm/onnenpyora.git
cd onnenpyora
git branch gh-pages
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

go to new [gh-page](https://talonendm.github.io/onnenpyora/) and test that it works...
