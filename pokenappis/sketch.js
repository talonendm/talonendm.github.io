// todo:
// numerical input: https://editor.p5js.org/kll/sketches/6ggb0_7uY
// number of games


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


// Date format -------------------------------------------------
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleDateString
// and options for time:
//https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date/toLocaleTimeString

const date_options = {
  weekday: 'long',
  year: 'numeric',
  month: 'long',
  day: 'numeric',
  hour: '2-digit',
  minute: '2-digit'
};

let nappaimisto = [];

let pokeword = [];
let pokeword_all = [];
// let pokeletter = [];

var yourData;
var words = sourceText.split(" ");
var sana = "jaakko";

var time_letter = 0;
var pokemonpeli = true;

var level_selected = 10;

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
var avg_number_of_letters = 10;
var pokepoints = [];
var fireworks = []; // https://codepen.io/elbori77/pen/zZLerM
var buttonspeeds = [];
var edaika; // = millis();
var gravity;
var levellei = 15;
var waitingstart = false;

var letter_y_location = 490;

var enkka_yhtaika = 99999;

// https://p5js.org/reference/#/p5/text
//function preload() {
//  inconsolata = loadFont('assets/inconsolata.otf');
//}

let table;
let character_points;

let inp_playername; // global

// -----------------------------------------------------------------------------------
function preload() {
  // https://p5js.org/reference/#/p5/loadTable
  //my table is comma separated value "csv" and has a header specifying the columns labels
  table = loadTable('p5/nappistaituri/pokemon.txt', 'csv', 'header');
  character_points = loadTable('p5/nappistaituri/character_points.txt', 'csv', 'header');
  // myFont = loadFont('fonts/broken15/BROKEN15.TTF'); // location pokenappis/
  // source: https://www.dafont.com/pokemon.font
  myFont = loadFont('fonts/pokemon/Pokemon.TTF');


  // updateHighscores();

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
  const canvas = createCanvas(720, 650);
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


  // shuffle(words, true); // https://editor.p5js.org/L05/sketches/e1yqoWxrk

  // ALL WORDS: this is created for later filtering..
  pokeword_all.splice(0); // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice
  for (let i = 0; i < words.length; i++) {
    pokeword_all.push(new Pokeword(i, words[i]));
  }



  i_loop = -1;
  while (i_loop < character_points.getRowCount() - 1) {
    i_loop = i_loop + 1;
    nappaimisto[i_loop] = new Nappaimisto(character_points.getString(i_loop, 0), int(character_points.getString(i_loop, 1)), int(character_points.getString(i_loop, 2)), int(character_points.getString(i_loop, 3)), int(character_points.getString(i_loop, 4)));
  }




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
  button.parent("place_start");
  // Trigger automatically playing
  button.mousePressed(function () {
    // restartGame();
    getReadyForGame();
  });
  // -----------------------------------------------------------------------------------
  let button2 = createButton("Highscores");
  button2.parent("place_highscore");
  // Trigger automatically playing
  button2.mousePressed(function () {
    updateHighscores();
    print(yourData);
  });


  inp_playername = createInput('pokenappis'); // https://p5js.org/reference/#/p5/createInput
 // inp_playername.input(myInputEvent); // functio tarvitaessa
  inp_playername.parent("place_playername");
  
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



function updateHighscores() {
  fetch("https://api.apispreadsheets.com/data/3630/").then(res => {
    if (res.status === 200) {
      // SUCCESS
      res.json().then(data => {
        yourData = data
      }).catch(err => console.log(err))
    }
    else {
      // ERROR
    }
  })
  //print(yourData.data.length);
  //yourData = sort(yourData.data.points);
  // sorttaaminen hankalaa...

  pokepoints.splice(0); // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice
  for (let i = 0; i < yourData.data.length; i++) {
    pokepoints.push(new Pokepoint(yourData.data[i].player, yourData.data[i].points, yourData.data[i].timestamp));
  }


  // print(pokepoints.points);
  // print(yourData.data.points);


  var pogot = [];
  var paiva = [];
  for (var i = 0; i<pokepoints.length; i++) {
    pogot[i] = pokepoints[i].points;
    paiva[i] = pokepoints[i].timestamp;
  }

  // ---------------------------------------------------------------------
  // chart.js
  // https://editor.p5js.org/zahrak/sketches/HJZi_iInz
  // more data to chart, see: view-source:https://www.chartjs.org/samples/latest/scales/time/line.html
  // https://www.chartjs.org/samples/latest/scales/time/line.html
  var ctx = document.getElementById('myChart').getContext('2d');
  var chart = new Chart(ctx, {
      // The type of chart we want to create
      type: 'line',
  
      // The data for our dataset
      data: {
          labels: paiva,
          datasets: [{
              label: "Points",
              backgroundColor: 'rgb(255, 99, 132)',
              borderColor: 'rgb(255, 99, 132)',
              data: pogot,
          }]
      },
  
      // Configuration options go here
      options: {}
  });



}

class Pokepoint {
  constructor(name_, points_, timestamp_) {
    this.name = name_;
    this.timestamp = timestamp_;
    this.points = int(points_);
  }
  

  getHighscore() {
    // not implemented..
  }

}

// -----------------------------------------------------------------------------------
// liukuvadata kerays
// -----------------------------------------------------------------------------------
class Buttonspeed {
  constructor(millitime_) {
    this.millitime = millitime_;
  }
  getAvgSpeed() {
    var yhtaika = 0;
    for (let r2 = 0; r2 < buttonspeeds.length; r2++) {
      yhtaika = yhtaika + buttonspeeds[r2].millitime;
    }
    yhtaika = yhtaika /  buttonspeeds.length;
    return(yhtaika);
  }
  getTime() {
    return this.millitime;
  }
}
// -----------------------------------------------------------------------------------



// -----------------------------------------------------------------------------------



// -----------------------------------------------------------------------------------
// keyboard
// -----------------------------------------------------------------------------------
class Nappaimisto {



  constructor(merkki_, points_, x_, y_, finger_) {
    this.perusfonttikoko = 28;
    this.vjust = 55;
    this.hjust = 70;
    this.xlev = 1.6;
    this.ylev = 1.6;
    if (merkki_ == 'pilkku') {
      this.character = ',';
    } else if (merkki_ == 'space') {
      this.character = ' ';
      this.xlev = 11.5;
    } else {
      this.character = merkki_;
    }

    this.points = points_;
    this.x = x_;
    this.y = y_;
    this.nappis_size = 27;

    this.fingercolor = color(finger_*20, finger_* 120 % 250, 240 - finger_*20);

  }

  show(target_, isPressed = false) {

    rectMode(CORNER); // https://p5js.org/reference/#/p5/rectMode
    strokeWeight(2);
    stroke(this.fingercolor);
    noFill();
    rect(this.x * this.nappis_size + this.hjust - this.nappis_size / 2,
      this.y * this.nappis_size + this.vjust - this.nappis_size / 2,
      this.xlev * this.nappis_size, this.ylev * this.nappis_size);


    var isTarget = target_ == this.character;


    textAlign(CENTER, CENTER);

    if (isTarget | isPressed) {


      fill(this.fingercolor);

      rect(this.x * this.nappis_size + this.hjust - this.nappis_size / 2,
        this.y * this.nappis_size + this.vjust - this.nappis_size / 2,
        this.xlev * this.nappis_size, this.ylev * this.nappis_size);

      stroke(40);
      fill(0);
      textSize(this.perusfonttikoko * (1 + random(46, 60) / 100) );
      fill(255);
      textSize(this.perusfonttikoko * (1 + random(46, 60) / 100) );
      stroke(255);
      text(this.character.toUpperCase(), this.x * this.nappis_size + this.hjust, this.y * this.nappis_size + this.vjust);
      stroke(0);
      fill(0);

    } else {
      fill(200);
      stroke(120);
      textSize(this.perusfonttikoko);
    }

    text(this.character.toUpperCase(), 4+this.x * this.nappis_size + this.hjust, 4+this.y * this.nappis_size + this.vjust);

   
   
  }
}
// -----------------------------------------------------------------------------------




// -----------------------------------------------------------------------------------
class Pokeword {
  constructor(id_, name_) {
    this.id = id_;
    this.name = name_;
    this.vaikeus = 0;
    this.vaikeuslevel = 0;
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
      this.vaikeuslevel = max(this.vaikeuslevel, int(lisapiste));

      this.pokeletter.push(new Pokeletter(this.name, this.name.charAt(r2), (r2 + 1) * this.kirjainvali + width / 2 - (this.name.length / 2 * this.kirjainvali), letter_y_location));




    }
  }

  showWord() {
    for (let r2 = 0; r2 < this.name.length; r2++) {
      this.pokeletter[r2].showLetter(r2 == letter_selected);
    }
    textSize(24);
    fill(60, 60, 0);
    text(this.vaikeuslevel, width - 50, 30);
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

  getPokename() {
    return this.name;
  }

  getVaikeus() {
    return this.vaikeus;
  }

  getVaikeusMax() {
    return this.vaikeuslevel;
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
      if (this.y > letter_y_location - 60) {
        this.y = this.y - 0.5;
      }

      textSize(tekstikoko);
      fill(this.color);
      if (this.kirjain == " ")
        text("_", this.x - 2, this.y - 2);
      else
        text(this.kirjain.toUpperCase(), this.x - 2, this.y - 2);

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
// LOOP: game
// -----------------------------------------------------------------------------------
function draw() {
  background(255); // white



  if (waitingstart) {
    time = millis();
    if (starttime > time) {
      stroke(255);
      fill(0, 244, 3);
      textSize(194);
      textAlign(CENTER, CENTER);
      text(nfc((starttime - time) / 1000 + 1, 0), width / 2, height / 2)
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


      for (var i = nappaimisto.length - 1; i >= 0; i--) {


        nappaimisto[i].show(target_ = pokeword[selected_word].getLetter(), false);

      }



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
      textSize(24);
      textAlign(CENTER, BOTTOM);
      // totalvaikeus
      // -----------------------------------------------------------------------------------
      strokeWeight(1);
      stroke(149 + random(2, 100));


      
      text("totalvaikeus = " + totalvaikeus, width / 2, 50);
      text(`Flow speed:${enkka_yhtaika} ms for ` + avg_number_of_letters + " letters.", width / 2, 100);
      text(`Time / character:${nfc(totalgametime / 1 / totalletters, 0)} milliseconds.`, width / 2, 150);
      text("Points = " + nfc(points, 0) + ". Total letters:" + totalletters + ".", width / 2, 200); // milliseconds, no decimals needed. 
      text("Errors = " + errors, width / 2, 250);
      text("Press (ESC) and start new game: " + level_selected, width / 2, 300);



      for (let i = 0; i < levellei; i++) {
        fill((i * 10), 40, 255 - i * 10)
        rect(width - 30, i * height / levellei, 30, (i + 1) * height / levellei);
      }
      // -----------------------------------------------------------------------------------
    }
  }

}
// -----------------------------------------------------------------------------------



// -----------------------------------------------------------------------------------

// -----------------------------------------------------------------------------------
// ref: (https://raw.githubusercontent.com/KevinWorkman/HappyCoding/gh-pages/examples/p5js/_posts/2018-07-04-fireworks.md)
// https://happycoding.io/
// https://KevinWorkman.github.io/happycoding.io/
class Particle {
  constructor(x, y, hu, firework, letterfire) {
    this.pos = createVector(x, y);
    this.firework = firework;
    
    //if (this.firework) {
      this.lifespan = 50;
    //} else {
     // this.lifespan = 20;
    //}
    
    this.hu = hu;

    if (this.firework) {
      if (letterfire) { // onko raketti lopussa vai pelissä
        this.vel = createVector(random(-4, 4), random(1, -4));
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
      this.lifespan -= 5;
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

      fill(0, 255, 0);
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
  if ((key >= 'a' && key <= 'z') | (key.charCodeAt(0) in [13, 69, 190]) | (key.charCodeAt(0) == 32) | (key.charCodeAt(0) == 45) | (key.charCodeAt(0) >= 48) & (key.charCodeAt(0) <= 57) | (key.charCodeAt(0) == 228) | (key.charCodeAt(0) == 229) | (key.charCodeAt(0) == 246)) {
    keyIndex = key.charCodeAt(0) - 'a'.charCodeAt(0);
  }
  if (game_running) {







    if (keyIndex === -1) {
      // If it's not a letter key, clear the screen
      background(230);
      vari = 'brown';
      print(key);
      print(keyIndex);
    } else {
      // print(key)
      nappis = key;
      // Check if pressed character is correct, only a--z --------------------------------

      //print(pokeword[selected_word].getLetter(letter_selected));

      if (nappis == pokeword[selected_word].getLetter()) {

        var aika = millis() - edaika;
        buttonspeeds.push(new Buttonspeed(aika) );
        edaika = millis();
        if (totalletters >= avg_number_of_letters) {
          buttonspeeds.shift(); // https://editor.p5js.org/haques/sketches/I7MR6MjUT
        }

        // ERROR: print(buttonspeeds.getAvgSpeed() );
        // 
          var yhtaika = 0;
          for (let r2 = 0; r2 < buttonspeeds.length; r2++) {
            yhtaika = yhtaika + buttonspeeds[r2].millitime;
          }
          yhtaika = round(yhtaika /  buttonspeeds.length);
          // print(yhtaika);
        
          if (yhtaika < enkka_yhtaika & buttonspeeds.length == avg_number_of_letters) {
            enkka_yhtaika = yhtaika;
            print("avg time for " + buttonspeeds.length + " letters is " + enkka_yhtaika + "milliseconds.");
          }

        fireworks.push(new Firework(pokeword[selected_word].getLetterX(), pokeword[selected_word].getLetterY(), true));
        // next:
        letter_selected = letter_selected + 1;
        totalletters = totalletters + 1;
        vari = 'green';
        time_letter = 0;



        totalgametime = round(time - starttime);

        totalvaikeus = 0;
        for (let i = 0; i < numberOfWords; i++) {
          totalvaikeus = totalvaikeus + pokeword[i].getVaikeus();

        }
        //print("totalvaikeus" + totalvaikeus);
        //print("pokeword[selected_word].length = " + pokeword[selected_word].getLength());
        // collect character statistics: avg. time to press a,b,c, ....
        if (pokeword[selected_word].getLength() == letter_selected) {
          print("new word");
          selected_word = selected_word + 1;
          letter_selected = 0;
          print("selected_word" + selected_word);
          if (selected_word == numberOfWords) {
            game_running = false;
            points = round(max(0, numberOfWords * 2000 + totalvaikeus * 500 - totalgametime - errorMinus * errors));
            print("game over");
            // peli päättyy

            //const stamppi = Date.now();
            //const stamppi2 = Date().toLocaleString(); // https://stackoverflow.com/questions/10211145/getting-current-date-and-time-in-javascript
            
            var stamppi2 = new Date(Date.now()).toLocaleString('en-GB', date_options);
            var pelaajanimi = inp_playername.value(); // "pokenappis2";
            var lettertime = nfc(totalgametime / 1 / totalletters, 0);
            
            postRequest(pelaajanimi, pointsit = points, 
              stamppi2, totalgametime,	totalvaikeus,	numberOfWords, level_selected, lettertime    );


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

// -----------------------------------------------------------------------------------
function mousePressed() {
  if (!game_running) {
    level_selected = round(map(mouseY, 0, height, 6, 20));
  }
  if (level_selected<6) level_selected = 6;
  if (level_selected>20) level_selected = 20;
}
// -----------------------------------------------------------------------------------
// Swanna: https://bulbapedia.bulbagarden.net/wiki/Swanna_(Pok%C3%A9mon)

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
function postRequest_bak2() {
  var data = {
    player: 'pokepete',
    points: 10,
    timestamp: '2021-01-01T18:25:43.511Z'
  }
  let api_url = 'https://api.apispreadsheets.com/data/3630/';
  httpPost(api_url, data, finished);





}


function postRequest(player_, pointsit, stamppi,  totalgametime_,	totalvaikeus_,	numberOfWords_, level_selected_, lettertime_ ) {

  fetch("https://api.apispreadsheets.com/data/3630/", {
    method: "POST",
    //body: JSON.stringify({"data": [{"player":"pokenappis","points":pointsit,"timestamp":"2019-12-23T18:25:43.511Z"}]}),
    body: JSON.stringify({ "data": [{ 
      "player": player_, 
    "points": pointsit, 
    "timestamp": stamppi ,
    "totalgametime": totalgametime_,	
    "totalvaikeus": totalvaikeus_,	
    "numberOfWords": numberOfWords_,
    "level_selected": level_selected_,
    "lettertime": lettertime_
  }] }),
  }).then(res => {
    if (res.status === 201) {
      // SUCCESS
      print("OK")
    }
    else {
      // ERROR
      print("ei tooim")
    }
  })


}



function finished(response) {
  console.log(response); // https://github.com/shiffman/itp-networked-media/wiki/GET,-POST-with-p5
}




// -----------------------------------------------------------------------------------
// NEW GAME -----------
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
  edaika = millis();

  print("restartgame()")
  numberOfWords = 7; // words.length // pelinpituus




  // shuffle(words_filtered, true);
  //shuffle(words, true); // https://editor.p5js.org/L05/sketches/e1yqoWxrk
  shuffle(pokeword_all, true);

  pokeword.splice(0); // https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/splice
  //var ii = - 1;
  //for (let i = 0; i < numberOfWords; i++) {
  //pokeword.push(new Pokeword(i, words[i]));
  //if (pokeword_all[i].getVaikeusMax() < 10) {
  //  ii = ii + 1;
  // pokeword.push(new Pokeword(ii, pokeword_all[i].getPokename() ));
  //}
  //}

  var i_loop2 = -1; // dangerous: i_loop global and used in pokeword...
  var ii = -1;
  while (ii < numberOfWords) {
    i_loop2 = i_loop2 + 1;
    print(i_loop2 + pokeword_all[i_loop2].getPokename() + ": " + pokeword_all[i_loop2].getVaikeusMax() + "..." + ii);
    if (pokeword_all[i_loop2].getVaikeusMax() <= level_selected) { // > 16
      ii = ii + 1;
      pokeword.push(new Pokeword(ii, pokeword_all[i_loop2].getPokename()));
    }

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
    let particlesN = 80;
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

