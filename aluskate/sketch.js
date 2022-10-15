/*
 * p5.bezier.js
 
 copyright: Jaakko Talonen
 Vappu 2022
 
 TODO
 - naulat ja sen pituus: info meneekö läpi
 - Ruodelautojen eläminen, kutistuminen. välin kasvaminen
 - siirrä aloituspistettä puuX
 
 lopuksi: laskentaa voi tulla, jos halutaan tietyn mittanen aluskate näyttää. Ei tarpeen.
 */




 var tuuletusrimakoko = 1;
 // var tuuletusrimakorkeus = 32;
 var pituusEstimate = 0;
 var pituusEstimateNow = 0;
 var pointXv;
 var pointYv;
 var tuuletusrimaH = 32;
 var ruodeleveys = 900;
 var puunvari = "rgba(250,250,200,1)";
 var puunvariDark = "rgba(170,170,60,1)";
 var aluskatevari = "rgba(140,140,140,1)";
 var katevari = "rgba(20,20,20,1)";
 var metalliruodevari = "rgba(160,160,160,1)";
 var naulavari = "rgba(120,120,120,1)";
 var ilmakiertaavari = "rgba(200,200,255,1)";
 // let ilmakiertaavari = color(168, 204, 254, 255);
 
 var naulanpituus = 70; 
 
 var laskettutuuletusvali = 0;
 var laskettutuuletusvalijostiukka = 0;
 
 function setup() {
   let ca = createCanvas(1100, 550);
 
   ca.parent('sketch-holder')
   ca.position(0,0);

   // dom check boxit menee pieleen jos taa
   // ca.style('z-index', '-1'); // https://www.youtube.com/watch?v=OIfEHD3KqCg

   // Init p5.bezier drawer
   //p5bezier.initBezier(c);
 
   frameRate(20);
   
   radio = createRadio();
   radio.option('0', 'ei tuuletusrimaa');
   radio.option('1', 'lauta 32x100');
   radio.option('2', 'lauta 45x60');
   radio.style('width', '500px');
   radio.selected('1');
   
   // https://www.geeksforgeeks.org/p5-js-bezierpoint-function/
   roikkumaSlider = createSlider(0, 80, 36, 1);
   roikkumaSlider.position(20, 70);
   
   reikakohtaSlider = createSlider(0, 150, 0, 1);
   reikakohtaSlider.position(20, 160);
   
   katekohtaSlider = createSlider(0, 225, 0, 1);
   katekohtaSlider.position(20, 120);
   
   
   // Aluskate Sliderit:
   aluskatepysyvyysSlider = createSlider(0, 2, 0.3, 0.05);
   aluskatepysyvyysSlider.position(220, 70);
   
   aluskatetyyppiSlider = createSlider(300, 440, 350, 1);
   aluskatetyyppiSlider.position(220, 120);
   
   
   
   
   // maxPointsSlider = createSlider(2, 50, 10, 1);
   maxPointsSlider = createSlider(50, 100, 10, 1);
   maxPointsSlider.position(720, 120);
   
   // checkboxTuuletusrima = createCheckbox('tuuletusrima', false);
   checkboxTuulettuvaruode = createCheckbox('tuulettuva vaakaruode', true);
   checkboxTuulettuvaruode.position(450, 20);
   // checkboxTuuletusrima.changed(myCheckedEvent);
   
   
   // Set styles for the curve
   noFill();
   stroke('black');
   strokeWeight(2);
 }
 
 function draw() {
   background(235);
   
   textAlign(LEFT, TOP);
   
   textSize(20);
   fill(0);
   stroke('black');
   text("Asennus", 20, 20);
   text("Aluskatteen ominaisuudet", 220, 20);
   text("Laskenta", 720, 20);
   stroke("black");
   if (laskettutuuletusvalijostiukka==0) {
     text("Laskettu tuuletusväli (suorita laskenta - paina c-kirjainta) ", 20, 510);
   } else {
     
     if (laskettutuuletusvali<30) {
       fill("red");
       
     } else if (laskettutuuletusvali<50) {
       fill("yellow");
     } else {
       fill("green");
     }
     
           text("Laskettu tuuletusväli (suorita laskenta - paina c-kirjainta): " + nfc(laskettutuuletusvali,1) + " mm. Jos aluskate kiristyy ruodevälillä: " + nfc(laskettutuuletusvalijostiukka, 1) + " mm.", 20,510);
 
          }
   
   fill("black");
    
   tuuletusrimakoko = radio.value();
   
   roikkuma = roikkumaSlider.value();
   reikakohta = reikakohtaSlider.value();
   katekohta = katekohtaSlider.value();
   aluskateX = aluskatetyyppiSlider.value();
   maxPoints = maxPointsSlider.value();
   mittapysyvyys = aluskatepysyvyysSlider.value();
   
   textSize(14);
   text("Kutistuma:" + mittapysyvyys+  " % (ei saa olla yli 2 % sen alkuperäisestä mitasta)" , 220, 50);
   
   textSize(14);
   text("Aluskatteen massa ja materiaali vaikuttaa roikkuman muotoon.", 220, 100);
   
   textSize(14);
   text("Aluskatteen roikkuma.", 20, 50);
   text("Peltikatteen sijainti.", 20, 100);
   text("Ruoteen reikien sijainti.", 20, 140);
   
   textSize(14);
   text("Aluskatteen laskentapisteet.", 720, 100);
   
   strokeWeight(0.4);
   stroke('white');
   for (i=0;i<50;i=i+5) {
     line(0,300+i,1000,300+i);
     
   }
   strokeWeight(1);
   stroke('black');
   // Draw the curve
   
   //fill('lightblue');
   //p5bezier.newBezier([
   //  [100, 300],
   //  [550, 300 + roikkuma],
   //  [1000, 300]//,
     //[500, -800],
     //[800, 1000],
     //[10, 300]
   //]);
   
   // Pystyjuoksut
   ruodelauta(1000,300,100,32);
   ruodelauta(0,300,100,32);
   
   
   if (tuuletusrimakoko!=0) {
     if (tuuletusrimakoko==1) {
       tuuletusrimaH = 32;
       tuuletusrimaL = 100;
     } else {
       tuuletusrimaH = 45;
       tuuletusrimaL = 60;
     }
     
     noStroke();
     fill(ilmakiertaavari);
     rect(0,300-tuuletusrimaH, 1100, tuuletusrimaH);
     
     // Pystyjuoksut
     // fill(puunvari);
     
     if (tuuletusrimakoko==1) {
       ruodelauta(0, 300-tuuletusrimaH, tuuletusrimaL, tuuletusrimaH);
     ruodelauta(1000, 300-tuuletusrimaH, tuuletusrimaL, tuuletusrimaH);
       
       
     } else {
       ruodelauta(0+20, 300-tuuletusrimaH, tuuletusrimaL, tuuletusrimaH);
     ruodelauta(1000+20, 300-tuuletusrimaH, tuuletusrimaL, tuuletusrimaH);
     }
     
     
     
     // rect(0,300-tuuletusrimaH,100,32);
     // rect(1000,300-tuuletusrimaH,100,32);
     
     strokeWeight(1);
   } else {
     tuuletusrimaH = 0;
   }
   
   // Vaakaruode ----------------------------------------
   if (checkboxTuulettuvaruode.checked()) {
     // Tuulettuvaruode
     strokeWeight(1);
     stroke("black");
     fill(metalliruodevari);
     rect(0,300-32-tuuletusrimaH,1100,32);
   
     strokeWeight(0.5);
     line(0, 300 - 3 - tuuletusrimaH, 1100, 300 - 3 - tuuletusrimaH);
     strokeWeight(1);
     fill(ilmakiertaavari);
     for (i=0;i<8;i=i+1) {
       ellipse(i*150 + reikakohta,300-16-tuuletusrimaH,20,20); //  Number: width of the ellipse.
     }
     
     naula(50, 300-tuuletusrimaH - 4);
     naula(100 + ruodeleveys + 50, 300-tuuletusrimaH - 5);
     
   } else {
     // strokeWeight(1);
     // fill(puunvari);
     ruodelauta(0,300-32-tuuletusrimaH,1100,32);
     // rect(0,300-32-tuuletusrimaH,1100,32);
     
     if (tuuletusrimakoko==0) {
       
        naula(56, 300-tuuletusrimaH - 1 - 32);
       naula(100 + ruodeleveys + 56, 300 - 32- tuuletusrimaH - 1);
     } else {
     
     naula(44, 300-tuuletusrimaH  - 1);
     naula(100 + ruodeleveys + 44, 300 - tuuletusrimaH - 1);
     
     if (tuuletusrimakoko!=0) {
       naula(56, 300-tuuletusrimaH - 1 - 32);
       naula(100 + ruodeleveys + 56, 300 - 32- tuuletusrimaH - 1);
     }
     
     }
     
   }
   // ......................................................
   
   
   
   let p1 = { x: 100, y: 300 };
   let p2 = { x: 550 - aluskateX, y: 300 + roikkuma };
   let p3 = { x: 550 + aluskateX, y: 300 + roikkuma };
   let p4 = { x: 1000, y: 300 };
 
   
   // https://www.geeksforgeeks.org/p5-js-bezierpoint-function/
   //noFill();
   fill(ilmakiertaavari);
   stroke(aluskatevari);
   // Draw bezier using bezier()
   
   line(0,300,100,300);
   line(1000,300,1100,300);
   
   bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
   
   pituusEstimate = 0;
   for (let i = 0; i <= maxPoints; i++) {
     let step = i / maxPoints;
   
     // Find the X and Y coordinate using the bezierPoint() function
     let pointX = bezierPoint(p1.x, p2.x, p3.x, p4.x, step);
     let pointY = bezierPoint(p1.y, p2.y, p3.y, p4.y, step);
     fill("red");
   
     // Display it on the sketch
     ellipse(pointX, pointY, 2, 2);
     
     if (i>0) {
       pituusEstimate = pituusEstimate + dist(pointX, pointY, pointXv, pointYv);
     }
     pointXv = pointX;
     pointYv = pointY;
   }
   
   aluskateteksti()
   
   // kate();
   
   for (i = -2; i<5;i++) {
     kateylaosa(i*225 + katekohta);
   }
   
   
   
 
   
 }
 
 
 // ---------------------------------------------
 function lasketuuletusvali() {
     let c = 0;
   loadPixels();
     var tuuletusta = 0;
   for (var y = 300 - tuuletusrimaH - 32 - 30 - 10; y < 301; y=y+1) {
     for (var x = 50; x < 1050; x=x + 1) {
       var index = (x + y * width);
     //  if (y == 250) print(get(x,y));
       if (color(get(x,y)) == ilmakiertaavari) {
      // pixels[index + 0] = x;
      // pixels[index + 1] = random(255);
      // pixels[index + 2] = y;
      // pixels[index + 3] = 255;
         tuuletusta = tuuletusta + 1;
       }
     }
   }
   
   laskettutuuletusvalijostiukka = tuuletusta / 900;
   for (var y = 301; y < 400; y=y+1) {
     for (var x = 50; x < 1050; x=x + 1) {
       var index = (x + y * width);
     //  if (y == 250) print(get(x,y));
       if (color(get(x,y)) == ilmakiertaavari) {
      // pixels[index + 0] = x;
      // pixels[index + 1] = random(255);
      // pixels[index + 2] = y;
      // pixels[index + 3] = 255;
         tuuletusta = tuuletusta + 1;
       }
     }
   }
   
   
   
   print("Tuuletuspikseleitä: " + tuuletusta);
     
   let tuuletusvalikorkeus = tuuletusta / 900;
   print("Vastaa 900mm ruodeleveydellä:" + nfc(tuuletusvalikorkeus,1), "mm väliä.");
   laskettutuuletusvali = tuuletusvalikorkeus;
   //updatePixels();
 }
 // ---------------------------------------------
 
 
 function keyPressed() {
   if (key === 'c' | key === 'C') {
   lasketuuletusvali();
   }
 }
 
 // ---------------------------------------------
 function aluskateteksti() {
   
   textAlign(CENTER, TOP);
   fill('black');
   textSize(24);
   
   text("Aluskatteen pituus ruodevälillä:" + nfc(pituusEstimate,1) + "mm", 550, 300 + roikkuma + 20);
   
   
   pituusEstimateNow = pituusEstimate * (100 - mittapysyvyys)/100;
   
   if (pituusEstimateNow<900) {
     fill('red');
     text("Repeytyminen ja vesi turmelee rakenteita!\nAluskate on kutistunut myöhemmin\nAvartuma naulan kohdalta noin: " + nfc((900 - pituusEstimateNow)/2,1) + "mm", 550,300 + roikkuma + 70);
     
     // repeämä lautojen välissä:
     stroke('red');
     strokeWeight(5);
     line(50,300,50+(900-pituusEstimateNow)/2,300);
     line(1050,300,1050-(900-pituusEstimateNow)/2,300);
     strokeWeight(1);
     stroke("black");
     setLineDash([5, 11]); 
     line(50,300,1050,300);
     setLineDash([]);
     
     let v0 = createVector(550, 300 + roikkuma-10);
     let v1 = createVector(0, -roikkuma+10);
     drawArrow(v0, v1, 'black');
     
     stroke('green');
     
     strokeWeight(3);
     for (i =0;i<20;i++) {
       point(5 + random(90), 301 + random(28));  
       point(1005 + random(90), 301 + random(28)); 
     }
     
     strokeWeight(1);
     
     
   } else {
     fill('green');
   }
   text("Aluskatteen pituus myöhemmin:" + nfc(pituusEstimateNow,1) + "mm", 550,300 + roikkuma + 40);
   
 }
 // ---------------------------------------------
 
 
 // ---------------------------------------------
 function ruodelauta(x, y, l, h) {
   strokeWeight(1);
   stroke(puunvariDark);
   fill(puunvari);
   rect(x, y, l, h);
 }
 // ---------------------------------------------
 
 // ---------------------------------------------
 function naula(x, y) {
   // setLineDash([5, 10, 30, 10]); //another dashed line pattern
   setLineDash([5, 7]); //another dashed line pattern
   strokeWeight(1);
   stroke("black");
   fill(naulavari);
   rect(x-2, y, 4, naulanpituus);
   setLineDash([]); //another dashed line pattern
   line(x-3,y,x+3,y);
 }
 // ---------------------------------------------
 
 // ---------------------------------------------
 // https://editor.p5js.org/squishynotions/sketches/Ax195WTdz
 function setLineDash(list) {
   drawingContext.setLineDash(list);
 }
 // ---------------------------------------------
 
 
 function kate() {
   
   let kateh = 30;
   
   let kohtay = 300 - 32;
   let puolikas = 225/2;
   
   let p1 = { x: 100, y: kohtay };
   let p2 = { x: 100 + puolikas - 50, y: kohtay - kateh  };
   let p3 = { x: 100 + puolikas + 50, y: kohtay - kateh };
   let p4 = { x: 100 + puolikas * 2, y: kohtay };
 
   
   // https://www.geeksforgeeks.org/p5-js-bezierpoint-function/
   //noFill();
   //fill('lightblue');
   stroke(aluskatevari);
   // Draw bezier using bezier()
   bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
   
   
 }
 
 
 function kateylaosa(kx) {
   
   if (tuuletusrimakoko!=0) {
     ky = tuuletusrimaH
     
   } else {
     ky = 0;
   }
   
   let kateh = 7;
   
   let kohtay = 300 - 32 - 23 - ky;
   let puolikas = 42; // 225/2;
   let muoto = 30;
   
   let p1 = { x: kx + 100, y: kohtay };
   let p2 = { x: kx + 100 + puolikas - muoto, y: kohtay - kateh  };
   let p3 = { x: kx + 100 + puolikas + muoto, y: kohtay - kateh };
   let p4 = { x: kx + 100 + puolikas * 2, y: kohtay };
  
   
   // ILMAKIERTO väritys... tee loop fill:
   fill(ilmakiertaavari);
   noStroke();
   rect(kx + 100, kohtay, puolikas * 2, 22);
   
   rect(kx + 100 + puolikas * 2 , kohtay+ 15, puolikas /2.4, 7);
   rect(kx + 100 -puolikas /2.4 , kohtay+ 15, puolikas /2.4, 7);
   
   // TODO Loop FILL
   
   
   // https://www.geeksforgeeks.org/p5-js-bezierpoint-function/
   //noFill();
   // fill('lightblue');
   
   
   
   
   stroke(katevari);
   strokeWeight(2);
   // Draw bezier using bezier()
   bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
   
   noFill();
   
   //noStroke();
   // rect(100, kohtay, 2* puolikas, 23);
   
   // viiva
   p1 = { x: kx + 100 + puolikas * 2, y: kohtay };
   p2 = { x: kx + 100 + puolikas * 2 + 3, y: kohtay +3 };
   p3 = { x: kx + 100 + puolikas * 2 + 5, y: kohtay  + 5 };
   p4 = { x: kx + 100 + puolikas * 2 + 7, y: kohtay + 9 };
   bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
   
   kohtax  = 100 + puolikas * 2 + 7;
   puolikas = 112.5 - 42 - 7;
   kohtay = kohtay + 9;
   let muoto2 = 50 
   
   
   p1 = { x: kx + kohtax, y: kohtay };
   p2 = { x: kx + kohtax + puolikas - muoto2, y: kohtay + 30-11 };
   p3 = { x: kx + kohtax + puolikas + muoto2, y: kohtay + 30-11 };
   p4 = { x: kx + kohtax + puolikas * 2, y: kohtay };
  
   // fill('lightblue');
   // https://www.geeksforgeeks.org/p5-js-bezierpoint-function/
   //noFill();
   // fill('lightblue');
   // stroke(aluskatevari);
   // Draw bezier using bezier()
   bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
   
   
   // viiva ylös
   p1 = { x: kx + kohtax + puolikas * 2, y: kohtay };
   p2 = { x: kx + kohtax + puolikas * 2 + 3, y: kohtay -3 };
   p3 = { x: kx + kohtax + puolikas * 2 + 5, y: kohtay - 5 };
   p4 = { x: kx + kohtax + puolikas * 2 + 7, y: kohtay - 9 };
   bezier(p1.x, p1.y, p2.x, p2.y, p3.x, p3.y, p4.x, p4.y);
   
   // Kattoprofiilien kiinnitys Ruukin tuulettavaan teräsruoteeseen tehdään muoto- ja poimulevykatteilla 4,8x23 mm
   // https://www.theseus.fi/bitstream/handle/10024/101956/Peltokangas_Harri.pdf;jsessionid=8F5C02DF9A9735557A48229F5D8DBAC7?sequence=2
   
   ruuvi(kx + kohtax + puolikas, kohtay + 30-11-5);
   
   
  
   
   
   
 }
 
 
 // ---------------------------------------------
 function ruuvi(x, y) {
   // setLineDash([5, 10, 30, 10]); //another dashed line pattern
   setLineDash([5, 7]); //another dashed line pattern
   strokeWeight(1);
   stroke("black");
   fill(naulavari);
   let ruuvinpituus = 23;
   rect(x-2, y, 4.8, ruuvinpituus);
   setLineDash([]); //another dashed line pattern
   rect(x-3,y-4,9,4);
 }
 // ..................
 
 // ---------------------------------------------
 // https://p5js.org/reference/#/p5.Vector/magSq
 function drawArrow(base, vec, myColor) {
   push();
   stroke(myColor);
   strokeWeight(3);
   fill(myColor);
   translate(base.x, base.y);
   line(0, 0, vec.x, vec.y);
   rotate(vec.heading());
   let arrowSize = 7;
   translate(vec.mag() - arrowSize, 0);
   triangle(0, arrowSize / 2, 0, -arrowSize / 2, arrowSize, 0);
   pop();
 }
 // ---------------------------------------------