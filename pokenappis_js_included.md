---
layout: page
title: p5.js pokenappis js included - DEPRICATED! No more folders.. 17.11.2020
use-site-title: true
share-img: /assets/pics/thumbnail/photo/characters.JPG
---


<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/p5.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.1.9/addons/p5.sound.min.js"></script>


Game:


![Touch_typing](/assets/pics/page/www/Touch_typing.png){: .mx-auto.d-block :}


<div id="sketch-holder-jt"></div>
<script>


window.addEventListener('keydown', function(e) {
  if(e.keyCode == 32 && e.target == document.body) {
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





var words = sourceText.split(" ");
var sana = "jaakko";


var pokemonpeli = true;

var vari = 'red';
var i_loop;
var time = 0;
var starttime = 0;
var game_running = true;
var errors = 0;
var points = 0;
var errorMinus = 1000; // 1 second
var letter_selected = 0;
var selected_word = 0;
var nappis = '';
var totalletters = 0;
// https://p5js.org/reference/#/p5/text
//function preload() {
//  inconsolata = loadFont('assets/inconsolata.otf');
//}




let table;

let character_points;
// https://p5js.org/reference/#/p5/loadTable
function preload() {
  //my table is comma separated value "csv"
  //and has a header specifying the columns labels
  table = loadTable('p5/nappistaituri/pokemon.txt', 'csv', 'header');
  character_points = loadTable('p5/nappistaituri/character_points.txt', 'csv', 'header');
  //the file can be remote
  //table = loadTable("http://p5js.org/reference/assets/mammals.csv",
  //                  "csv", "header");
  
  myFont = loadFont('fonts/broken15/BROKEN15.TTF'); // location pokenappis/
  
}

function setup() {
  // createCanvas(700, 400); //, WEBGL);
  const canvas = createCanvas(720, 400);
  canvas.parent('sketch-holder-jt')
  
  frameRate(10); // no need to have 60.
  
  
  // textFont('georgia');
  textFont(myFont);
  textSize(width / 14);
  textAlign(LEFT, CENTER);


  print(table.getRowCount() + ' total rows in table');
  print(table.getColumnCount() + ' total columns in table');
  table.addColumn('vaikeus'); // https://p5js.org/reference/#/p5.Table/addColumn
  print(table.getColumnCount() + ' total columns vaikeus in table');
  // print(table.getColumn('NAME'));
  //["Goat", "Leopard", "Zebra"]

  
  // var[words.length] vaikeus_list;

  if (pokemonpeli) words = table.getColumn('NAME');

  // in loop
  // words -- .toLowerCase()
  // for (let r = 0; r < 5; r++) { //words.length; r++) {
  for (let r = 0; r < words.length; r++) { //words.length; r++) {
    words[r] = words[r].toLowerCase();
    var vaikeus = 0;
    // print(words[r].length);
    for (let r2 = 0; r2 < words[r].length; r2++) {

     // print(words[r].charAt(r2));
      i_loop = 0;
      while (words[r].charAt(r2) != character_points.getString(i_loop, 0) & i_loop < character_points.getRowCount() - 1) {
        i_loop = i_loop + 1;
        // print("mo: " + i_loop);
      }

     //  print("ohi")

      if (i_loop < character_points.getRowCount()) {
        // print("found:" + character_points.getString(i_loop,0) + " points: " + character_points.getString(i_loop,1))  ;

        var lisapiste = character_points.getString(i_loop, 1);

      } else {
        print("no found");
        var lisapiste = 20;
      }

      vaikeus = vaikeus + int(lisapiste);
      
    }
    
    // vaikeus_list[r] = vaikeus;
    
    // print("Word: " + words[r] + " Vaikeus: " + vaikeus / words[r].length)
  }

  
  // table = sort_table(table,22);
  
  //cycle through the table
  //for (let r = 0; r < table.getRowCount(); r++)
  //  for (let c = 0; c < table.getColumnCount(); c++) {
  //    print(table.getString(r, c));
  //  }


  if (false) {
  var sortedArray = [];
for(var i=0; i < sortingArr.length; i++) {
    var found = false;
    for(var j=0; j < words.length && !found; j++) {
        if(itemsArray[j][1] == sortingArr[i]) {
            sortedArray.push(itemsArray[j]);
            itemsArray.splice(j,1);
            found = true;
        }
    }
}
  }
  

  // https://editor.p5js.org/p5/sketches/Hello_P5:_song
  let div = createDiv("Write words:")
  div.id("instructions");
  let button = createButton("Start again");
  button.parent("instructions");
  // Trigger automatically playing
  button.mousePressed(function() {
    restartGame();
  });

  // A triangle oscillator
  osc = new p5.TriOsc();
  // Start silent
  osc.start();
  osc.amp(0);

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


// call after pressing
function restartGame() {
  game_running = true;
  selected_word = 0;
  letter_selected = 0;
  totalletters = 0;
  errors = 0;
  starttime = time;
}


// A function to play a note: [https://editor.p5js.org/p5/sketches/Hello_P5:_song]
function playNote(note, duration) {
  osc.freq(midiToFreq(note));
  // Fade it in
  osc.fade(0.5, 0.2);

  // If we sest a duration, fade it out
  if (duration) {
    setTimeout(function() {
      osc.fade(0, 0.2);
    }, duration - 50);
  }
}

function draw() {
  background(120);

  if (game_running) {

    //fill(vari);
    //rect(25, 25, 50, 50);

    fill(0);

    //fill(255);

    time = millis();



    textSize(38);
    textAlign(LEFT, TOP);
    // show word from the sentence:
    text(words[selected_word], 20, 30);


    var kirjain = sana.charAt(0);
    // print(textWidth(sana)); // https://p5js.org/reference/#/p5/textWidth; in pixels
    // print((sana.length)); // number of characters, e.g. jaakko = 6
	
	// textSize(72);
	textFont(myFont);
	var tekstikoko = 144 + sin(time/3000)*40;
	textSize(tekstikoko);
    textAlign(CENTER, CENTER);
    text(words[selected_word].charAt(letter_selected), width /2, height/2);
    
	

    // length of selected word:
	textSize(width / 17);
    textAlign(LEFT, BOTTOM);
    text((letter_selected + 1) + "/" + words[selected_word].length, 20, height - 20)
	
	textAlign(CENTER, BOTTOM);
    text("words: " + (selected_word + 1) + "/" + words.length, width/2, height - 20)
	
	textAlign(RIGHT, BOTTOM);
    text(nfc(time/1000, 1), width - 20, height - 20); // show milliseconds divided by 1000 one decimal
	
	
	fill(vari);
	textAlign(RIGHT, TOP);
	text(nappis, width - 20, 30);
	
  } else {

    text("Points = " + nfc(points, 0) + ". Total letters:" + totalletters + ".", 200, 200); // milliseconds, no decimals needed. 

    text("Errors = " + errors, 200, 250);
    text("Press ' ' (SPACE) and start new game", 200, 300);
  }
}



// KEYBOARD -----------------------------------------
function keyPressed() {
  let keyIndex = -1;

  print(key.charCodeAt(0));

  // scandinavian letters, just ensuring that characters are not messed up and thus using keycodes --------------
  if ((key >= 'a' && key <= 'z') | (key.charCodeAt(0) == 69) | (key.charCodeAt(0) == 32) | (key.charCodeAt(0) == 228) | (key.charCodeAt(0) == 229) | (key.charCodeAt(0) == 246)) {
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
      if (nappis == words[selected_word].charAt(letter_selected)) {
        letter_selected = letter_selected + 1;
        totalletters = totalletters + 1;
        vari = 'green';

        // collect character statistics: avg. time to press a,b,c, ....



        if (words[selected_word].length == letter_selected) {
          selected_word = selected_word + 1;
          letter_selected = 0;

          if (selected_word == words.length) {
            game_running = false;
            points = time + errorMinus * errors - starttime;
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
        errors = errors + 1;

        // Map mouse to the key index
        let key = floor(map(mouseX, 0, width, 0, notes.length));
        playNote(notes[key]);
        osc.fade(0, 0.5);
      }

    }

  } else {

    if (key == ' ') {
      restartGame();
    }

  }

}

var asc = 0;
function sort_table(table, col)
{
	// $('.sortorder').remove();
	if (asc == 2) {asc = -1;} else {asc = 2;}
	var rows = table.tBodies[0].rows;
	var rlen = rows.length-1;
	var arr = new Array();
	var i, j, cells, clen;
	// fill the array with values from the table
	for(i = 0; i < rlen; i++)
	{
		cells = rows[i].cells;
		clen = cells.length;
		arr[i] = new Array();
		for(j = 0; j < clen; j++) { arr[i][j] = cells[j].innerHTML; }
	}
	// sort the array by the specified column number (col) and order (asc)
	arr.sort(function(a, b)
	{
		var retval=0;
		var col1 = a[col].toLowerCase().replace(',', '').replace('$', '').replace(' usd', '')
		var col2 = b[col].toLowerCase().replace(',', '').replace('$', '').replace(' usd', '')
		var fA=parseFloat(col1);
		var fB=parseFloat(col2);
		if(col1 != col2)
		{
			if((fA==col1) && (fB==col2) ){ retval=( fA > fB ) ? asc : -1*asc; } //numerical
			else { retval=(col1 > col2) ? asc : -1*asc;}
		}
		return retval;      
	});
	for(var rowidx=0;rowidx<rlen;rowidx++)
	{
		for(var colidx=0;colidx<arr[rowidx].length;colidx++){ table.tBodies[0].rows[rowidx].cells[colidx].innerHTML=arr[rowidx][colidx]; }
	}
	
	hdr = table.rows[0].cells[col];
	if (asc == -1) {
		$(hdr).html($(hdr).html() + '<span class="sortorder">▲</span>');
		} else {
		$(hdr).html($(hdr).html() + '<span class="sortorder">▼</span>');
	}
}
function sortTable(n) {
	sort_table(document.getElementById("myTable"), n);
}

</script>


[Keyboard source](https://upload.wikimedia.org/wikipedia/commons/4/40/Touch_typing.png)

## Old stuff

```javascript
<div id="sketch-holder"></div>
<script src="https://github.com/talonendm/p5js-page/tree/gh-pages/objects/libraries/p5.js" type="text/javascript"></script>
<script src="https://github.com/talonendm/p5js-page/tree/gh-pages/objects/libraries/p5.dom.js" type="text/javascript"></script>
<script src="https://github.com/talonendm/p5js-page/tree/gh-pages/objects/libraries/p5.sound.js" type="text/javascript"></script>
<script src="https://github.com/talonendm/p5js-page/tree/gh-pages/objects/sketch.js" type="text/javascript"></script>
```

see last [comment](https://stackoverflow.com/questions/53267193/p5js-with-jekyll)
[md example](https://raw.githubusercontent.com/KevinWorkman/HappyCoding/gh-pages/examples/p5js/_posts/2018-07-04-fireworks.md)