---
layout: post
title: Processing - Helicopter
subtitle: Java
tags:
  - Processing
  - Java
  - very old code
  - JS
  - 2012
  - processing.js
  - notebooklm
comments: true
cover-img: /assets/pics/cover/screenshot/helicopter.JPG
thumbnail-img: /assets/pics/thumbnail/screenshot/helicopter.JPG
published: true
---
# Helicopter game

Play game in full screen here: [Helicopter Game](http://talonendm.github.io/helicopter/helikopteripeli2) and without instructions panel here: [Helicopter Game 1](https://talonendm.github.io/helicopter/helikopteripeli).
Note: Press START NEW GAME in the bottom of canvas to activate keyboard.

## Note

a two-player combat game titled "Helicopter 2012." It primarily consists of Processing language code, defining game mechanics, graphics rendering, and user interactions. The code establishes global variables for game elements like helicopter size, environmental factors (gravity, air resistance, clouds, sun), and player-specific attributes such as energy and ammunition. It details setup and draw functions to initialize the game canvas and continuously update the game state, along with a HLine class that manages individual helicopter properties and actions, including movement, firing, and collision detection. The source also specifies keyboard controls for each player and mouse interactions for game functions, indicating a combat simulation where players control helicopters to engage each other.

### how

- copy code
- analyze, create mindmap
- notebook lm (ja.ta), download: D / notebooklm wav
  - open with convert to mp3 with VLC player (250625)
    - Convert CTRL + R -> Helicopter 2012_ A Two-Player Combat Game.mp3
    - upload to [podbean ta.dm](https://talonendm.podbean.com/e/helicopter-2012/)

## Coding memories
The helicopter game is based on original Turbo Pascal Helicopter game. 
![HELI.exe](/assets/pics/page/screenshot/HELIpas.JPG){: .mx-auto.d-block :}
As you can see, game has happier design as the first original game. However, original game had also computer "AI" canons in both sides and automatically generated maps.
Simple physics and mathematics (sin, cos etc.) were implemented with following parameters:
~~~
int painovoima = 1.5;//0.01;//1;   
int ilmanvastus = 0.92;
int kaantyykerralla = PI/32;
int panoksensatunnaisuus = 0.01;  // 1 prossa etäisyyden mukaan
int kaasuaskel = 0.4;
~~~

Something is still available about my experimental learning process (conversion from Pascal to Java) (8 years ago, see [test application](https://talonendm.github.io/helicopter/jaakko2).

I tried to use iframe on this page, but without luck. Something about [iframe](https://stackoverflow.com/questions/325273/make-iframe-to-fit-100-of-containers-remaining-height)s. If not working, probably id in pde-file to canvas in html needed.
This was not working:
~~~
<iframe src="http://talonendm.github.io/helicopter/" frameborder="0"></iframe>
~~~


## Git stuff

Local server is needed to run this game when playing offline. 
However, game can be played online and in github we just need to create gh-pages for repo, see e.g. [How to show html or e.g. Java based game in Github](https://stackoverflow.com/questions/8446218/how-to-see-an-html-page-on-github-as-a-normal-rendered-html-page-to-see-preview).
Code example in helicopter [readme](https://github.com/talonendm/helicopter).