---
layout: post
title: Ball Rotation
subtitle: the game
tags:
  - p5
  - WEBGL
comments: false
cover-img: /assets/pics/cover/screenshot/widedices.png
thumbnail-img: /assets/pics/thumbnail/screenshot/dices.png
published: true
---

Ball rotation game. p5.js rotation and 3d experiments. Play game [here](https://talonendm.github.io/ballrotation/).

# Ball Rotation

Reference:

## Introduction

Mobile game, ball on surface. Ball defined as [sphrere](https://p5js.org/reference/#/p5/sphere), [texture](https://p5js.org/reference/#/p5/texture) by V.

Move object:

- [rotationX](https://p5js.org/reference/#/p5/rotationX)
- [pRotationX](https://p5js.org/reference/#/p5/pRotationX)
- 2D rotation experiments available [here](https://talonendm.github.io/p5rotation/).

## Setup

Create repo ([github](https://github.com/talonendm/ballrotation)). Preferences already correct, *gh-pages* created as default. Create readme and .gitignore (java).

~~~javascript
git clone https://github.com/talonendm/ballrotation.git
~~~

### Geolocation

- p5 experiments [maps](https://editor.p5js.org/haques/collections/1cl8QSyUf)
- A double representing the velocity of the device in meters per second.
- geodistance [p5 - calcgeodistance](https://github.com/bmoren/p5.geolocation#calcgeodistance). Online [calculation - www.movable-type.co.uk](https://www.movable-type.co.uk/scripts/latlong.html).


~~~javascript

navigator.geolocation.getCurrentPosition(
  function(position) {
    text("speed: " + position.coords.speed, 5, 10);
    text("heading: " + round(position.coords.heading), 5, 40); // heading in degrees
  },

    // Optional error callback
    function(error){
        /* 
        Error object
        error = {
            code - Error code representing the type of error 
                    1 - PERMISSION_DENIED
                    2 - POSITION_UNAVAILABLE
                    3 - TIMEOUT

            message - Details about the error in human-readable format.
        }
        // auto indect in vscode: shift-alt-f 
        */
    }
);

~~~


