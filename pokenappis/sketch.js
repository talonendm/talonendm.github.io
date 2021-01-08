
window.addEventListener('keydown', function (e) {
  if (e.keyCode == 32 && e.target == document.body) {
    e.preventDefault();
  }
});


// space 32: https://stackoverflow.com/questions/22559830/html-prevent-space-bar-from-scrolling-page
// https://stackoverflow.com/questions/18522864/disable-scroll-down-when-spacebar-is-pressed-on-firefox/18525368


// debug tips: https://www.quora.com/Why-is-JavaScript-not-working-with-my-HTML#:~:text=the%20JavaScript%20console.-,Open%20your%20page%20in%20a%20browser%2C%20then%20open%20the%20developer,that%20appear%20in%20the%20console.
// CTRL- SHIFT i console

// words and keyboard: 5.11.2020
let value = 0;

let inconsolata;

// The midi notes of a scale
let notes = [60, 62, 64, 65, 67, 69, 71];

// https://creative-coding.decontextualize.com/text-and-type/
var sourceText = "life is pete and art is cool";

// idea: textbox where url can be copied. Anytext can be trained. E.g. asdf jklö asdf or thesis text ...

// production ideas:
// fixed words and nice graphics.
// v1) ...
// v2) https://gist.github.com/simsketch/1a029a8d7fca1e4c142cbfd043a68f19
// reference: pokemon.txt = https://gist.githubusercontent.com/simsketch/1a029a8d7fca1e4c142cbfd043a68f19/raw/84d6850cfb36fb8b1f3eaee7468a605fe85ed30e/pokemon.csv


let pokeword = [];
// let pokeletter = [];


var words = sourceText.split(" ");
var sana = "jaakko";

var time_letter = 0;
var pokemonpeli = true;

var vari = 'red';
var i_loop;
var time = 0;
var starttime = 0;
var game_running = true;
var errors = 0;
var points = 0;
var errorMinus = 2000; // 1 second
var letter_selected = 0;
var selected_word = 0;
var nappis = '';
var totalletters = 0;
var totalgametime = 0;
var numberOfWords;

var totalvaikeus = 0;


var fireworks = []; // https://codepen.io/elbori77/pen/zZLerM
var gravity;

var waitingstart = false;

// https://p5js.org/reference/#/p5/text
//function preload() {
//  inconsolata = loadFont('assets/inconsolata.otf');
//}

let table;
let character_points;


// -----------------------------------------------------------------------------------
function preload() {
  // https://p5js.org/reference/#/p5/loadTable
  //my table is comma separated value "csv" and has a header specifying the columns labels
  table = loadTable('p5/nappistaituri/pokemon.txt', 'csv', 'header');
  character_points = loadTable('p5/nappistaituri/character_points.txt', 'csv', 'header');
  // myFont = loadFont('fonts/broken15/BROKEN15.TTF'); // location pokenappis/
  // source: https://www.dafont.com/pokemon.font
  myFont = loadFont('fonts/pokemon/Pokemon Solid.ttf');

  // testing in local not working ;:
  // https://stackoverflow.com/questions/20035101/why-does-my-javascript-code-receive-a-no-access-control-allow-origin-header-i
  //myFont = loadFont('https://github.com/talonendm/talonendm.github.io/blob/master/pokenappis/fonts/broken15/BROKEN15.TTF'); // location pokenappis/
}
// -----------------------------------------------------------------------------------

// -----------------------------------------------------------------------------------
// SETUP
// -----------------------------------------------------------------------------------
function setup() {
  // createCanvas(700, 400); //, WEBGL);
  const canvas = createCanvas(720, 400);
  canvas.parent('sketch-holder-jt')

  frameRate(30); // no need to have 60.

  // textFont('georgia');
  textFont(myFont);
  textSize(width / 14);
  textAlign(LEFT, CENTER);

  print(table.getRowCount() + ' total rows in table');
  print(table.getColumnCount() + ' total columns in table');
  table.addColumn('vaikeus'); // https://p5js.org/reference/#/p5.Table/addColumn
  print(table.getColumnCount() + ' total columns vaikeus in table');

  if (pokemonpeli) words = table.getColumn('NAME');

  for (let r = 0; r < words.length; r++) { //words.length; r++) {
    words[r] = words[r].toLowerCase();
    var vaikeus = 0;
    // print(words[r].length);
    // Each character is looped here: double class or just object for each word?
    for (let r2 = 0; r2 < words[r].length; r2++) {
      // print(words[r].charAt(r2));
      i_loop = 0;
      while (words[r].charAt(r2) != character_points.getString(i_loop, 0) & i_loop < character_points.getRowCount() - 1) {
        i_loop = i_loop + 1;
        // print("mo: " + i_loop);
      }
      if (i_loop < character_points.getRowCount()) {
        // print("found:" + character_points.getString(i_loop,0) + " points: " + character_points.getString(i_loop,1))  ;
        var lisapiste = character_points.getString(i_loop, 1);
      } else {
        print("no found");
        var lisapiste = 20;
      }
      vaikeus = vaikeus + int(lisapiste);
    }
  }
  // -----------------------------------------------------------------------------------

  //numberOfWords = 2; // words.length
  //shuffle(words, true); // https://editor.p5js.org/L05/sketches/e1yqoWxrk
  //for (let i = 0; i < numberOfWords ; i++) {
  //  pokeword.push(new Pokeword(i, words[i]));
  //}

  //restartGame();
  getReadyForGame();


  gravity = createVector(0.03, 0.22);


  // ----------------------------------------------------------------------------------- Button
  // button - restart game
  let div = createDiv("Write words:")
  div.id("instructions");
  let button = createButton("Start again");
  button.parent("instructions");
  // Trigger automatically playing
  button.mousePressed(function () {
    // restartGame();
    getReadyForGame();
  });
  // -----------------------------------------------------------------------------------

  // ----------------------------------------------------------------------------------- Song
  // https://editor.p5js.org/p5/sketches/Hello_P5:_song
  // A triangle oscillator
  osc = new p5.TriOsc();
  // Start silent
  osc.start();
  osc.amp(0);
  // -----------------------------------------------------------------------------------

  if (false) {
    print("words:")
    print(words)
    print('z'.charCodeAt(0))
    print('å'.charCodeAt(0))
    print('ä'.charCodeAt(0))
    print('ö'.charCodeAt(0))
    print(' '.charCodeAt(0)) //32
  }
}
// -----------------------------------------------------------------------------------


// -----------------------------------------------------------------------------------
class Pokeword {
  constructor(id_, name_) {
    this.id = id_;
    this.name = name_;
    this.vaikeus = 0;
    this.pokeletter = [];
    this.kirjainvali = 37;

    // this.kirjaimet = [];
    for (let r2 = 0; r2 < this.name.length; r2++) {
      // print(words[r].charAt(r2));
      i_loop = 0;
      // this.kirjaimet[r2] = this.name.charAt(r2);
      // find word from point table: loop until letter found ---
      while (this.name.charAt(r2) != character_points.getString(i_loop, 0) & i_loop < character_points.getRowCount() - 1) {
        i_loop = i_loop + 1;
        // print("mo: " + i_loop);
      }
      if (i_loop < character_points.getRowCount()) {
        // print("found:" + character_points.getString(i_loop,0) + " points: " + character_points.getString(i_loop,1))  ;
        var lisapiste = character_points.getString(i_loop, 1);
      } else {
        print("no found");
        var lisapiste = 20;
      }
      this.vaikeus = this.vaikeus + int(lisapiste);

      this.pokeletter.push(new Pokeletter(this.name, this.name.charAt(r2), (r2 + 1) * this.kirjainvali + width / 2 - (this.name.length / 2 * this.kirjainvali), height / 2));




    }
  }

  showWord() {
    for (let r2 = 0; r2 < this.name.length; r2++) {
      this.pokeletter[r2].showLetter(r2 == letter_selected);
    }
  }
  wrongKey() {
    this.pokeletter[letter_selected].changeLetterColor();
  }

  getLength() {
    return this.name.length;
  }

  getLetter() {
    var kirjainpalauta = this.pokeletter[letter_selected].getLetterChar();
    // print(kirjainpalauta);
    return kirjainpalauta;
  }

  getLetterX() {
    var kirjainpalauta = this.pokeletter[letter_selected].getLetterX();
    return kirjainpalauta;
  }
  getLetterY() {
    var kirjainpalauta = this.pokeletter[letter_selected].getLetterY();
    return kirjainpalauta;
  }



  getVaikeus() {
    return this.vaikeus;
  }

}
// -----------------------------------------------------------------------------------

// -----------------------------------------------------------------------------------
// call once or call for each word to have all the words in the same place.
// -----------------------------------------------------------------------------------
class Pokeletter {
  constructor(word_, letter_, x_, y_) {
    this.word = word_;
    this.kirjain = letter_; // met = [];
    //for (let r2 = 0; r2 < this.word.length; r2++) {
    this.kirjain = letter_; // this.word.charAt(r2);
    this.x = x_; // r2 * 20;
    this.y = y_;
    this.color = 'rgba(10,239,19,0.5)';
    this.maincolor = 'rgba(10,14,19,0.5)';
    this.fonttikoko = 48;
    this.max_fonttikoko = 210;
    //}
  }
  showLetter(selectedpokeletter = false) {
    textFont(myFont);
    var tekstikoko = this.fonttikoko;
    textAlign(CENTER, CENTER);
    if (selectedpokeletter) {

      tekstikoko = tekstikoko + min(this.max_fonttikoko, time_letter * 5); // abs(sin(time_letter / 20) * 60);
      if (this.y > 100) {
        this.y = this.y - 2;
      }

      textSize(tekstikoko);
      fill(this.color);
      if (this.kirjain == " ")
        text("_", this.x - 2, this.y - 2);
      else
        text( this.kirjain.toUpperCase(), this.x - 2, this.y - 2);

      fill(this.maincolor);

      if (this.kirjain == " ")
        text("_", this.x, this.y);
      else
        text(this.kirjain.toUpperCase(), this.x, this.y);

    } else {
      textSize(tekstikoko);
      // tekstikoko = 144 + sin(time / 3000) * 40;
      fill(100);
      text(this.kirjain, this.x, this.y);
    }
  }
  changeLetterColor() {
    if (this.y > 100) {
      this.y = this.y - 10;
    }
    this.color = 'rgba(210,39,19,0.8)';
  }

  getLetterChar() {
    return this.kirjain;
  }

  getLetterX() {
    return this.x;
  }

  getLetterY() {
    return this.y;
  }


}
// -----------------------------------------------------------------------------------



// -----------------------------------------------------------------------------------
// LOOP
// -----------------------------------------------------------------------------------
function draw() {
  background(255); // white



  if (waitingstart) {
    time = millis();
    if (starttime>time) {
      stroke(255);
      fill(0,244,3);
      textSize(194);
      textAlign(CENTER,CENTER);
      text(nfc((starttime - time)/1000 + 1,0), width/2, height/2)
    } else {
      waitingstart = false;
      starttime = time;
      restartGame();
    }
  } else {



    strokeWeight(2);
    for (var i = fireworks.length - 1; i >= 0; i--) {
      fireworks[i].update();
      fireworks[i].show();
      if (fireworks[i].done()) {
        fireworks.splice(i, 1);
        // print("test");
      }

    }

    if (game_running) {
      time_letter = time_letter + 1;
      time = millis();



      strokeWeight(1);
      stroke(149);
      pokeword[selected_word].showWord(); // show pokeword as letters






      // length of selected word:
      textFont(myFont);
      textSize(width / 17);
      textAlign(LEFT, BOTTOM);
      //text((letter_selected + 1) + "/" + words[selected_word].length, 20, height - 20)
      text((letter_selected + 1) + "/" + pokeword[selected_word].getLength(), 20, height - 20)

      textAlign(CENTER, BOTTOM);
      text("words: " + (selected_word + 1) + "/" + numberOfWords, width / 2, height - 20)

      textAlign(RIGHT, BOTTOM);
      text(nfc((time - starttime) / 1000, 2), width - 20, height - 20); // show milliseconds divided by 1000 one decimal


      //fill(vari);
      //textAlign(RIGHT, TOP);
      //text(nappis, width - 20, 30);

    } else {
      // game stopped:

      colorMode(HSB);
      if (random(1) < 0.04) {
        fireworks.push(new Firework(random(0, width), height, false));
      }



      colorMode(RGB);

      textAlign(LEFT, BOTTOM);
      // totalvaikeus
      // -----------------------------------------------------------------------------------
      strokeWeight(1);
      stroke(149 + random(2, 100));
      text("totalvaikeus = " + totalvaikeus, 200, 100);
      text(`Total game time:${nfc(totalgametime / 1000, 2)} seconds.`, 200, 150);
      text("Points = " + nfc(points, 0) + ". Total letters:" + totalletters + ".", 200, 200); // milliseconds, no decimals needed. 
      text("Errors = " + errors, 200, 250);
      text("Press (ESC) and start new game", 200, 300);
      // -----------------------------------------------------------------------------------
    }
  }

}
// -----------------------------------------------------------------------------------



// -----------------------------------------------------------------------------------

// -----------------------------------------------------------------------------------
class Particle {
  constructor(x, y, hu, firework, letterfire) {
    this.pos = createVector(x, y);
    this.firework = firework;
    this.lifespan = 95;
    this.hu = hu;

    if (this.firework) {
      if (letterfire) {
        this.vel = createVector(random(-2, 2), random(0, -2));
      } else {
        this.vel = createVector(0, random(-14, -8));
      }

    } else {
      this.vel = p5.Vector.random2D();
      this.vel.mult(random(2, 10));
    }

    this.acc = createVector(0, 0);
  }
  applyForce = function (force) {
    this.acc.add(force);
  };

  update = function () {
    if (!this.firework) {
      this.vel.mult(0.9);
      this.lifespan -= 4;
    }
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  };
  done = function () {
    if (this.lifespan < 0) {
      return true;
    } else {
      return false;
    }
  };
  show = function () {
    colorMode(HSB);
    if (!this.firework) {
      strokeWeight(2);
      stroke(this.hu, 255, 255, this.lifespan);

      fill(0,255,0);
      //push();
      //translate(this.pos.x * 0.8, this.pos.y * 0.5);
      //rotate(frameCount / -100.0);
      //mstar(0, 0, 30, 70, 5);
      //pop();


    } else {
      strokeWeight(4);
      stroke(this.hu, 255, 255);
    }
    point(this.pos.x, this.pos.y);
    colorMode(RGB);
  };


  
}

// -----------------------------------------------------------------------------------
// KEYBOARD -----------------------------------------
function keyPressed() {
  let keyIndex = -1;
  //print(key.charCodeAt(0));
  // scandinavian letters, just ensuring that characters are not messed up and thus using keycodes --------------
  if ((key >= 'a' && key <= 'z') | (key.charCodeAt(0) == 69) | (key.charCodeAt(0) == 32) | (key.charCodeAt(0) == 45) | (key.charCodeAt(0) >= 48) & (key.charCodeAt(0) <= 57) | (key.charCodeAt(0) == 228) | (key.charCodeAt(0) == 229) | (key.charCodeAt(0) == 246)) {
    keyIndex = key.charCodeAt(0) - 'a'.charCodeAt(0);
  }
  if (game_running) {







    if (keyIndex === -1) {
      // If it's not a letter key, clear the screen
      background(230);
      vari = 'brown';
    } else {
      // print(key)
      nappis = key;
      // Check if pressed character is correct, only a--z --------------------------------

      //print(pokeword[selected_word].getLetter(letter_selected));

      if (nappis == pokeword[selected_word].getLetter()) {


        fireworks.push(new Firework(pokeword[selected_word].getLetterX(), pokeword[selected_word].getLetterY(), true));
        // next:
        letter_selected = letter_selected + 1;
        totalletters = totalletters + 1;
        vari = 'green';
        time_letter = 0;



        totalgametime = time - starttime;

        totalvaikeus = 0;
        for (let i = 0; i < numberOfWords; i++) {
          totalvaikeus = totalvaikeus + pokeword[i].getVaikeus();

        }


        // collect character statistics: avg. time to press a,b,c, ....
        if (words[selected_word].length == letter_selected) {
          selected_word = selected_word + 1;
          letter_selected = 0;

          if (selected_word == numberOfWords) {
            game_running = false;
            points = max(0, numberOfWords * 2000 + totalvaikeus * 500 - totalgametime - errorMinus * errors);

            // peli päättyy
            postRequest();


          }
          if (value === 0) {
            value = 255;
          } else {
            value = 0;
          }
        }
      } else {
        // wrong character pressed ------------
        vari = 'red';
        pokeword[selected_word].wrongKey();
        errors = errors + 1;

        // Map mouse to the key index
        let key = floor(map(mouseX, 0, width, 0, notes.length));
        playNote(notes[key]);
        osc.fade(0, 0.5);
      }
    }
  } else {
    if (key.charCodeAt(0) == 69) { // (key == ESCAPE) { // https://p5js.org/reference/#/p5/keyPressed
      //restartGame();
      getReadyForGame();
    }
  }
}
// -----------------------------------------------------------------------------------



// -----------------------------------------------------------------------------------
// get ready
function getReadyForGame() {
  var waitforstart = 3000;
  waitingstart = true;
  time = millis();
  starttime = waitforstart + time;
}


// -----------------------------------------------------------------------------------


function postRequest_bak() {  // https://www.geeksforgeeks.org/p5-js-httpdo-function/
  //clear(); 
  
  // Do a POST request to the test API 
  let api_url = 'https://api.apispreadsheets.com/data/3630/'; 
  
  // Example POST data 
  let postData = { player: "pokepete", points: 10, timestamp: "2021-01-01T18:25:43.511Z" }; 
  
  httpDo(api_url, "POST", "json", postData, function (response) { 
    print("Data returned from API"); 
  
    print("The ID in the data is: " + response.player); 
    print("The Name in the data is: " + response.points); 
    print("The Email in the data is: " + response.timestamp); 
  }); 
 
} 
function postRequest() {
  var data = {
    player: 'pokepete', 
    points: 10, 
    timestamp: '2021-01-01T18:25:43.511Z'
  }
  let api_url = 'https://api.apispreadsheets.com/data/3630/'; 
  httpPost(api_url, data, finished);
}
  



function finished(response) {
  console.log(response); // https://github.com/shiffman/itp-networked-media/wiki/GET,-POST-with-p5
}






// -----------------------------------------------------------------------------------
// call after pressing
function restartGame() {
  game_running = true;
  selected_word = 0;
  letter_selected = 0;
  totalletters = 0;
  errors = 0;
  starttime = time;
  time_letter = 0;

  print("restartgame()")
  numberOfWords = 3; // words.length
  shuffle(words, true); // https://editor.p5js.org/L05/sketches/e1yqoWxrk


  pokeword.splice(0); // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice
  for (let i = 0; i < numberOfWords; i++) {
    pokeword.push(new Pokeword(i, words[i]));
  }
}
// -----------------------------------------------------------------------------------


// -----------------------------------------------------------------------------------
// A function to play a note: [https://editor.p5js.org/p5/sketches/Hello_P5:_song]
function playNote(note, duration) {
  osc.freq(midiToFreq(note));
  // Fade it in
  osc.fade(0.5, 0.2);

  // If we sest a duration, fade it out
  if (duration) {
    setTimeout(function () {
      osc.fade(0, 0.2);
    }, duration - 50);
  }
}
// -----------------------------------------------------------------------------------


// -----------------------------------------------------------------------------------
// Errors:
// The AudioContext was not allowed to start. It must be resumed (or created) after a user gesture on the page. https://goo.gl/7K7WLu
// DevTools failed to load SourceMap: Could not load content for https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/addons/p5.sound.min.js.map: HTTP error: status code 404, net::ERR_HTTP_RESPONSE_CODE_FAILURE
// https://github.com/processing/p5.js-sound/issues/249 <-- worked!
function touchStarted() {
  if (getAudioContext().state !== 'running') {
    getAudioContext().resume();
  }
}
// -----------------------------------------------------------------------------------
class Firework {
  constructor(x_, y_, letterfire_) {
    this.hu = random(255);


    this.fx = x_;
    this.fy = y_;
    this.letterfire = letterfire_;

    //print(this.fx);

    this.firework = new Particle(this.fx, this.fy, this.hu, true, this.letterfire);
    this.exploded = false;
    this.particles = [];

  }

  done = function () {
    if (this.exploded & this.particles.length == 0) {
      return true;
    } else {
      return false;
    }
  };
  update = function () {
    if (!this.exploded) {
      // print("updating")
      this.firework.applyForce(gravity);
      this.firework.update();
      if (this.firework.vel.y >= 0) {
        this.exploded = true;
        this.explode();
      }
    }
    for (var i = this.particles.length - 1; i >= 0; i--) {
      this.particles[i].applyForce(gravity);
      this.particles[i].update();
      if (this.particles[i].done()) {
        this.particles.splice(i, 1);
      }
    }
  };

  explode = function () {
    let particlesN = 200;
    for (var i = 0; i < particlesN; i++) {
      var p = new Particle(this.firework.pos.x, this.firework.pos.y, this.hu, false); // last is particle not firework = flase
      this.particles.push(p);
    }
  };
  show = function () {
    if (!this.exploded) {
      this.firework.show();
    }
    for (var i = this.particles.length - 1; i >= 0; i--) {
      this.particles[i].show();
    }
  };

}