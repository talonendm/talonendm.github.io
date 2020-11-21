	// add text to image: e.g. copyright symbol and name - use for photos
	// https://editor.p5js.org/lmccart/sketches/S1UtI-Kgb
	var images = []; // Declare variable 'img'.
	var filename = [];
	var teksti = "\u00A9 ta*.dm";
	let location_x, location_y; 
	let n_pic = 2; // 2
	let opacityvalue = 70; // 255 no opacity
	let sizevalue = 24;
	// .................................
	function preload() {
		// img = loadImage('pics/thumbnail/photo/auringonkukka.JPG'); // Load the image
		for (var i=0; i<n_pic; i++) {
			if (i == 0) filename[i] = "auringonkukka"
			if (i == 1) filename[i] = "punkki"
			images[i] = loadImage('pics/thumbnail/photo/' + filename[i] + ".JPG"); 
		}
		
		myFont = loadFont('fonts/broken15/BROKEN15.TTF'); // source: dafont:
	
		// a l l fonts copyright
		// misprinted type © [ http://www.misprintedtype.com ]
		// This is a freeware typeface. This means that you can use it on
		// your commercial or non-commercial work for free.
		// But here is a list of things you could do, ONLY IF YOU WANT TO:
		// * link www.misprintedtype.com on your site
		// * Send me a sample of the work you did using my typeface
		// * Mail me some print material you did using my typeface
		// * credit "misprinted type" on your work
		// * Donate money, books, cd´s, artwork, whatever you want.
		 // (Address is in the end of this file)
		// NOW READ CAREFULLY:
		// * Dont redistribute this font without my permission
		// * Dont sell this font
		// * Dont modify it
		// CONTACT INFO:
		// Eduardo Recife
		// Rua Piaui 1029 apto. 501
		// Funcionarios
		// Belo Horizonte - MG
		// Brazil 30150-321
		// For more typefaces, visit [http://www.misprintedtype.com]
		// _
		// *** This typeface was reviewed/updated by Prof. Brian J. Bonislawsky
		// of the Astigmatic One Eye Typographic Institute, http://www.astigmatic.com




	}
	// .................................
	function setup() {
	  createCanvas(300, 300);
	  location_x = width-4;
	  location_y = height-1;
	  
	  
	  textFont(myFont);
	  textSize(sizevalue);
	  textAlign(RIGHT,BOTTOM);
	  // https://p5js.org/reference/#/p5/noLoop
	  noLoop();
	  
	  
	}
	// .................................
	function draw() {
	  // source: https://p5js.org/examples/image-load-and-display-image.html
	  // Displays the image at its actual size at point (0,0)
	  
		background(0);
		for (var i=0; i<n_pic; i++) {
		image(images[i], 0, 0, 300, 300);
		
		// get pixel color: https://p5js.org/reference/#/p5/get
		let c = get(location_x, location_y);  // 15% darker
		let c_shadow = darkercolor(c, 0.1, opacityvalue);  // and 80% darker
		// c = c.multiply(0.85); // https://stackoverflow.com/questions/19175063/multiply-all-elements-in-array
		// tint(c, 100);  //  https://p5js.org/reference/#/p5/tint
		print(c);
		
		fill(c_shadow);
		text(teksti, location_x-1, location_y-1); // https://stackoverflow.com/questions/8095624/how-to-add-copyright-symbol-in-a-highcharts-title
		fill(darkercolor(c, 0.9, opacityvalue));
		text(teksti, location_x, location_y);
		// Displays the image at point (0, height/2) at half size
		//image(img, 0, height / 2, img.width / 2, img.height / 2);
	  
		saveCanvas(filename[i], 'jpg');
		
		// pause here
		}
	  
	  // another loop where figures are shown and the order:
		textSize(50);
		textAlign(CENTER, CENTER);
		fill(100,160);
		background(0);
		for (var i=0; i<n_pic; i++) {
			
			// modulo: https://editor.p5js.org/kjhollentoo/sketches/Syf-33fJg
			image(images[i], i*100 % 300, floor(i/3)*100, 100, 100);
			text(i+1 + "/" + images.length, i*100 % 300 + 50, floor(i/3)*100 + 50);
		}
	  
	}
	// .................................
	// https://gist.github.com/renancouto/4675192
	var LightenColor = function(color, percent) {
		var num = parseInt(color,16),
		amt = Math.round(2.55 * percent),
		R = (num >> 16) + amt,
		B = (num >> 8 & 0x00FF) + amt,
		G = (num & 0x0000FF) + amt;

		return (0x1000000 + (R<255?R<1?0:R:255)*0x10000 + (B<255?B<1?0:B:255)*0x100 + (G<255?G<1?0:G:255)).toString(16).slice(1);
	}
	// .................................
	// ta.dm:
	var darkercolor = function(coloro, percent, opacity) {
		R = red(coloro) * percent;
		G = green(coloro) * percent;
		B = blue(coloro) * percent;
		return(color(R,G,B,opacity));
	}