---
layout: post
title: Turbo Pascal
subtitle: old games wake up from coma - part 1
tags:
  - Turbo Pascal
  - pas
  - antique code
  - 90s
  - Helicopter game
comments: true
cover-img: /assets/pics/cover/screenshot/pascal.JPG
thumbnail-img: /assets/pics/thumbnail/www/TP.JPG
published: true
---
# Turbo Pascal
"Borland Turbo Pascal is a Pascal programming language compiler with an Integrated Development Environment targeted at the hobbyist and entry-level market." - [Win World PC](https://winworldpc.com/product/turbo-pascal/5x)

![HELI.exe](/assets/pics/page/screenshot/HELIpas.JPG){: .mx-auto.d-block :}

## Version
My old files were not working after testing TP5.5 and the most recent DOSBox 0.74-3 and Turbo Pascal. I learned Turbo Pascal in the mid of 90s. 
If I remember correct, I got a Finnish text book and disk with it from Santa Claus. 
In my programs I have used GRAFIIKKA.TPU or with 8 characters GRAFIIKK.TPU file. In addition I had this next to PAS files: EGAVGA.BGI [download](https://osdn.net/projects/sfnet_hlanguage/downloads/Source/BGI/EGAVGA.BGI/).
"A Turbo Pascal Unit is a separately-compiled file generated using Turbo Pascal or Borland Pascal for the purpose of linking at build time into an executable file making use of multiple modules. TPU files were introduced in Turbo Pascal 4.0" [Turbo Pascal Unit](http://fileformats.archiveteam.org/wiki/Turbo_Pascal_Unit). I got this error: [error-72-unit-file-format-error-plz-help](https://programmersheaven.com/discussion/242306/error-72-unit-file-format-error-plz-help)
Although I copied that to more recent TPs [TP5.5](https://edn.embarcadero.com/article/20803) and [Turbo Pascal with DOSBox](https://sourceforge.net/projects/turbopascal-wdb/). I was not able to make it work. Luckily I found files for TP and I was able to run code. 
Actually I had .exe file for almost the most recent game file (HELI2.pas).
More TP versions available [here](https://winworldpc.com/product/turbo-pascal/5x).
Working version with TURBO editor is available [here](https://talonendm.github.io/zip/TURBOHELI.zip) 

## Mount folder with oldgames
Start DOSBox, I have DOSBox 0.74-3. Create folder "OLDGAMES" to C-drive and copy yor files there. 

~~~
Z:\> mount C C:\OLDGAMES
Z:\> C:
C:\> HELI
~~~

- [How To Use DOSBox To Run DOS Games and Old Apps](https://www.howtogeek.com/104725/how-to-use-dosbox-to-run-dos-games-and-old-apps/)
- [DosBox Wiki](https://www.dosbox.com/wiki/File:Dosbox2.jpg)

or start TURBO 

~~~
Z:\> mount C C:\OLDGAMES
Z:\> C:
C:\> TURBO
~~~

![HELI3.pas in TP editor](/assets/pics/page/screenshot/HELI3pasInTP.JPG){: .mx-auto.d-block :}

Tips:
- alt-key: open menu and use arrow keys
- windows-key: make possible to take screenshots. Otherwise mouse icon (square) just inside TURBO editor.

## dosbox conf: https://www.dosbox.com/wiki/Configuration:CPU

- [dosbox conf Instructions](https://www.dosbox.com/wiki/Configuration:CPU)

~~~
[cpu]
#      core: CPU Core used in emulation. auto will switch to dynamic if available and
#            appropriate.
#            Possible values: auto, dynamic, normal, simple.
#   cputype: CPU Type used in emulation. auto is the fastest choice.
#            Possible values: auto, 386, 386_slow, 486_slow, pentium_slow, 386_prefetch.
#    cycles: Amount of instructions DOSBox tries to emulate each millisecond.
#            Setting this value too high results in sound dropouts and lags.
#            Cycles can be set in 3 ways:
#              'auto'          tries to guess what a game needs.
#                              It usually works, but can fail for certain games.
#              'fixed #number' will set a fixed amount of cycles. This is what you usually
#                              need if 'auto' fails. (Example: fixed 4000).
#              'max'           will allocate as much cycles as your computer is able to
#                              handle.
#            Possible values: auto, fixed, max.
#   cycleup: Amount of cycles to decrease/increase with keycombos.(CTRL-F11/CTRL-F12)
# cycledown: Setting it lower than 100 will be a percentage.

core=auto
cputype=auto
cycles=auto
cycleup=10
cycledown=20
~~~
TO
~~~
[cpu]
#      core: CPU Core used in emulation. auto will switch to dynamic if available and
#            appropriate.
#            Possible values: auto, dynamic, normal, simple.
#   cputype: CPU Type used in emulation. auto is the fastest choice.
#            Possible values: auto, 386, 386_slow, 486_slow, pentium_slow, 386_prefetch.
#    cycles: Amount of instructions DOSBox tries to emulate each millisecond.
#            Setting this value too high results in sound dropouts and lags.
#            Cycles can be set in 3 ways:
#              'auto'          tries to guess what a game needs.
#                              It usually works, but can fail for certain games.
#              'fixed #number' will set a fixed amount of cycles. This is what you usually
#                              need if 'auto' fails. (Example: fixed 4000).
#              'max'           will allocate as much cycles as your computer is able to
#                              handle.
#            Possible values: auto, fixed, max.
#   cycleup: Amount of cycles to decrease/increase with keycombos.(CTRL-F11/CTRL-F12)
# cycledown: Setting it lower than 100 will be a percentage.

core=auto
cputype=auto
cycles=max
cycleup=10
cycledown=20
~~~
and I think HELI2 game was a bit faster. However, I think I should have better cputype.

![HELI.exe](/assets/pics/page/screenshot/HELIpas3.JPG){: .mx-auto.d-block :}
Yellow copter attacs to White's base.

# Code
The Helicopter Game has three "published" versions:

- HELI.pas
- HELI2.pas (and map generator)
- HELI3.pas (select control keys and generate new maps)



## Setup and generate random map ALOITUS.PAS

I felt good when I opened this code file. I was quite positive surprised about the cleanisess and clarity of my about 20 years old code.

~~~
program alku;
uses crt,graph,grafiikka;
const
	helikopterisuhde=2;
	tykkeja=4;
	panoksia=2;
	kartankoko=50;
	ktark=80;
	korkeusvaihtelu=50;
	ylinkorkeus=375;

  aa=80/479;
	bb=640/(kartankoko-1);
	vesi=427;



	koko10=10/helikopterisuhde; koko15=15/helikopterisuhde;
	koko20=20/helikopterisuhde; koko7=7/helikopterisuhde;
	koko40=40/helikopterisuhde; koko23=23/helikopterisuhde;
	koko25=25/helikopterisuhde; koko17=17/helikopterisuhde;
type
	TykkiPoint = record
		X, Y,hx: integer;
		kory: array[1..2] of integer;
		py: array[1..2] of real;
		px: array[1..2] of real;
		ptx3: array[1..2] of real;
		pvx,pvy,aste:real;
		matka,puoli:byte;
		kohde,energy:shortint;
	end;


	HeliPoint = Record
		x: array[1..2,0..19] of real;
		y: array[1..2,0..19] of real;
    hx: array[1..2] of real;
		kx: array[1..2] of integer;
    rx: array[1..2] of real;
		v,vy,vx,vtuki: real;								{nopeudet}
    vk: shortint;
		k: array[1..2] of real;
    suunta: shortint;
		ka: real;                        
		nap: array[1..7] of char;
		pro,prok: shortint;          {Propellin asento sek„ suunta}
		loser,energy: shortint;
		ampua: integer;
		luoti: shortint;
		pvx,pvy: array[1..panoksia] of real;
		px,py: array[1..2,1..panoksia] of real;
		ptx3: array[1..panoksia] of integer;
		panosmatka: array[1..panoksia] of integer;
		aloitusx,aloituskx,aloitusy:  integer;
		savu: array[1..2,1..11] of integer;
	end;
var
	sx,a,q,c,d,b:integer;
	map: array[1..kartankoko] of integer;
	mapt: array[1..kartankoko] of shortint;{Karttatiedot-tyyppi}
	merkki:char;
	nap: array[1..2,1..7] of char;
	na: array[1..7] of string;
	f: file of char;
	f1: file of integer;
	f2: file of shortint;
	vaih: array[0..4] of string;
	ty: array[1..tykkeja] of TykkiPoint;
	h: array[1..2] of HeliPoint;
kulmakartta,karttaero: real;

{*************************** Kartansuunnittelu ******************************}
procedure kartansuunnittelu;
begin

repeat
	sx:=trunc(320/ktark);
	map[1]:=10;
	for a:=2 to kartankoko do begin
		if map[a-1]>vesi-4 then begin
			b:=random(5);
			if b=0 then
				map[a]:=map[a-1]-korkeusvaihtelu-random(korkeusvaihtelu*2)
			else
				if map[a-1]=vesi then map[a]:=vesi-2 else map[a]:=vesi;
		end
		else map[a]:=map[a-1]+korkeusvaihtelu-random(korkeusvaihtelu*2);
		if map[a]<ylinkorkeus then map[a]:=map[a]+korkeusvaihtelu-random(10);
		if map[a]>vesi+1 then map[a]:=map[a]-korkeusvaihtelu-random(trunc(korkeusvaihtelu/3));
	end;
	map[sx-1]:=-50;
	map[sx]:=-50;
	map[kartankoko]:=vesi;
	map[kartankoko-1]:=vesi-2; 
	map[kartankoko-2]:=vesi;

  h[1].aloituskx:=sx+3+random(3);
	h[2].aloituskx:=kartankoko-5-random(3);
	
	for d:=1 to 2 do begin
		h[d].aloitusx:=round((h[d].aloituskx+0.5)*ktark)-316;
		a:=round(10)+10;
		map[h[d].aloituskx]:=map[h[d].aloituskx]-a;;
		map[h[d].aloituskx+1]:=map[h[d].aloituskx];
		h[d].aloitusy:=trunc(map[h[d].aloituskx]-koko15);
	end;



	for a:=2 to kartankoko do
		if (map[a-1]>vesi-4) and (map[a]>vesi-4) then mapt[a-1]:=4 else mapt[a-1]:=3;



	for d:=1 to 2 do
			mapt[h[d].aloituskx]:=d;

 


	
	for d:=1 to tykkeja do begin
		b:=round(kartankoko/2);
		c:=0;
		repeat
			c:=c+1;
			if d<=tykkeja/2 then a:=random(b-10)+5 else a:=b+random(b-10)+5;
			if c>100 then d:=tykkeja;
		until (c>100) or ((mapt[a]=3) and (map[a]<map[a-1]) and (map[a]<map[a+1]));
		mapt[a]:=d+10;
		ty[d].x:=a;
		ty[d].y:=map[ty[d].x];

		kulmakartta:=-(map[ty[d].x]-map[ty[d].x-1])/ktark;
		karttaero:=koko20;
		ty[d].kory[1]:=ty[d].y+round(karttaero*kulmakartta);

    kulmakartta:=(map[ty[d].x]-map[ty[d].x+1])/ktark;
		karttaero:=koko20;

		ty[d].kory[2]:=ty[d].y-round(karttaero*kulmakartta);
		ty[d].px[1]:=0;
		ty[d].py[1]:=0;
		ty[d].px[2]:=0;
		ty[d].py[2]:=0;
		ty[d].pvx:=0;
		ty[d].pvy:=0;
		ty[d].aste:=0;
		ty[d].matka:=0;
		if d<=tykkeja/2 then ty[d].kohde:=2 else ty[d].kohde:=1;
		if d<=tykkeja/2 then ty[d].puoli:=1 else ty[d].puoli:=2;
		ty[d].energy:=10;
		ty[d].hx:=ty[d].x*ktark-316;
	end;
until c<100;

	_tayttovari(0);
	bar(0,400,639,479);

  	setcolor(2);
		for a:=2 to kartankoko do begin
			if mapt[a-1]=4 then
				setcolor(3)
			else if mapt[a-1]<=2 then
				setcolor(7)
			else setcolor(2);
			line(trunc(a*bb-bb),408+trunc(map[a]*aa),trunc((a-1)*bb-bb),408+trunc(map[a-1]*aa));
		end;
end;




begin
	randomize;
	grafiikkatilaan;


	na[1]:='Kaasua lis„„ ......... ';
	na[2]:='Kaasua pois .......... ';
	na[3]:='Vasen ................ ';
	na[4]:='Ymp„ri k„„ntyminen ... ';
	na[5]:='Oikea ................ ';
	na[6]:='Ampuminen ............ ';
	na[7]:='Aseen vaihto ......... ';

	vaih[0]:='0) Aloita peli';
	vaih[1]:='1) 1-pelaajan n„pp„imet';
	vaih[2]:='2) 2-pelaajan n„pp„imet';
	vaih[3]:='3) Uusi kartta';
  
  kartansuunnittelu;

	settextjustify(centertext,centertext);
	settextstyle(1,0,8);
	setcolor(12);
	outtextXY(322,50,'Helikopteripeli');
	setcolor(14);
	outtextXY(318,54,'Helikopteripeli');
	
  settextjustify(lefttext,lefttext);
	settextstyle(0,0,0);
	setcolor(8);
	for a:=0 to 3 do
		outtextXY(50,200+a*20,vaih[a]);
	

	setcolor(4);
	for a:=0 to 3 do
		outtextXY(49,201+a*20,vaih[a]);

	merkki:='h';
	repeat
		
		merkki:=readkey;
		if (merkki='1') or (merkki='2') then begin
			val(merkki,a,b);
			b:=a mod 2 +1;
			for q:=1 to 7 do begin
				setcolor(8);
				settextjustify(righttext,lefttext);
				outtextXY(590,180+20*q,na[q]);
				setcolor(12);
				outtextXY(589,181+20*q,na[q]);
				repeat
					nap[a,q]:=readkey;
					for c:=1 to 7 do
						if nap[b,c]=nap[a,q] then nap[a,q]:=_esc;
					if q>1 then
						for c:=1 to q-1 do
							if nap[a,c]=nap[a,q] then nap[a,q]:=_ESC;
				until nap[a,q]<>_esc;
				setcolor(8);
				outtextXY(590,180+20*q,+nap[a,q]);
				setcolor(12);
				outtextXY(589,181+20*q,+nap[a,q]);
			end;
			_tayttovari(0);
			delay(200);
			bar(590,192,397,324);
		end;
		if (merkki='3') then kartansuunnittelu;
		if (merkki='0') then begin
			assign(f,'C:\helikopt.nap');
			rewrite(f);
			for c:=1 to 7 do
				write(f,nap[1,c]);
			for c:=1 to 7 do
				write(f,nap[2,c]);
			close(f);
			assign(f1,'C:\helikopt.map');
			rewrite(f1);
			for c:=1 to kartankoko do
				write(f1,map[c]);
			close(f1);
			assign(f2,'C:\helikopt.ma2');
			rewrite(f2);
			for c:=1 to kartankoko do
				write(f2,mapt[c]);
			close(f2);



			
			halt(1);
		end;
	until merkki=_esc;
               

end.

~~~

## HELI2.PAS

Collision is detected by observing following points:
![Helicopter calculations on paper](/assets/pics/page/screenshot/heliplans.JPG){: .mx-auto.d-block :}



~~~

program lenokone;
uses crt,graph,grafiikka;
const
	helikopterisuhde=2;
	kartankoko=70;
	ktark=40;
	panoskimpo=60;
	panosper=2;
	korkeusvaihtelu=60;
	ilmanvastus=1.0013;
	aste=11.25/2;
	maxkaasu=20;
	korkeinvuori=200;
	g=10;         	 {painovoima}
	tykkeja=8;
	panoksia=10;
	panosnopeus=2;
	tyluotiv=1.5;
	panoskantama=500;
	sca=50000;                            {nopeuksien sek„ painovoiman skaala}
	koko10=10/helikopterisuhde; koko15=15/helikopterisuhde;
	koko20=20/helikopterisuhde; koko7=7/helikopterisuhde;
	koko40=40/helikopterisuhde; koko23=23/helikopterisuhde;
	koko25=25/helikopterisuhde; koko17=17/helikopterisuhde;
	vesi=427;
	aaa=vesi+3;
	aa=17/vesi;bb=160/kartankoko;
type
	TykkiPoint = record
		X, Y,hx: integer;
		kory: array[1..2] of integer;
		py: array[1..2] of real;
		px: array[1..2] of real;
		ptx3: array[1..2] of real;
		pvx,pvy,aste:real;
		matka,puoli:byte;
		kohde,energy:shortint;
	end;
	HeliPoint = Record
		x: array[1..2,0..19] of real;
		y: array[1..2,0..19] of real;
    hx: array[1..2] of real;
		kx: array[1..2] of integer;
    rx: array[1..2] of real;
		v,vy,vx,vtuki: real;								{nopeudet}
    vk: shortint;
		k: array[1..2] of real;
    suunta: shortint;
		ka: real;                        
		nap: array[1..6] of char;
		pro,prok: shortint;          {Propellin asento sek„ suunta}
		loser,energy: shortint;
		ampua: integer;
		luoti: shortint;
		pvx,pvy: array[1..panoksia] of real;
		px,py: array[1..2,1..panoksia] of real;
		ptx3: array[1..panoksia] of integer;
		panosmatka: array[1..panoksia] of integer;
		aloitusx,aloituskx,aloitusy:  integer;
		savu: array[1..2,1..11] of integer;
	end;
var
	{x,y,status:integer;}
	kulmakartta,karttaero: real;
	t,t2,a,b,c,d,e,sx:integer;
	merkki:char;
	map: array[1..kartankoko] of integer;{Karttatiedot-korkeus}
	mapt: array[1..kartankoko] of shortint;{Karttatiedot-tyyppi}
	maah: array[0..6] of integer;

	ty: array[1..tykkeja] of TykkiPoint;
	h: array[1..2] of HeliPoint;
{*************************** Kartansuunnittelu ******************************}
procedure kartansuunnittelu;
begin
	
	sx:=trunc(320/ktark);
	map[1]:=10;
	
	for a:=2 to kartankoko do begin
		
		if map[a-1]>vesi-4 then begin
			b:=random(5);
			if b=0 then
				map[a]:=map[a-1]-korkeusvaihtelu-random(korkeusvaihtelu*2)
			else
				if map[a-1]=vesi then map[a]:=vesi-2 else map[a]:=vesi;
		end
		else map[a]:=map[a-1]+korkeusvaihtelu-random(korkeusvaihtelu*2);

		if map[a]<korkeinvuori then map[a]:=map[a]+korkeusvaihtelu-random(10);
		if map[a]>vesi+1 then map[a]:=map[a]-korkeusvaihtelu-random(trunc(korkeusvaihtelu/3));
		if (map[a-1]>vesi-4) and (map[a]>vesi-4) then mapt[a-1]:=2 else mapt[a-1]:=1;

	end;
	mapt[sx-2]:=1;
	map[sx-1]:=-50; mapt[sx-1]:=1;
	map[sx]:=-50;   mapt[sx]:=1;

	h[1].aloituskx:=sx+4;
	h[2].aloituskx:=kartankoko-10;

	
	map[kartankoko]:=vesi; mapt[kartankoko]:=2;
	map[kartankoko-1]:=vesi-2; mapt[kartankoko-1]:=2;
	map[kartankoko-2]:=vesi; mapt[kartankoko-2]:=2;


	
	for d:=1 to 2 do begin
		h[d].aloitusx:=round((h[d].aloituskx+0.5)*ktark)-316;
		a:=round(10)+10;
		map[h[d].aloituskx]:=map[h[d].aloituskx]-a;;
		map[h[d].aloituskx+1]:=map[h[d].aloituskx];
		h[d].aloitusy:=trunc(map[h[d].aloituskx]-koko15);
		mapt[h[d].aloituskx-1]:=1;
		mapt[h[d].aloituskx]:=3;
		mapt[h[d].aloituskx+1]:=1;
	end;

	
	for d:=1 to tykkeja do begin
		b:=round(kartankoko/2);
		c:=0;
		repeat
			c:=c+1;
			if d<=tykkeja/2 then a:=random(b-10)+5 else a:=b+random(b-10)+5;
			if c>100 then halt(1);
		until (mapt[a]=1) and (map[a]<map[a-1]) and (map[a]<map[a+1]);
		mapt[a]:=d+10;
		ty[d].x:=a;
		ty[d].y:=map[ty[d].x];

		kulmakartta:=-(map[ty[d].x]-map[ty[d].x-1])/ktark;
		karttaero:=koko20;
		ty[d].kory[1]:=ty[d].y+round(karttaero*kulmakartta);

    kulmakartta:=(map[ty[d].x]-map[ty[d].x+1])/ktark;
		karttaero:=koko20;

		ty[d].kory[2]:=ty[d].y-round(karttaero*kulmakartta);
		ty[d].px[1]:=0;
		ty[d].py[1]:=0;
		ty[d].px[2]:=0;
		ty[d].py[2]:=0;
		ty[d].pvx:=0;
		ty[d].pvy:=0;
		ty[d].aste:=0;
		ty[d].matka:=0;
		if d<=tykkeja/2 then ty[d].kohde:=2 else ty[d].kohde:=1;
		if d<=tykkeja/2 then ty[d].puoli:=1 else ty[d].puoli:=2;
		ty[d].energy:=10;
		ty[d].hx:=ty[d].x*ktark-316;
	end;
end;





{***************************** Helik. piirtokord. ***************************}
procedure helkkarinkoordinaatit;
var
	c0,c90,s0,s90:real;
	propelli:real;
begin
	
		c0:=kosi(h[d].k[1])*h[d].suunta;
		c90:=kosi(h[d].k[1]+90)*h[d].suunta;
		s0:=sini(h[d].k[1]);
		s90:=sini(h[d].k[1]+90);
		propelli:=koko25-h[d].pro/helikopterisuhde;

	
		h[d].x[1,16]:=h[d].x[1,0]+c0*koko10;
		h[d].y[1,16]:=h[d].y[1,0]+s0*koko10;
		h[d].x[1,14]:=h[d].x[1,16]+c90*koko10;
		h[d].y[1,14]:=h[d].y[1,16]+s90*koko10;
		h[d].x[1,12]:=h[d].x[1,0]+c90*koko10;
		h[d].y[1,12]:=h[d].y[1,0]+s90*koko10;
		h[d].x[1,18]:=h[d].x[1,14]-c0*koko20;
		h[d].y[1,18]:=h[d].y[1,14]-s0*koko20;
		h[d].x[1,15]:=h[d].x[1,0]-c0*koko15;
		h[d].y[1,15]:=h[d].y[1,0]-s0*koko15;
		h[d].x[1,19]:=h[d].x[1,15]+c90*koko7;
		h[d].y[1,19]:=h[d].y[1,15]+s90*koko7;
		h[d].x[1,10]:=h[d].x[1,15]-c90*koko7;
		h[d].y[1,10]:=h[d].y[1,15]-s90*koko7;
		h[d].x[1,17]:=h[d].x[1,18]-c90*koko20;
		h[d].y[1,17]:=h[d].y[1,18]-s90*koko20;
		h[d].x[1,13]:=h[d].x[1,18]-c90*koko40;
		h[d].y[1,13]:=h[d].y[1,18]-s90*koko40;
		h[d].x[1,11]:=h[d].x[1,0]-c90*koko17-c0*koko7;
		h[d].y[1,11]:=h[d].y[1,0]-s90*koko17-s0*koko7;
		h[d].x[1,9]:=h[d].x[1,0]+c0*koko15;
		h[d].y[1,9]:=h[d].y[1,0]+s0*koko15;
		h[d].x[1,8]:=h[d].x[1,9]+c90*koko10;
		h[d].y[1,8]:=h[d].y[1,9]+s90*koko10;

end;
procedure helkkarinkoordinaatit2;
var
	c0,c90,s0,s90:real;
	propelli:real;
begin
	
		c0:=kosi(h[d].k[1])*h[d].suunta;
		c90:=kosi(h[d].k[1]+90)*h[d].suunta;
		s0:=sini(h[d].k[1]);
		s90:=sini(h[d].k[1]+90);
		propelli:=koko25-h[d].pro/helikopterisuhde;

		{h[d].x[1,0]:=h[d].x[1,0];}
		h[d].y[1,0]:=h[d].y[1,0]+h[d].vy;

		h[d].x[1,1]:=h[d].x[1,0]-c90*koko10+c0*koko15;
		h[d].y[1,1]:=h[d].y[1,0]-s90*koko10+s0*koko15;

		h[d].x[1,2]:=h[d].x[1,1]+c90*(koko20+koko10);
		h[d].y[1,2]:=h[d].y[1,1]+s90*(koko20+koko10);

		h[d].x[1,7]:=h[d].x[1,0]-c0*koko20;
		h[d].y[1,7]:=h[d].y[1,0]-s0*koko20;

		h[d].x[1,3]:=h[d].x[1,7]+c90*propelli;
		h[d].y[1,3]:=h[d].y[1,7]+s90*propelli;
		h[d].x[1,4]:=h[d].x[1,7]-c90*propelli;
		h[d].y[1,4]:=h[d].y[1,7]-s90*propelli;

		h[d].x[1,6]:=h[d].x[1,0]-c90*koko17-c0*koko7-c90*koko23;
		h[d].y[1,6]:=h[d].y[1,0]-s90*koko17-s0*koko7-s90*koko23;

		h[d].x[1,5]:=h[d].x[1,6]-c0*koko10;
		h[d].y[1,5]:=h[d].y[1,6]-s0*koko10;


end;
procedure poyta;
begin
	setcolor(15);
	cleardevice;
	line(0,0,0,479);
	line(639,0,639,479);
	line(323,0,323,vesi+2);
	line(316,0,316,vesi+2);
	line(0,vesi+2,316,vesi+2);
	line(323,vesi+2,639,vesi+2);
	line(0,479,639,479);

	line(0,aaa+19,639,aaa+19);
	line(0,aaa+34,639,aaa+34);

	
	line(320,479,320,vesi+2);
	line(317,vesi+2,322,vesi+2);
	line(159,vesi+2,159,aaa+19);
	line(479,vesi+2,479,aaa+19);
	outtextXY(2,453,'Kaasu:');
	outtextXY(322,453,'Kaasu:');
	
end;
{*************************** Kuoleman j„lkeiset tiedot **********************}
procedure alkutiedot;
begin

		h[d].suunta:=d*2-3;
		h[d].energy:=20;
		h[d].x[1,0]:=158;
		h[d].y[1,0]:=h[d].aloitusy;     
		h[d].hx[1]:=h[d].aloitusx; h[d].hx[2]:=h[d].hx[1];
		h[d].rx[1]:=0;
		h[d].rx[2]:=0;
		h[d].kx[1]:=trunc((h[d].hx[1]+h[d].x[1,0])/ktark);
		h[d].kx[2]:=h[d].kx[1];
		h[d].ampua:=0;
		h[d].loser:=0;
		h[d].k[1]:=90; h[d].k[2]:=90; h[d].ka:=0;
		h[d].pro:=0;  h[d].prok:=5;
		h[d].luoti:=0;
    for a:=1 to panoksia do
			h[d].py[1,a]:=500;
		h[d].vk:=0;
		h[d].v:=0;
		h[d].vtuki:=(h[d].vk+g)/sca;
		h[d].vy:=h[d].vk/sca-h[d].vtuki;
		h[d].vx:=0;

		for a:=1 to h[d].energy do begin
			if a<18 then _tayttovari(2);
			if a<11 then _tayttovari(14);
			if a<6 then _tayttovari(4);
			bar(215+a*5+319*(d-1),451,218+a*5+319*(d-1),462);
		end;
		
		helkkarinkoordinaatit2;
		helkkarinkoordinaatit;
	
  	setcolor(2);
		for a:=2 to kartankoko do begin
			if mapt[a-1]=2 then
				setcolor(3)
			else if mapt[a-1]=3 then
				setcolor(7)
			else setcolor(2);
			line(160+320*(d-1)+trunc(a*bb-bb),vesi+4+trunc(map[a]*aa),160+320*(d-1)+trunc((a-1)*bb-bb),vesi+4+trunc(map[a-1]*aa));
		end;
	 	for a:=0 to 19 do begin
			h[d].x[2,a]:=h[d].x[1,a];
			h[d].y[2,a]:=h[d].y[1,a];
		end;
	
	a:=6;
end;
{*************************** Maan piirto peliss„ ****************************}
procedure maapiirto(yk:integer);
begin
	for d:=1 to 2 do begin
		sx:=h[d].kx[yk];
		if h[d].kx[yk]>=kartankoko then sx:=h[d].kx[yk] mod 2 + kartankoko-2;
		if (yk=1) then
			if mapt[sx]=2 then
				setcolor(3)
			else if mapt[sx]=3 then
				setcolor(7)
			else setcolor(2);
		kulmakartta:=(map[sx]-map[sx+1])/ktark;
		karttaero:=h[d].kx[yk]*ktark-h[d].hx[yk]-158+ktark;
	 { if d=1 then begin
			_tayttovari(0);
		bar(90,90,160,110);
		_kirjoitadesluku(100,100,4,4,karttaero);        end;    }

		c:=trunc(kulmakartta*karttaero+map[sx+1]);
		line(165*(d-1)+158*(d-2)+trunc((h[d].kx[yk]+1)*ktark-h[d].hx[yk]),map[sx+1],323*(d-1)+1,c);
		a:=h[d].kx[yk]+1;
		repeat
			sx:=a;
			if a>=kartankoko then sx:=a mod 2 + kartankoko-2;
      if (yk=1) then
				if mapt[sx]=2 then
					setcolor(3)
				else if mapt[sx]=3 then
					setcolor(7)
				else setcolor(2);
			line(trunc(a*ktark-h[d].hx[yk]+165*(d-1)+158*(d-2)),map[sx],trunc((a+1)*ktark-h[d].hx[yk])+165*(d-1)+158*(d-2),map[sx+1]);
			a:=a+1;
		until trunc((a+1)*ktark-h[d].hx[yk])>=474;

		sx:=a;
		if a>=kartankoko then sx:=a mod 2 + kartankoko-2;
    if (yk=1) then
			if mapt[sx]=2 then
				setcolor(3)
			else if mapt[sx]=3 then
				setcolor(7)
			else setcolor(2);
		kulmakartta:=-(map[sx]-map[sx+1])/(ktark);
		karttaero:=474-(a*ktark-h[d].hx[yk]);
	 
		c:=trunc(kulmakartta*(karttaero)+map[sx]);
		line(trunc(a*ktark-h[d].hx[yk]+165*(d-1)+158*(d-2)),map[sx],323*(d-1)+315,c);
    

		for a:=1 to tykkeja do begin
			if (yk=1) then setcolor(13+ty[a].puoli);
			c:=trunc(ty[a].hx-h[d].hx[yk]);
			if (c>koko20-158) and (c<316-koko20-158) then begin
				line(trunc(c-koko20)+158+323*(d-1),ty[a].y-1,trunc(c-koko20)+158+323*(d-1),ty[a].kory[1]);
				line(trunc(c+koko20)+158+323*(d-1),ty[a].y-1,trunc(c+koko20)+158+323*(d-1),ty[a].kory[2]);
        line(trunc(c-koko20)+158+323*(d-1),ty[a].y-1,trunc(c+koko20)+158+323*(d-1),ty[a].y-1);
        if ty[a].energy>0 then
					arc(trunc(c)+158+323*(d-1),ty[a].y-2,0,180,trunc(koko20))
				else if ty[a].energy<0 then begin

					sound(200-ty[a].energy*20);
					if (yk=1) then setcolor(12);
					if yk=1 then
						arc(trunc(c)+158+323*(d-1),ty[a].y-2,0,180,trunc(-ty[a].energy/helikopterisuhde))
					else
				    arc(trunc(c)+158+323*(d-1),ty[a].y-2,0,180,trunc((1-ty[a].energy)/helikopterisuhde));
					if yk=1 then ty[a].energy:=ty[a].energy+1;
					if ty[a].energy=0 then begin
						setcolor(0);
						arc(trunc(c)+158+323*(d-1),ty[a].y-2,0,180,trunc(1/helikopterisuhde));
						nosound;
					end;
					{delay(1000);}

				end;
			end;
		end;
end;


end;
{*************************** Helikopterin piirto peliss„ ********************}
procedure piirto(ply,cd,vari:integer;arx:real);
begin
	setcolor(vari);
	line(trunc(h[cd].x[ply,16]+arx),trunc(h[cd].y[ply,16]),trunc(h[cd].x[ply,14]+arx),trunc(h[cd].y[ply,14]));
	line(trunc(h[cd].x[ply,18]+arx),trunc(h[cd].y[ply,18]),trunc(h[cd].x[ply,8]+arx),trunc(h[cd].y[ply,8]));
	line(trunc(h[cd].x[ply,18]+arx),trunc(h[cd].y[ply,18]),trunc(h[cd].x[ply,19]+arx),trunc(h[cd].y[ply,19]));
	line(trunc(h[cd].x[ply,10]+arx),trunc(h[cd].y[ply,10]),trunc(h[cd].x[ply,19]+arx),trunc(h[cd].y[ply,19]));
	line(trunc(h[cd].x[ply,10]+arx),trunc(h[cd].y[ply,10]),trunc(h[cd].x[ply,17]+arx),trunc(h[cd].y[ply,17]));
	line(trunc(h[cd].x[ply,18]+arx),trunc(h[cd].y[ply,18]),trunc(h[cd].x[ply,13]+arx),trunc(h[cd].y[ply,13]));
	line(trunc(h[cd].x[ply,15]+arx),trunc(h[cd].y[ply,15]),trunc(h[cd].x[ply,7]+arx),trunc(h[cd].y[ply,7]));
	line(trunc(h[cd].x[ply,16]+arx),trunc(h[cd].y[ply,16]),trunc(h[cd].x[ply,11]+arx),trunc(h[cd].y[ply,11]));
	line(trunc(h[cd].x[ply,6]+arx),trunc(h[cd].y[ply,6]),trunc(h[cd].x[ply,11]+arx),trunc(h[cd].y[ply,11]));
	line(trunc(h[cd].x[ply,6]+arx),trunc(h[cd].y[ply,6]),trunc(h[cd].x[ply,5]+arx),trunc(h[cd].y[ply,5]));
	line(trunc(h[cd].x[ply,5]+arx),trunc(h[cd].y[ply,5]),trunc(h[cd].x[ply,13]+arx),trunc(h[cd].y[ply,13]));
	line(trunc(h[cd].x[ply,2]+arx),trunc(h[cd].y[ply,2]),trunc(h[cd].x[ply,1]+arx),trunc(h[cd].y[ply,1]));
	line(trunc(h[cd].x[ply,16]+arx),trunc(h[cd].y[ply,16]),trunc(h[cd].x[ply,9]+arx),trunc(h[cd].y[ply,9]));
	line(trunc(h[cd].x[ply,3]+arx),trunc(h[cd].y[ply,3]),trunc(h[cd].x[ply,4]+arx),trunc(h[cd].y[ply,4]));
	e:=trunc(h[cd].x[ply,12]+arx);
	arc(e,trunc(h[cd].y[ply,12]),trunc(-h[cd].k[ply]*h[cd].suunta+540),trunc(-h[cd].k[ply]*h[cd].suunta+720),trunc(koko10));
end;
{*************************** Helikopterin piirto poisto *********************}
procedure kummaus;
begin
  setcolor(0);
	c:=d mod 2 +1;
	if h[d].rx[2]<>0 then
		piirto(2,c,0,h[d].rx[2]+(c-1)*323);

	piirto(2,d,0,(d-1)*323);
end;
{*************************** R„j„hdys ***************************************}
procedure rajahdys;
begin
 	kummaus;
	{RŽJŽHDYS}

	h[d].x[1,0]:=h[d].x[1,a];
	h[d].y[1,0]:=h[d].y[1,a];

	h[d].x[1,1]:=h[d].x[1,0]-50+random(10);
	sx:=trunc((h[d].hx[1]+h[d].x[1,1])/ktark);
	kulmakartta:=(map[sx+1]-map[sx])/ktark;
	karttaero:=(h[d].hx[1]+h[d].x[1,1])-sx*ktark;
	h[d].y[1,1]:=map[sx]+trunc(karttaero*kulmakartta);

	h[d].x[1,8]:=h[d].x[1,0]-random(10)+50;
	sx:=trunc((h[d].hx[1]+h[d].x[1,8])/ktark);
	kulmakartta:=(map[sx+1]-map[sx])/ktark;
	karttaero:=(h[d].hx[1]+h[d].x[1,8])-sx*ktark;
	h[d].y[1,8]:=map[sx]+trunc(karttaero*kulmakartta);
  for b:=1 to 30 do begin

		h[d].x[1,2]:=h[d].x[1,0]-80+random(10);
		h[d].y[1,2]:=h[d].y[1,0]-50+random(10);

		h[d].x[1,3]:=h[d].x[1,0]-30+random(10);
		h[d].y[1,3]:=h[d].y[1,0]-30+random(10);

		h[d].x[1,4]:=h[d].x[1,0]-80+random(10);
		h[d].y[1,4]:=h[d].y[1,0]-80+random(10);

		h[d].x[1,5]:=h[d].x[1,0]-20+random(10);
		h[d].y[1,5]:=h[d].y[1,0]-40+random(10);

		h[d].x[1,6]:=h[d].x[1,0]-25+random(10);
		h[d].y[1,6]:=h[d].y[1,0]-90+random(10);

		h[d].x[1,7]:=h[d].x[1,0] -5+random(10);
		h[d].y[1,7]:=h[d].y[1,0]-50+random(10);

		h[d].x[1,8]:=h[d].x[1,0]+25-random(10);
		h[d].y[1,8]:=h[d].y[1,0]-90+random(10);

		h[d].x[1,9]:=h[d].x[1,0]+20-random(10);
		h[d].y[1,9]:=h[d].y[1,0]-40+random(10);

		h[d].x[1,10]:=h[d].x[1,0]+80-random(10);
		h[d].y[1,10]:=h[d].y[1,0]-80+random(10);

		h[d].x[1,11]:=h[d].x[1,0]+30-random(10);
		h[d].y[1,11]:=h[d].y[1,0]-30+random(10);

		h[d].x[1,12]:=h[d].x[1,0]+80-random(10);
		h[d].y[1,12]:=h[d].y[1,0]-50+random(10);

			
  	setcolor(15);
  	for a:=1 to 12 do
			line(trunc(h[d].x[1,a]),trunc(h[d].y[1,a]),trunc(h[d].x[1,a+1]),trunc(h[d].y[1,a+1]));
		{_maalaa(trunc(h[d].x[1,0]),trunc(h[d].y[1,0])-10,4,15); }
		delay(500);
		sound(random(100));
		setcolor(0);
		{_maalaa(trunc(h[d].x[1,0]),trunc(h[d].y[1,0])-10,0,15);}
		for a:=1 to 12 do
		line(trunc(h[d].x[1,a]),trunc(h[d].y[1,a]),trunc(h[d].x[1,a+1]),trunc(h[d].y[1,a+1]));
	end;
	nosound;
	
end;

begin
	randomize;
	grafiikkatilaan;
  

	h[1].nap[1]:='a'; h[2].nap[1]:='8';
	h[1].nap[2]:='z'; h[2].nap[2]:='2';
	h[1].nap[3]:='x'; h[2].nap[3]:='4';
	h[1].nap[4]:='c'; h[2].nap[4]:='5';
	h[1].nap[5]:='v'; h[2].nap[5]:='6';
	h[1].nap[6]:=_space; h[2].nap[6]:=_ret;
	t:=0;t2:=0;
	merkki:='i';

	kartansuunnittelu;
	poyta;
	for d:=1 to 2 do
		alkutiedot;
	{delay(5000);}

  {*************************** Pelin kierto *********************************}
	repeat
		{putpixel(x,y,0);luehiiri(x,y,status);putpixel(x,y,15);}
    t:=t mod 200 + 1;                     {Kuin monta kuvaa piirt„m„tt„}
    {************************* N„pp„imet ************************************}
    if keypressed then begin
			merkki:=readkey;
			for d:=1 to 2 do begin
		if h[d].loser<11 then begin
				{********************* Kaasu + **************************************}
				if merkki=h[d].nap[1] then begin
					if (trunc(h[d].vk)>-maxkaasu) then begin
						h[d].vk:=h[d].vk-2;
            if h[d].vtuki<>0 then h[d].vtuki:=0;
						_tayttovari(2);
						if h[d].vk>-11 then _tayttovari(14);
						if h[d].vk>-6 then _tayttovari(4);
						bar(40-trunc(h[d].vk*5)+319*(d-1),451,48-trunc(h[d].vk*5)+319*(d-1),462);
					end;
				end;
				{********************* Kaasu - **************************************}
				if merkki=h[d].nap[2] then begin
					if (trunc(h[d].vk)<0) then begin
						h[d].vk:=h[d].vk+2;
						_tayttovari(0);
						bar(50-trunc(h[d].vk*5)+319*(d-1),451,58-trunc(h[d].vk*5)+319*(d-1),462);
					end;
				end;
				{********************* K„„ntyminen - ********************************}
				if (merkki=h[d].nap[3]) and (h[d].vtuki=0) then begin
					h[d].k[1]:=h[d].k[1]-aste*h[d].suunta;
					if h[d].k[1]<0 then h[d].k[1]:=h[d].k[1]+360;
					if h[d].k[1]>360 then h[d].k[1]:=h[d].k[1]-360;
				end;

				{******************** Ymp„ri k„„ntyminen ***************************}
				if (merkki=h[d].nap[4]) and (h[d].vtuki=0) then begin
					if h[d].ka=0 then begin
					 	setcolor(0);
						if h[d].rx[2]<>0 then
							piirto(2,d,0,-h[d].rx[2]+(d-1)*323);
						piirto(2,d,0,(d-1)*323);
						if h[d].suunta=1 then h[d].suunta:=-1 else h[d].suunta:=1;
					end
					else h[d].ka:=0;
				end;
				{********************* K„„ntyminen + ********************************}
				if (merkki=h[d].nap[5]) and (h[d].vtuki=0) then begin
					h[d].k[1]:=h[d].k[1]+aste*h[d].suunta;
					if h[d].k[1]<0 then h[d].k[1]:=h[d].k[1]+360;
					if h[d].k[1]>360 then h[d].k[1]:=h[d].k[1]-360;
				end;
				{********************* Ampuminen ************************************}
				if (merkki=h[d].nap[6])  then begin
					if h[d].ampua=0 then
						h[d].ampua:=h[d].ampua+panosper
					else h[d].ampua:=0;
				end;
		end;
      end;
		end;
    {************************* Luodin l„ht”arvot ****************************}
		if t mod 20=0 then
			for d:=1 to 2 do 
				if h[d].ampua<>0 then begin
					h[d].luoti:=h[d].luoti mod panoksia + 1;
					if (h[d].py[1,h[d].luoti])=500 then begin
						h[d].ampua:=h[d].ampua-1;
						h[d].px[1,h[d].luoti]:=h[d].hx[1]+h[d].x[1,2];
						h[d].px[2,h[d].luoti]:=h[d].px[1,h[d].luoti]-h[d].hx[1];
						h[d].py[1,h[d].luoti]:=h[d].y[1,2];
						h[d].py[2,h[d].luoti]:=h[d].py[1,h[d].luoti];
						h[d].ptx3[h[d].luoti]:=trunc(h[d].px[1,h[d].luoti]-h[d mod 2 + 1].hx[1]);

						c:=90;
						h[d].pvx[h[d].luoti]:=h[d].suunta*kosi(h[d].k[1]+c)*panosnopeus/(1+random(10)/40);
						h[d].pvy[h[d].luoti]:=sini(h[d].k[1]+c)*panosnopeus/(1+random(10)/40);
				
						h[d].panosmatka[h[d].luoti]:=panoskantama;
					end;
				end;

		{************************* t ****************************************}

		if (t mod 100=0) then begin
			t2:=t2 mod tykkeja +1;
			
			if (ty[t2].matka=0) and (ty[t2].energy>0) then begin
				ty[t2].aste:=sqrt(sqr(ty[1].y-1-h[ty[t2].kohde].y[1,0])+sqr(ty[t2].hx-h[ty[t2].kohde].hx[1]));
					if (ty[t2].aste<250) then begin
					ty[t2].aste:=(ty[t2].y-1-h[ty[t2].kohde].y[1,0])/(ty[t2].hx-h[ty[t2].kohde].hx[1]);

					ty[t2].pvx:=-(ty[t2].hx-h[ty[t2].kohde].hx[1])/100;
					ty[t2].pvy:=ty[t2].pvx*ty[t2].aste;

					ty[t2].aste:=tyluotiv/(sqrt(sqr(ty[t2].pvx)+sqr(ty[t2].pvy)));

					ty[t2].pvx:=ty[t2].pvx*ty[t2].aste;
					ty[t2].pvy:=ty[t2].pvy*ty[t2].aste;

					ty[t2].px[1]:=ty[t2].hx+(koko20/tyluotiv)*ty[t2].pvx;
					ty[t2].px[2]:=ty[t2].px[1];
					ty[t2].py[1]:=ty[t2].y-1+(koko20/tyluotiv)*ty[t2].pvy;
					ty[t2].py[2]:=ty[t2].py[1];
					ty[t2].matka:=150;
				end;
			end;
		end;

for e:=1 to tykkeja do
	if ty[e].matka<>0 then begin
		ty[e].px[1]:=ty[e].px[1]+ty[e].pvx;
		ty[e].py[1]:=ty[e].py[1]+ty[e].pvy;
		ty[e].matka:=ty[e].matka-1;

    for d:=1 to 2 do begin
			if (sqrt(sqr(ty[e].px[1]-h[d].hx[1])+sqr(ty[e].py[1]-h[d].y[1,0]))<koko15) then begin
				sound(300);
				delay(1);
				nosound;
				delay(1);  
						
				_tayttovari(8);
				bar(215+h[d].energy*5+319*(d-1),451,218+h[d].energy*5+319*(d-1),462);
				h[d].energy:=h[d].energy-1;
				if h[d].energy=0 then begin
					bar(215+h[d].energy*5+319*(d-1),451,218+h[d].energy*5+319*(d-1),462);
					{setcolor(6);
					circle(trunc(xx[1,d,0]),trunc(h[d].y[1,0]),70);
					_maalaa(trunc(xx[1,d,0]),trunc(h[d].y[1,0]),14,6);}
					h[d].loser:=11;
					h[d].vk:=0;
				end;
				if h[d].energy<=10 then begin
					h[d].loser:=11-h[d].energy
        end;
				if h[d].vtuki<>0 then h[d].vtuki:=0;
				h[d].vx:=h[d].vx+ty[e].pvx/panoskimpo;
				h[d].vy:=h[d].vy+ty[e].pvy/panoskimpo;
				ty[e].matka:=0;
			end;
		end;
	
	 	for d:=1 to 2 do begin
		if (abs(ty[e].ptx3[d])<=157)  then
			putpixel(trunc(ty[e].ptx3[d]+158+323*(d-1)),trunc(ty[e].py[2]),0);
		if (abs(ty[e].px[1]-h[d].hx[1])<=157) and (ty[e].matka>0)  then
			putpixel(trunc(ty[e].px[1]-h[d].hx[1]+158+323*(d-1)),trunc(ty[e].py[1]),13+ty[e].puoli);
		end;
    
    for d:=1 to 2 do begin
			ty[e].px[2]:=ty[e].px[1]-h[d].hx[1];
			ty[e].ptx3[d]:=ty[e].px[2];
		end;
		ty[e].py[2]:=ty[e].py[1];

end;



		{************************* Hidastaja jos ei panoksia ********************}
		for d:=1 to 2 do
			if h[d].ampua=0 then delay(5);
		{************************* Panoksia liikkuu *****************************}
		for a:=1 to panoksia do
			for d:=1 to 2 do
				if h[d].py[1,a]<500 then begin
					h[d].px[1,a]:=h[d].px[1,a]+h[d].pvx[a];
					h[d].py[1,a]:=h[d].py[1,a]+h[d].pvy[a];
					h[d].panosmatka[a]:=h[d].panosmatka[a]-1;
          
          {panos katoo}
					if h[d].panosmatka[a]=0 then
						h[d].py[1,a]:=500;
			 
					
					sx:=trunc((h[d].px[1,a]+158)/ktark);   
					karttaero:=h[d].px[1,a]+158-sx*ktark;

					if sx<1 then sx:=1;
					if sx>=kartankoko then sx:=sx mod 2 + kartankoko-2;
					kulmakartta:=-(map[sx]-map[sx+1])/ktark;
					maah[0]:=map[sx]+trunc(karttaero*kulmakartta);

					if (maah[0]<h[d].py[1,a]) then
						h[d].py[1,a]:=500;

       
					if (trunc(h[d].px[1,a]-h[d].hx[1])<=315) and (trunc(h[d].px[1,a]-h[d].hx[1])>=1)then
						putpixel(trunc(h[d].px[1,a]-h[d].hx[1])+323*(d-1),trunc(h[d].py[1,a]),13+d);
					if (trunc(h[d].px[2,a])<=315) and (trunc(h[d].px[2,a])>=1) then
						putpixel(trunc(h[d].px[2,a])+323*(d-1),trunc(h[d].py[2,a]),0);
				 	 

          {toisen kuvaruutu panokset}
		 			c:=d mod 2 +1;
					if (sqrt(sqr(h[d].px[1,a]-h[c].hx[1]-158)+sqr(h[d].py[1,a]-h[c].y[1,0]))<koko15) then begin
						sound(300);
						delay(1);
						nosound;
						delay(1);  
						h[d].panosmatka[a]:=1;
						_tayttovari(8);
						bar(215+h[c].energy*5+319*(c-1),451,218+h[c].energy*5+319*(c-1),462);
						h[c].energy:=h[c].energy-1;
						if h[c].energy=0 then begin
							bar(215+h[c].energy*5+319*(c-1),451,218+h[c].energy*5+319*(c-1),462);
							{setcolor(6);
							circle(trunc(xx[1,c,0]),trunc(h[c].y[1,0]),70);
							_maalaa(trunc(xx[1,c,0]),trunc(h[c].y[1,0]),14,6);}
							h[c].loser:=11;
							h[c].vk:=0;
						end;
						if h[c].energy<=10 then begin
							h[c].loser:=11-h[c].energy
							
						end;
						if h[c].vtuki<>0 then h[c].vtuki:=0;
						h[c].vx:=h[c].vx+h[d].pvx[a]/panoskimpo;
						h[c].vy:=h[c].vy+h[d].pvy[a]/panoskimpo;
					end;
					for e:=1 to tykkeja do
						if ty[e].energy>0 then 
			    		if (sqrt(sqr(h[d].px[1,a]-ty[e].hx-158)+sqr(h[d].py[1,a]-ty[e].y))<koko20) then begin
								sound(400);
								delay(1);
								nosound;
								delay(1);
								h[d].panosmatka[a]:=1;
								ty[e].energy:=ty[e].energy-1;
              	if ty[e].energy=0 then begin
							  	ty[e].energy:=-20;
								end;
            	end;
					if (trunc(h[d].px[1,a]-h[c].hx[1])<=315) and (trunc(h[d].px[1,a]-h[c].hx[1])>=1) then
						putpixel(trunc(h[d].px[1,a]-h[c].hx[1]+323*(2-d)),trunc(h[d].py[1,a]),13+d);
					if (trunc(h[d].ptx3[a])<=315) and (trunc(h[d].ptx3[a])>=1) then
						putpixel(h[d].ptx3[a]+323*(2-d),trunc(h[d].py[2,a]),0);

					h[d].ptx3[a]:=trunc(h[d].px[1,a]-h[c].hx[1]);
							
					h[d].px[2,a]:=h[d].px[1,a]-h[d].hx[1]; h[d].py[2,a]:=h[d].py[1,a];
				end;                                              
		{if t mod 20=1 then begin
			_tayttovari(0);
			bar(1,1,100,30);
			setcolor(15);
			d:=1;
			_kirjoitadesluku(2,2,4,4,ty[1].kory[1]);
			_kirjoitadesluku(2,12,4,4,-random(3)+1);
               
		end;}

		{************************* K„„nt„j„ *************************************}
		if (t mod 20 = 15) then
			for d:=1 to 2 do
				if (h[d].loser>=11) then begin
					a:=-random(3)+1;
					h[d].k[1]:=h[d].k[1]+h[d].suunta*aste*a;
					if h[d].k[1]<0 then h[d].k[1]:=h[d].k[1]+360;
					if h[d].k[1]>360 then h[d].k[1]:=h[d].k[1]-360;
					
        end;
		{************************* Vauhdit & Paikkakordinaatit ******************}
		for d:=1 to 2 do begin
			h[d].v:=h[d].vk/sca;
			h[d].vy:=h[d].vy+sini(h[d].k[1])*h[d].v+g/sca-h[d].vtuki;
			h[d].vx:=h[d].vx+kosi(h[d].k[1])*h[d].v*h[d].suunta;
			{ILMANVASTUS}
			h[d].vy:=h[d].vy/ilmanvastus;
			h[d].vx:=h[d].vx/ilmanvastus;
			h[d].hx[1]:=h[d].hx[1]+h[d].vx;
			h[d].kx[1]:=trunc((h[d].hx[1]+h[d].x[1,0]+1)/ktark);
		end;
		{************************************************************************}
    for d:=1 to 2 do
			helkkarinkoordinaatit2;
		{************************* Kattoon lento ********************************}
		if (t=3) then
			for d:=1 to 2 do
				if (h[d].y[1,0]<koko10) and (h[d].vk<>0) then begin
          _tayttovari(0);
					bar(50+319*(d-1),451,48-trunc(h[d].vk*5)+319*(d-1),462);
					h[d].vk:=0;
				end;
		{************************* Maahan t”rm„„minen ***************************}
		for d:=1 to 2 do begin
    	for a:=1 to 6 do begin
				karttaero:=h[d].kx[1]*ktark-h[d].hx[1]-158;
				c:=0;
				repeat
					c:=c+1;
					karttaero:=karttaero+ktark;
				until karttaero+ktark>=h[d].x[1,a];

				sx:=h[d].kx[1]+c;
      
				if sx<1 then sx:=1;
				if sx>=kartankoko then sx:=sx mod 2 + kartankoko-2;
				kulmakartta:=-(map[sx]-map[sx+1])/ktark;
				karttaero:=-((h[d].kx[1]+c)*ktark-h[d].hx[1]-158-h[d].x[1,a]);
				maah[a]:=map[sx]+round(karttaero*kulmakartta);
			 	
        {
        setcolor(0);
				if (d=2) and (a=6) then line(trunc(h[d].x[2,a]+323*(d-1)),447,trunc(h[d].x[2,a]+323*(d-1)),260);
				setcolor(15);
				if (d=2) and (a=6) then line(trunc(h[d].x[1,a]+323*(d-1)),447,trunc(h[d].x[1,a]+323*(d-1)),maah[0]);
			  }				 
			end;
			for a:=1 to 6 do
				if h[d].y[1,a]>maah[a] then begin
          {** laskeutuminen **}
				if (maah[1]<443) and (h[d].vy<0.2) and (abs(maah[1]-maah[2])<1) and (a<3) and (h[d].k[1]>80) and (h[d].k[1]<110) then begin
						h[d].y[1,0]:=maah[1]-koko15-1;
						h[d].k[1]:=90;
						h[d].ka:=0;
						h[d].vtuki:=(h[d].vk+g)/sca;
						if h[d].vtuki<0 then h[d].vtuki:=0;
						h[d].v:=h[d].vk/sca;
						h[d].vy:=0;
						h[d].vx:=0;
					 	helkkarinkoordinaatit2;
						helkkarinkoordinaatit;
					end
				 	else h[d].loser:=100;  
				end;
		end;
		{************************* Kummaus **************************************}
		if t mod 20=0 then begin
			for d:=1 to 2 do
				helkkarinkoordinaatit;
			for d:=1 to 2 do
				kummaus;
			setcolor(0);
			maapiirto(2); {maa}
		end;
    {************************* Piirto Maa & Helik. **************************}
		if t mod 20=0 then begin
			setcolor(15);
			for d:=1 to 2 do begin
      	c:=d mod 2 +1;
				if abs(h[d].hx[1]-h[c].hx[1])<157-koko40 then begin
					h[d].rx[1]:=h[c].hx[1]-h[d].hx[1]-323*(c-d);
					piirto(1,c,c+13,h[d].rx[1]+(c-1)*323);
				end
				else h[d].rx[1]:=0;
				h[d].rx[2]:=h[d].rx[1];
      
				piirto(1,d,d+13,(d-1)*323);

				h[d].pro:=h[d].pro+h[d].prok*trunc(-h[d].vk/2);
				if h[d].pro>25 then h[d].pro:=25;
				if h[d].pro<0 then h[d].pro:=0;
				if h[d].pro=25 then h[d].prok:=-1;
				if h[d].pro=0 then h[d].prok:=1;
	
		  end;
			{maa}
      setcolor(2);
      maapiirto(1);

      
      for a:=1 to 2 do begin
				for d:=1 to 2 do
					if (h[d].kx[2]<kartankoko-1) and (h[d].y[2,0]>0) then
						putpixel(160+319*(a-1)+trunc((h[d].hx[2]+316)*bb/ktark-bb),aaa+trunc(h[d].y[2,0]*aa+aa),0);
				for d:=1 to 2 do
					if (h[d].kx[1]<kartankoko-1) and (h[d].y[1,0]>0) then
						putpixel(160+319*(a-1)+trunc((h[d].hx[1]+316)*bb/ktark-bb),aaa+trunc(h[d].y[1,0]*aa+aa),13+d);
			end;	


			{savu}
		{	if h[d].loser>0 then
				for a:=1 to h[d].loser do
      }



      for d:=1 to 2 do begin
				for a:=0 to 19 do begin
					h[d].x[2,a]:=h[d].x[1,a];
					h[d].y[2,a]:=h[d].y[1,a];
				end;
				h[d].hx[2]:=h[d].hx[1];
				h[d].k[2]:=h[d].k[1];
				h[d].kx[2]:=h[d].kx[1];
			end;
			
		end;
		{************************* Kuoleminen ***********************************}
		for d:=1 to 2 do
			if h[d].loser=100 then begin
				
				{rajahdys;}
				{if h[d].loser=100 then d:=d mod 2 +1;}
        if h[d].rx[2]<>0 then
					piirto(2,d,0,-h[d].rx[2]+(d-1)*323);
				
				
				{setcolor(12);
				outtextXY(10,235,'Winner: PLAYER');
				 _kirjoitakokluku(380,235,1,d);
				delay(20000);}
				_tayttovari(0);
				bar(1+323*(d-1),0,315+323*(d-1),vesi);
			 	bar(50+319*(d-1),451,48-trunc(h[d].vk*5)+319*(d-1),462);
				alkutiedot;  {Energia loppu PS. kato yl”s}
			end;

	until merkki=_esc;
end.
		
~~~

## HELI3.PAS - Latest version
Some improvements, e.g. start screen with action key selection and more enemy cannons, which make game even slower. ALOITUS.PAS combined to the game.

![HELI.exe](/assets/pics/page/screenshot/Helikopteripelikartta.JPG){: .mx-auto.d-block :}

~~~
program lenokone;
uses crt,graph,grafiikka;
const
	helikopterisuhde=2;
	kartankoko=90;
	ktark=50;
	panoskimpo=60;
	panosper=2;
	korkeusvaihtelu=60;
	ilmanvastus=1.0013;
	aste=11.25/2;
	maxkaasu=20;
	korkeinvuori=200;
	g=10;         	 {painovoima}
	tykkeja=8;
	panoksia=10;
	panosnopeus=2;
	tyluotiv=1.5;
	panoskantama=500;
	sca=50000;                            {nopeuksien sek„ painovoiman skaala}
	koko10=10/helikopterisuhde; koko15=15/helikopterisuhde;
	koko20=20/helikopterisuhde; koko7=7/helikopterisuhde;
	koko40=40/helikopterisuhde; koko23=23/helikopterisuhde;
	koko25=25/helikopterisuhde; koko17=17/helikopterisuhde;
	vesi=427;
	aaa=vesi+3;
	aa=17/vesi;bb=160/kartankoko;
type
	TykkiPoint = record
		X, Y,hx: integer;
		kory: array[1..2] of integer;
		py: array[1..2] of real;
		px: array[1..2] of real;
		ptx3: array[1..2] of real;
		pvx,pvy,aste:real;
		matka,puoli:byte;
		kohde,energy:shortint;
	end;
	HeliPoint = Record
		x: array[1..2,0..19] of real;
		y: array[1..2,0..19] of real;
    hx: array[1..2] of real;
		kx: array[1..2] of integer;
    rx: array[1..2] of real;
		v,vy,vx,vtuki: real;								{nopeudet}
    vk: shortint;
		k: array[1..2] of real;
    suunta: shortint;
		ka: real;                        
		nap: array[1..7] of char;
		pro,prok: shortint;          {Propellin asento sek„ suunta}
		loser,energy: shortint;
		ampua: integer;
		luoti: shortint;
		pvx,pvy: array[1..panoksia] of real;
		px,py: array[1..2,1..panoksia] of real;
		ptx3: array[1..panoksia] of integer;
		panosmatka: array[1..panoksia] of integer;
		aloitusx,aloituskx,aloitusy:  integer;
		savu: array[1..2,1..11] of integer;
	end;
var
	{x,y,status:integer;}
	kulmakartta,karttaero: real;
	t,t2,a,b,c,d,e,q,sx:integer;
	merkki:char;
	map: array[1..kartankoko] of integer;{Karttatiedot-korkeus}
	mapt: array[1..kartankoko] of shortint;{Karttatiedot-tyyppi}
	maah: array[0..6] of integer;
	vaih: array[0..4] of string;
  na: array[1..7] of string;
	ty: array[1..tykkeja] of TykkiPoint;
	h: array[1..2] of HeliPoint;
{*************************** Kartansuunnittelu ******************************}
procedure kartansuunnittelu;
begin
	
	sx:=trunc(320/ktark);
	map[1]:=10;
	
	for a:=2 to kartankoko do begin
		
		if map[a-1]>vesi-4 then begin
			b:=random(5);
			if b=0 then
				map[a]:=map[a-1]-korkeusvaihtelu-random(korkeusvaihtelu*2)
			else
				if map[a-1]=vesi then map[a]:=vesi-2 else map[a]:=vesi;
		end
		else map[a]:=map[a-1]+korkeusvaihtelu-random(korkeusvaihtelu*2);

		if map[a]<korkeinvuori then map[a]:=map[a]+korkeusvaihtelu-random(10);
		if map[a]>vesi+1 then map[a]:=map[a]-korkeusvaihtelu-random(trunc(korkeusvaihtelu/3));
		if (map[a-1]>vesi-4) and (map[a]>vesi-4) then mapt[a-1]:=2 else mapt[a-1]:=1;

	end;
	mapt[sx-2]:=1;
	map[sx-1]:=-50; mapt[sx-1]:=1;
	map[sx]:=-50;   mapt[sx]:=1;

	h[1].aloituskx:=sx+4;
	h[2].aloituskx:=kartankoko-10;

	
	map[kartankoko]:=vesi; mapt[kartankoko]:=2;
	map[kartankoko-1]:=vesi-2; mapt[kartankoko-1]:=2;
	map[kartankoko-2]:=vesi; mapt[kartankoko-2]:=2;


	
	for d:=1 to 2 do begin
		h[d].aloitusx:=round((h[d].aloituskx+0.5)*ktark)-316;
		a:=round(10)+10;
		map[h[d].aloituskx]:=map[h[d].aloituskx]-a;;
		map[h[d].aloituskx+1]:=map[h[d].aloituskx];
		h[d].aloitusy:=trunc(map[h[d].aloituskx]-koko15);
		mapt[h[d].aloituskx-1]:=1;
		mapt[h[d].aloituskx]:=3;
		mapt[h[d].aloituskx+1]:=1;
	end;

	
	for d:=1 to tykkeja do begin
		b:=round(kartankoko/2);
		c:=0;
		repeat
			c:=c+1;
			if d<=tykkeja/2 then a:=random(b-10)+5 else a:=b+random(b-10)+5;
			if c>100 then halt(1);
		until (mapt[a]=1) and (map[a]<map[a-1]) and (map[a]<map[a+1]);
		mapt[a]:=d+10;
		ty[d].x:=a;
		ty[d].y:=map[ty[d].x];

		kulmakartta:=-(map[ty[d].x]-map[ty[d].x-1])/ktark;
		karttaero:=koko20;
		ty[d].kory[1]:=ty[d].y+round(karttaero*kulmakartta);

    kulmakartta:=(map[ty[d].x]-map[ty[d].x+1])/ktark;
		karttaero:=koko20;

		ty[d].kory[2]:=ty[d].y-round(karttaero*kulmakartta);
		ty[d].px[1]:=0;
		ty[d].py[1]:=0;
		ty[d].px[2]:=0;
		ty[d].py[2]:=0;
		ty[d].pvx:=0;
		ty[d].pvy:=0;
		ty[d].aste:=0;
		ty[d].matka:=0;
		if d<=tykkeja/2 then ty[d].kohde:=2 else ty[d].kohde:=1;
		if d<=tykkeja/2 then ty[d].puoli:=1 else ty[d].puoli:=2;
		ty[d].energy:=10;
		ty[d].hx:=ty[d].x*ktark-316;
	end;
end;





{***************************** Helik. piirtokord. ***************************}
procedure helkkarinkoordinaatit;
var
	c0,c90,s0,s90:real;
	propelli:real;
begin
	
		c0:=kosi(h[d].k[1])*h[d].suunta;
		c90:=kosi(h[d].k[1]+90)*h[d].suunta;
		s0:=sini(h[d].k[1]);
		s90:=sini(h[d].k[1]+90);
		propelli:=koko25-h[d].pro/helikopterisuhde;

	
		h[d].x[1,16]:=h[d].x[1,0]+c0*koko10;
		h[d].y[1,16]:=h[d].y[1,0]+s0*koko10;
		h[d].x[1,14]:=h[d].x[1,16]+c90*koko10;
		h[d].y[1,14]:=h[d].y[1,16]+s90*koko10;
		h[d].x[1,12]:=h[d].x[1,0]+c90*koko10;
		h[d].y[1,12]:=h[d].y[1,0]+s90*koko10;
		h[d].x[1,18]:=h[d].x[1,14]-c0*koko20;
		h[d].y[1,18]:=h[d].y[1,14]-s0*koko20;
		h[d].x[1,15]:=h[d].x[1,0]-c0*koko15;
		h[d].y[1,15]:=h[d].y[1,0]-s0*koko15;
		h[d].x[1,19]:=h[d].x[1,15]+c90*koko7;
		h[d].y[1,19]:=h[d].y[1,15]+s90*koko7;
		h[d].x[1,10]:=h[d].x[1,15]-c90*koko7;
		h[d].y[1,10]:=h[d].y[1,15]-s90*koko7;
		h[d].x[1,17]:=h[d].x[1,18]-c90*koko20;
		h[d].y[1,17]:=h[d].y[1,18]-s90*koko20;
		h[d].x[1,13]:=h[d].x[1,18]-c90*koko40;
		h[d].y[1,13]:=h[d].y[1,18]-s90*koko40;
		h[d].x[1,11]:=h[d].x[1,0]-c90*koko17-c0*koko7;
		h[d].y[1,11]:=h[d].y[1,0]-s90*koko17-s0*koko7;
		h[d].x[1,9]:=h[d].x[1,0]+c0*koko15;
		h[d].y[1,9]:=h[d].y[1,0]+s0*koko15;
		h[d].x[1,8]:=h[d].x[1,9]+c90*koko10;
		h[d].y[1,8]:=h[d].y[1,9]+s90*koko10;

end;
procedure helkkarinkoordinaatit2;
var
	c0,c90,s0,s90:real;
	propelli:real;
begin
	
		c0:=kosi(h[d].k[1])*h[d].suunta;
		c90:=kosi(h[d].k[1]+90)*h[d].suunta;
		s0:=sini(h[d].k[1]);
		s90:=sini(h[d].k[1]+90);
		propelli:=koko25-h[d].pro/helikopterisuhde;

		{h[d].x[1,0]:=h[d].x[1,0];}
		h[d].y[1,0]:=h[d].y[1,0]+h[d].vy;

		h[d].x[1,1]:=h[d].x[1,0]-c90*koko10+c0*koko15;
		h[d].y[1,1]:=h[d].y[1,0]-s90*koko10+s0*koko15;

		h[d].x[1,2]:=h[d].x[1,1]+c90*(koko20+koko10);
		h[d].y[1,2]:=h[d].y[1,1]+s90*(koko20+koko10);

		h[d].x[1,7]:=h[d].x[1,0]-c0*koko20;
		h[d].y[1,7]:=h[d].y[1,0]-s0*koko20;

		h[d].x[1,3]:=h[d].x[1,7]+c90*propelli;
		h[d].y[1,3]:=h[d].y[1,7]+s90*propelli;
		h[d].x[1,4]:=h[d].x[1,7]-c90*propelli;
		h[d].y[1,4]:=h[d].y[1,7]-s90*propelli;

		h[d].x[1,6]:=h[d].x[1,0]-c90*koko17-c0*koko7-c90*koko23;
		h[d].y[1,6]:=h[d].y[1,0]-s90*koko17-s0*koko7-s90*koko23;

		h[d].x[1,5]:=h[d].x[1,6]-c0*koko10;
		h[d].y[1,5]:=h[d].y[1,6]-s0*koko10;


end;
procedure poyta;
begin
	setcolor(15);
	cleardevice;
	line(0,0,0,479);
	line(639,0,639,479);
	line(323,0,323,vesi+2);
	line(316,0,316,vesi+2);
	line(0,vesi+2,316,vesi+2);
	line(323,vesi+2,639,vesi+2);
	line(0,479,639,479);

	line(0,aaa+19,639,aaa+19);
	line(0,aaa+34,639,aaa+34);

	
	line(320,479,320,vesi+2);
	line(317,vesi+2,322,vesi+2);
	line(159,vesi+2,159,aaa+19);
	line(479,vesi+2,479,aaa+19);
	outtextXY(2,453,'Kaasu:');
	outtextXY(322,453,'Kaasu:');
	
end;
{*************************** Kuoleman j„lkeiset tiedot **********************}
procedure alkutiedot;
begin

		h[d].suunta:=d*2-3;
		h[d].energy:=20;
		h[d].x[1,0]:=158;
		h[d].y[1,0]:=h[d].aloitusy;     
		h[d].hx[1]:=h[d].aloitusx; h[d].hx[2]:=h[d].hx[1];
		h[d].rx[1]:=0;
		h[d].rx[2]:=0;
		h[d].kx[1]:=trunc((h[d].hx[1]+h[d].x[1,0])/ktark);
		h[d].kx[2]:=h[d].kx[1];
		h[d].ampua:=0;
		h[d].loser:=0;
		h[d].k[1]:=90; h[d].k[2]:=90; h[d].ka:=0;
		h[d].pro:=0;  h[d].prok:=5;
		h[d].luoti:=0;
    for a:=1 to panoksia do
			h[d].py[1,a]:=500;
		h[d].vk:=0;
		h[d].v:=0;
		h[d].vtuki:=(h[d].vk+g)/sca;
		h[d].vy:=h[d].vk/sca-h[d].vtuki;
		h[d].vx:=0;

		for a:=1 to h[d].energy do begin
			if a<18 then _tayttovari(2);
			if a<11 then _tayttovari(14);
			if a<6 then _tayttovari(4);
			bar(215+a*5+319*(d-1),451,218+a*5+319*(d-1),462);
		end;
		
		helkkarinkoordinaatit2;
		helkkarinkoordinaatit;
	
  	setcolor(2);
		for a:=2 to kartankoko do begin
			if mapt[a-1]=2 then
				setcolor(3)
			else if mapt[a-1]=3 then
				setcolor(7)
			else setcolor(2);
			line(160+320*(d-1)+trunc(a*bb-bb),vesi+4+trunc(map[a]*aa),160+320*(d-1)+trunc((a-1)*bb-bb),vesi+4+trunc(map[a-1]*aa));
		end;
	 	for a:=0 to 19 do begin
			h[d].x[2,a]:=h[d].x[1,a];
			h[d].y[2,a]:=h[d].y[1,a];
		end;
	
	a:=6;
end;
{*************************** Maan piirto peliss„ ****************************}
procedure maapiirto(yk:integer);
begin
	for d:=1 to 2 do begin
		sx:=h[d].kx[yk];
		if h[d].kx[yk]>=kartankoko then sx:=h[d].kx[yk] mod 2 + kartankoko-2;
		if (yk=1) then
			if mapt[sx]=2 then
				setcolor(3)
			else if mapt[sx]=3 then
				setcolor(7)
			else setcolor(2);
		kulmakartta:=(map[sx]-map[sx+1])/ktark;
		karttaero:=h[d].kx[yk]*ktark-h[d].hx[yk]-158+ktark;
	 { if d=1 then begin
			_tayttovari(0);
		bar(90,90,160,110);
		_kirjoitadesluku(100,100,4,4,karttaero);        end;    }

		c:=trunc(kulmakartta*karttaero+map[sx+1]);
		line(165*(d-1)+158*(d-2)+trunc((h[d].kx[yk]+1)*ktark-h[d].hx[yk]),map[sx+1],323*(d-1)+1,c);
		a:=h[d].kx[yk]+1;
		repeat
			sx:=a;
			if a>=kartankoko then sx:=a mod 2 + kartankoko-2;
      if (yk=1) then
				if mapt[sx]=2 then
					setcolor(3)
				else if mapt[sx]=3 then
					setcolor(7)
				else setcolor(2);
			line(trunc(a*ktark-h[d].hx[yk]+165*(d-1)+158*(d-2)),map[sx],trunc((a+1)*ktark-h[d].hx[yk])+165*(d-1)+158*(d-2),map[sx+1]);
			a:=a+1;
		until trunc((a+1)*ktark-h[d].hx[yk])>=474;

		sx:=a;
		if a>=kartankoko then sx:=a mod 2 + kartankoko-2;
    if (yk=1) then
			if mapt[sx]=2 then
				setcolor(3)
			else if mapt[sx]=3 then
				setcolor(7)
			else setcolor(2);
		kulmakartta:=-(map[sx]-map[sx+1])/(ktark);
		karttaero:=474-(a*ktark-h[d].hx[yk]);
	 
		c:=trunc(kulmakartta*(karttaero)+map[sx]);
		line(trunc(a*ktark-h[d].hx[yk]+165*(d-1)+158*(d-2)),map[sx],323*(d-1)+315,c);
    

		for a:=1 to tykkeja do begin
			if (yk=1) then setcolor(13+ty[a].puoli);
			c:=trunc(ty[a].hx-h[d].hx[yk]);
			if (c>koko20-158) and (c<316-koko20-158) then begin
				line(trunc(c-koko20)+158+323*(d-1),ty[a].y-1,trunc(c-koko20)+158+323*(d-1),ty[a].kory[1]);
				line(trunc(c+koko20)+158+323*(d-1),ty[a].y-1,trunc(c+koko20)+158+323*(d-1),ty[a].kory[2]);
        line(trunc(c-koko20)+158+323*(d-1),ty[a].y-1,trunc(c+koko20)+158+323*(d-1),ty[a].y-1);
        if ty[a].energy>0 then
					arc(trunc(c)+158+323*(d-1),ty[a].y-2,0,180,trunc(koko20))
				else if ty[a].energy<0 then begin

					sound(200-ty[a].energy*20);
					if (yk=1) then setcolor(12);
					if yk=1 then
						arc(trunc(c)+158+323*(d-1),ty[a].y-2,0,180,trunc(-ty[a].energy/helikopterisuhde))
					else
				    arc(trunc(c)+158+323*(d-1),ty[a].y-2,0,180,trunc((1-ty[a].energy)/helikopterisuhde));
					if yk=1 then ty[a].energy:=ty[a].energy+1;
					if ty[a].energy=0 then begin
						setcolor(0);
						arc(trunc(c)+158+323*(d-1),ty[a].y-2,0,180,trunc(1/helikopterisuhde));
						nosound;
					end;
					{delay(1000);}

				end;
			end;
		end;
end;


end;
{*************************** Helikopterin piirto peliss„ ********************}
procedure piirto(ply,cd,vari:integer;arx:real);
begin
	setcolor(vari);
	line(trunc(h[cd].x[ply,16]+arx),trunc(h[cd].y[ply,16]),trunc(h[cd].x[ply,14]+arx),trunc(h[cd].y[ply,14]));
	line(trunc(h[cd].x[ply,18]+arx),trunc(h[cd].y[ply,18]),trunc(h[cd].x[ply,8]+arx),trunc(h[cd].y[ply,8]));
	line(trunc(h[cd].x[ply,18]+arx),trunc(h[cd].y[ply,18]),trunc(h[cd].x[ply,19]+arx),trunc(h[cd].y[ply,19]));
	line(trunc(h[cd].x[ply,10]+arx),trunc(h[cd].y[ply,10]),trunc(h[cd].x[ply,19]+arx),trunc(h[cd].y[ply,19]));
	line(trunc(h[cd].x[ply,10]+arx),trunc(h[cd].y[ply,10]),trunc(h[cd].x[ply,17]+arx),trunc(h[cd].y[ply,17]));
	line(trunc(h[cd].x[ply,18]+arx),trunc(h[cd].y[ply,18]),trunc(h[cd].x[ply,13]+arx),trunc(h[cd].y[ply,13]));
	line(trunc(h[cd].x[ply,15]+arx),trunc(h[cd].y[ply,15]),trunc(h[cd].x[ply,7]+arx),trunc(h[cd].y[ply,7]));
	line(trunc(h[cd].x[ply,16]+arx),trunc(h[cd].y[ply,16]),trunc(h[cd].x[ply,11]+arx),trunc(h[cd].y[ply,11]));
	line(trunc(h[cd].x[ply,6]+arx),trunc(h[cd].y[ply,6]),trunc(h[cd].x[ply,11]+arx),trunc(h[cd].y[ply,11]));
	line(trunc(h[cd].x[ply,6]+arx),trunc(h[cd].y[ply,6]),trunc(h[cd].x[ply,5]+arx),trunc(h[cd].y[ply,5]));
	line(trunc(h[cd].x[ply,5]+arx),trunc(h[cd].y[ply,5]),trunc(h[cd].x[ply,13]+arx),trunc(h[cd].y[ply,13]));
	line(trunc(h[cd].x[ply,2]+arx),trunc(h[cd].y[ply,2]),trunc(h[cd].x[ply,1]+arx),trunc(h[cd].y[ply,1]));
	line(trunc(h[cd].x[ply,16]+arx),trunc(h[cd].y[ply,16]),trunc(h[cd].x[ply,9]+arx),trunc(h[cd].y[ply,9]));
	line(trunc(h[cd].x[ply,3]+arx),trunc(h[cd].y[ply,3]),trunc(h[cd].x[ply,4]+arx),trunc(h[cd].y[ply,4]));
	e:=trunc(h[cd].x[ply,12]+arx);
	arc(e,trunc(h[cd].y[ply,12]),trunc(-h[cd].k[ply]*h[cd].suunta+540),trunc(-h[cd].k[ply]*h[cd].suunta+720),trunc(koko10));
end;
{*************************** Helikopterin piirto poisto *********************}
procedure kummaus;
begin
  setcolor(0);
	c:=d mod 2 +1;
	if h[d].rx[2]<>0 then
		piirto(2,c,0,h[d].rx[2]+(c-1)*323);

	piirto(2,d,0,(d-1)*323);
end;
{*************************** R„j„hdys ***************************************}
procedure rajahdys;
begin
 	kummaus;
	{RŽJŽHDYS}

	h[d].x[1,0]:=h[d].x[1,a];
	h[d].y[1,0]:=h[d].y[1,a];

	h[d].x[1,1]:=h[d].x[1,0]-50+random(10);
	sx:=trunc((h[d].hx[1]+h[d].x[1,1])/ktark);
	kulmakartta:=(map[sx+1]-map[sx])/ktark;
	karttaero:=(h[d].hx[1]+h[d].x[1,1])-sx*ktark;
	h[d].y[1,1]:=map[sx]+trunc(karttaero*kulmakartta);

	h[d].x[1,8]:=h[d].x[1,0]-random(10)+50;
	sx:=trunc((h[d].hx[1]+h[d].x[1,8])/ktark);
	kulmakartta:=(map[sx+1]-map[sx])/ktark;
	karttaero:=(h[d].hx[1]+h[d].x[1,8])-sx*ktark;
	h[d].y[1,8]:=map[sx]+trunc(karttaero*kulmakartta);
  for b:=1 to 30 do begin

		h[d].x[1,2]:=h[d].x[1,0]-80+random(10);
		h[d].y[1,2]:=h[d].y[1,0]-50+random(10);

		h[d].x[1,3]:=h[d].x[1,0]-30+random(10);
		h[d].y[1,3]:=h[d].y[1,0]-30+random(10);

		h[d].x[1,4]:=h[d].x[1,0]-80+random(10);
		h[d].y[1,4]:=h[d].y[1,0]-80+random(10);

		h[d].x[1,5]:=h[d].x[1,0]-20+random(10);
		h[d].y[1,5]:=h[d].y[1,0]-40+random(10);

		h[d].x[1,6]:=h[d].x[1,0]-25+random(10);
		h[d].y[1,6]:=h[d].y[1,0]-90+random(10);

		h[d].x[1,7]:=h[d].x[1,0] -5+random(10);
		h[d].y[1,7]:=h[d].y[1,0]-50+random(10);

		h[d].x[1,8]:=h[d].x[1,0]+25-random(10);
		h[d].y[1,8]:=h[d].y[1,0]-90+random(10);

		h[d].x[1,9]:=h[d].x[1,0]+20-random(10);
		h[d].y[1,9]:=h[d].y[1,0]-40+random(10);

		h[d].x[1,10]:=h[d].x[1,0]+80-random(10);
		h[d].y[1,10]:=h[d].y[1,0]-80+random(10);

		h[d].x[1,11]:=h[d].x[1,0]+30-random(10);
		h[d].y[1,11]:=h[d].y[1,0]-30+random(10);

		h[d].x[1,12]:=h[d].x[1,0]+80-random(10);
		h[d].y[1,12]:=h[d].y[1,0]-50+random(10);

			
  	setcolor(15);
  	for a:=1 to 12 do
			line(trunc(h[d].x[1,a]),trunc(h[d].y[1,a]),trunc(h[d].x[1,a+1]),trunc(h[d].y[1,a+1]));
		{_maalaa(trunc(h[d].x[1,0]),trunc(h[d].y[1,0])-10,4,15); }
		delay(500);
		sound(random(100));
		setcolor(0);
		{_maalaa(trunc(h[d].x[1,0]),trunc(h[d].y[1,0])-10,0,15);}
		for a:=1 to 12 do
		line(trunc(h[d].x[1,a]),trunc(h[d].y[1,a]),trunc(h[d].x[1,a+1]),trunc(h[d].y[1,a+1]));
	end;
	nosound;
	
end;
procedure pikkukartanpiirto;
begin
	_tayttovari(0);
		bar(0,400,639,479);

		setcolor(2);
		for a:=2 to kartankoko do begin
		if mapt[a-1]=4 then
			setcolor(3)
		else if mapt[a-1]<=2 then
			setcolor(7)
		else setcolor(2);
		line(trunc(a*bb-bb),408+trunc(map[a]*aa),trunc((a-1)*bb-bb),408+trunc(map[a-1]*aa));
	end;
end;
procedure alkukuva;
begin
   
	na[1]:='Kaasua lis„„ ......... ';
	na[2]:='Kaasua pois .......... ';
	na[3]:='Vasen ................ ';
	na[4]:='Ymp„ri k„„ntyminen ... ';
	na[5]:='Oikea ................ ';
	na[6]:='Ampuminen ............ ';
	na[7]:='Aseen vaihto ......... ';

	vaih[0]:='0) Aloita peli';
	vaih[1]:='1) 1-pelaajan n„pp„imet';
	vaih[2]:='2) 2-pelaajan n„pp„imet';
	vaih[3]:='3) Uusi kartta';
  
  kartansuunnittelu;

	settextjustify(centertext,centertext);
	settextstyle(1,0,8);
	setcolor(12);
	outtextXY(322,50,'Helikopteripeli');
	setcolor(14);
	outtextXY(318,54,'Helikopteripeli');
	
  settextjustify(lefttext,lefttext);
	settextstyle(0,0,0);
	setcolor(8);
	for a:=0 to 3 do
		outtextXY(50,200+a*20,vaih[a]);
	

	setcolor(4);
	for a:=0 to 3 do
		outtextXY(49,201+a*20,vaih[a]);

	merkki:='h';
	repeat
		
		merkki:=readkey;
		if (merkki='1') or (merkki='2') then begin
			val(merkki,a,b);
			b:=a mod 2 +1;
			for q:=1 to 7 do begin
				setcolor(8);
				settextjustify(righttext,lefttext);
				outtextXY(590,180+20*q,na[q]);
				setcolor(12);
				outtextXY(589,181+20*q,na[q]);
				repeat
					h[a].nap[q]:=readkey;
					for c:=1 to 7 do
						if h[b].nap[c]=h[a].nap[q] then h[a].nap[q]:=_esc;
					if q>1 then
						for c:=1 to q-1 do
							if h[a].nap[c]=h[a].nap[q] then h[a].nap[q]:=_ESC;
				until h[a].nap[q]<>_esc;
				setcolor(8);
				outtextXY(590,180+20*q,+h[a].nap[q]);
				setcolor(12);
				outtextXY(589,181+20*q,+h[a].nap[q]);
			end;
			_tayttovari(0);
			delay(200);
			bar(590,192,397,324);
		end;
		if (merkki='3') then begin
			kartansuunnittelu;
			pikkukartanpiirto;
		end;
		{if (merkki='0') then begin
			assign(f,'C:\helikopt.nap');
			rewrite(f);
			for c:=1 to 7 do
				write(f,nap[1,c]);
			for c:=1 to 7 do
				write(f,nap[2,c]);
			close(f);
			assign(f1,'C:\helikopt.map');
			rewrite(f1);
			for c:=1 to kartankoko do
				write(f1,map[c]);
			close(f1);
			assign(f2,'C:\helikopt.ma2');
			rewrite(f2);
			for c:=1 to kartankoko do
				write(f2,mapt[c]);
			close(f2);



			
			halt(1);
		end;   }
	until merkki='0';

end;
begin
	randomize;
	grafiikkatilaan;
	alkukuva;

	h[1].nap[1]:='a'; h[2].nap[1]:='8';
	h[1].nap[2]:='z'; h[2].nap[2]:='2';
	h[1].nap[3]:='x'; h[2].nap[3]:='4';
	h[1].nap[4]:='c'; h[2].nap[4]:='5';
	h[1].nap[5]:='v'; h[2].nap[5]:='6';
	h[1].nap[6]:=_space; h[2].nap[6]:=_ret;
	t:=0;t2:=0;
	merkki:='i';

	kartansuunnittelu;
	poyta;
	for d:=1 to 2 do
		alkutiedot;
	{delay(5000);}

  {*************************** Pelin kierto *********************************}
	repeat
		{putpixel(x,y,0);luehiiri(x,y,status);putpixel(x,y,15);}
    t:=t mod 200 + 1;                     {Kuin monta kuvaa piirt„m„tt„}
    {************************* N„pp„imet ************************************}
    if keypressed then begin
			merkki:=readkey;
			for d:=1 to 2 do begin
		if h[d].loser<11 then begin
				{********************* Kaasu + **************************************}
				if merkki=h[d].nap[1] then begin
					if (trunc(h[d].vk)>-maxkaasu) then begin
						h[d].vk:=h[d].vk-2;
            if h[d].vtuki<>0 then h[d].vtuki:=0;
						_tayttovari(2);
						if h[d].vk>-11 then _tayttovari(14);
						if h[d].vk>-6 then _tayttovari(4);
						bar(40-trunc(h[d].vk*5)+319*(d-1),451,48-trunc(h[d].vk*5)+319*(d-1),462);
					end;
				end;
				{********************* Kaasu - **************************************}
				if merkki=h[d].nap[2] then begin
					if (trunc(h[d].vk)<0) then begin
						h[d].vk:=h[d].vk+2;
						_tayttovari(0);
						bar(50-trunc(h[d].vk*5)+319*(d-1),451,58-trunc(h[d].vk*5)+319*(d-1),462);
					end;
				end;
				{********************* K„„ntyminen - ********************************}
				if (merkki=h[d].nap[3]) and (h[d].vtuki=0) then begin
					h[d].k[1]:=h[d].k[1]-aste*h[d].suunta;
					if h[d].k[1]<0 then h[d].k[1]:=h[d].k[1]+360;
					if h[d].k[1]>360 then h[d].k[1]:=h[d].k[1]-360;
				end;

				{******************** Ymp„ri k„„ntyminen ***************************}
				if (merkki=h[d].nap[4]) and (h[d].vtuki=0) then begin
					if h[d].ka=0 then begin
					 	setcolor(0);
						if h[d].rx[2]<>0 then
							piirto(2,d,0,-h[d].rx[2]+(d-1)*323);
						piirto(2,d,0,(d-1)*323);
						if h[d].suunta=1 then h[d].suunta:=-1 else h[d].suunta:=1;
					end
					else h[d].ka:=0;
				end;
				{********************* K„„ntyminen + ********************************}
				if (merkki=h[d].nap[5]) and (h[d].vtuki=0) then begin
					h[d].k[1]:=h[d].k[1]+aste*h[d].suunta;
					if h[d].k[1]<0 then h[d].k[1]:=h[d].k[1]+360;
					if h[d].k[1]>360 then h[d].k[1]:=h[d].k[1]-360;
				end;
				{********************* Ampuminen ************************************}
				if (merkki=h[d].nap[6])  then begin
					if h[d].ampua=0 then
						h[d].ampua:=h[d].ampua+panosper
					else h[d].ampua:=0;
				end;
		end;
      end;
		end;
    {************************* Luodin l„ht”arvot ****************************}
		if t mod 20=0 then
			for d:=1 to 2 do 
				if h[d].ampua<>0 then begin
					h[d].luoti:=h[d].luoti mod panoksia + 1;
					if (h[d].py[1,h[d].luoti])=500 then begin
						h[d].ampua:=h[d].ampua-1;
						h[d].px[1,h[d].luoti]:=h[d].hx[1]+h[d].x[1,2];
						h[d].px[2,h[d].luoti]:=h[d].px[1,h[d].luoti]-h[d].hx[1];
						h[d].py[1,h[d].luoti]:=h[d].y[1,2];
						h[d].py[2,h[d].luoti]:=h[d].py[1,h[d].luoti];
						h[d].ptx3[h[d].luoti]:=trunc(h[d].px[1,h[d].luoti]-h[d mod 2 + 1].hx[1]);

						c:=90;
						h[d].pvx[h[d].luoti]:=h[d].suunta*kosi(h[d].k[1]+c)*panosnopeus/(1+random(10)/40);
						h[d].pvy[h[d].luoti]:=sini(h[d].k[1]+c)*panosnopeus/(1+random(10)/40);
				
						h[d].panosmatka[h[d].luoti]:=panoskantama;
					end;
				end;

		{************************* t ****************************************}

		if (t mod 100=0) then begin
			t2:=t2 mod tykkeja +1;
			
			if (ty[t2].matka=0) and (ty[t2].energy>0) then begin
				ty[t2].aste:=sqrt(sqr(ty[1].y-1-h[ty[t2].kohde].y[1,0])+sqr(ty[t2].hx-h[ty[t2].kohde].hx[1]));
					if (ty[t2].aste<250) then begin
					ty[t2].aste:=(ty[t2].y-1-h[ty[t2].kohde].y[1,0])/(ty[t2].hx-h[ty[t2].kohde].hx[1]);

					ty[t2].pvx:=-(ty[t2].hx-h[ty[t2].kohde].hx[1])/100;
					ty[t2].pvy:=ty[t2].pvx*ty[t2].aste;

					ty[t2].aste:=tyluotiv/(sqrt(sqr(ty[t2].pvx)+sqr(ty[t2].pvy)));

					ty[t2].pvx:=ty[t2].pvx*ty[t2].aste;
					ty[t2].pvy:=ty[t2].pvy*ty[t2].aste;

					ty[t2].px[1]:=ty[t2].hx+(koko20/tyluotiv)*ty[t2].pvx;
					ty[t2].px[2]:=ty[t2].px[1];
					ty[t2].py[1]:=ty[t2].y-1+(koko20/tyluotiv)*ty[t2].pvy;
					ty[t2].py[2]:=ty[t2].py[1];
					ty[t2].matka:=150;
				end;
			end;
		end;

for e:=1 to tykkeja do
	if ty[e].matka<>0 then begin
		ty[e].px[1]:=ty[e].px[1]+ty[e].pvx;
		ty[e].py[1]:=ty[e].py[1]+ty[e].pvy;
		ty[e].matka:=ty[e].matka-1;

    for d:=1 to 2 do begin
			if (sqrt(sqr(ty[e].px[1]-h[d].hx[1])+sqr(ty[e].py[1]-h[d].y[1,0]))<koko15) then begin
				sound(300);
				delay(1);
				nosound;
				delay(1);  
						
				_tayttovari(8);
				bar(215+h[d].energy*5+319*(d-1),451,218+h[d].energy*5+319*(d-1),462);
				h[d].energy:=h[d].energy-1;
				if h[d].energy=0 then begin
					bar(215+h[d].energy*5+319*(d-1),451,218+h[d].energy*5+319*(d-1),462);
					{setcolor(6);
					circle(trunc(xx[1,d,0]),trunc(h[d].y[1,0]),70);
					_maalaa(trunc(xx[1,d,0]),trunc(h[d].y[1,0]),14,6);}
					h[d].loser:=11;
					h[d].vk:=0;
				end;
				if h[d].energy<=10 then begin
					h[d].loser:=11-h[d].energy
        end;
				if h[d].vtuki<>0 then h[d].vtuki:=0;
				h[d].vx:=h[d].vx+ty[e].pvx/panoskimpo;
				h[d].vy:=h[d].vy+ty[e].pvy/panoskimpo;
				ty[e].matka:=0;
			end;
		end;
	
	 	for d:=1 to 2 do begin
		if (abs(ty[e].ptx3[d])<=157)  then
			putpixel(trunc(ty[e].ptx3[d]+158+323*(d-1)),trunc(ty[e].py[2]),0);
		if (abs(ty[e].px[1]-h[d].hx[1])<=157) and (ty[e].matka>0)  then
			putpixel(trunc(ty[e].px[1]-h[d].hx[1]+158+323*(d-1)),trunc(ty[e].py[1]),13+ty[e].puoli);
		end;
    
    for d:=1 to 2 do begin
			ty[e].px[2]:=ty[e].px[1]-h[d].hx[1];
			ty[e].ptx3[d]:=ty[e].px[2];
		end;
		ty[e].py[2]:=ty[e].py[1];

end;



		{************************* Hidastaja jos ei panoksia ********************}
		for d:=1 to 2 do
			if h[d].ampua=0 then delay(5);
		{************************* Panoksia liikkuu *****************************}
		for a:=1 to panoksia do
			for d:=1 to 2 do
				if h[d].py[1,a]<500 then begin
					h[d].px[1,a]:=h[d].px[1,a]+h[d].pvx[a];
					h[d].py[1,a]:=h[d].py[1,a]+h[d].pvy[a];
					h[d].panosmatka[a]:=h[d].panosmatka[a]-1;
          
          {panos katoo}
					if h[d].panosmatka[a]=0 then
						h[d].py[1,a]:=500;
			 
					
					sx:=trunc((h[d].px[1,a]+158)/ktark);   
					karttaero:=h[d].px[1,a]+158-sx*ktark;

					if sx<1 then sx:=1;
					if sx>=kartankoko then sx:=sx mod 2 + kartankoko-2;
					kulmakartta:=-(map[sx]-map[sx+1])/ktark;
					maah[0]:=map[sx]+trunc(karttaero*kulmakartta);

					if (maah[0]<h[d].py[1,a]) then
						h[d].py[1,a]:=500;

       
					if (trunc(h[d].px[1,a]-h[d].hx[1])<=315) and (trunc(h[d].px[1,a]-h[d].hx[1])>=1)then
						putpixel(trunc(h[d].px[1,a]-h[d].hx[1])+323*(d-1),trunc(h[d].py[1,a]),13+d);
					if (trunc(h[d].px[2,a])<=315) and (trunc(h[d].px[2,a])>=1) then
						putpixel(trunc(h[d].px[2,a])+323*(d-1),trunc(h[d].py[2,a]),0);
				 	 

          {toisen kuvaruutu panokset}
		 			c:=d mod 2 +1;
					if (sqrt(sqr(h[d].px[1,a]-h[c].hx[1]-158)+sqr(h[d].py[1,a]-h[c].y[1,0]))<koko15) then begin
						sound(300);
						delay(1);
						nosound;
						delay(1);  
						h[d].panosmatka[a]:=1;
						_tayttovari(8);
						bar(215+h[c].energy*5+319*(c-1),451,218+h[c].energy*5+319*(c-1),462);
						h[c].energy:=h[c].energy-1;
						if h[c].energy=0 then begin
							bar(215+h[c].energy*5+319*(c-1),451,218+h[c].energy*5+319*(c-1),462);
							{setcolor(6);
							circle(trunc(xx[1,c,0]),trunc(h[c].y[1,0]),70);
							_maalaa(trunc(xx[1,c,0]),trunc(h[c].y[1,0]),14,6);}
							h[c].loser:=11;
							h[c].vk:=0;
						end;
						if h[c].energy<=10 then begin
							h[c].loser:=11-h[c].energy
							
						end;
						if h[c].vtuki<>0 then h[c].vtuki:=0;
						h[c].vx:=h[c].vx+h[d].pvx[a]/panoskimpo;
						h[c].vy:=h[c].vy+h[d].pvy[a]/panoskimpo;
					end;
					for e:=1 to tykkeja do
						if ty[e].energy>0 then 
			    		if (sqrt(sqr(h[d].px[1,a]-ty[e].hx-158)+sqr(h[d].py[1,a]-ty[e].y))<koko20) then begin
								sound(400);
								delay(1);
								nosound;
								delay(1);
								h[d].panosmatka[a]:=1;
								ty[e].energy:=ty[e].energy-1;
              	if ty[e].energy=0 then begin
							  	ty[e].energy:=-20;
								end;
            	end;
					if (trunc(h[d].px[1,a]-h[c].hx[1])<=315) and (trunc(h[d].px[1,a]-h[c].hx[1])>=1) then
						putpixel(trunc(h[d].px[1,a]-h[c].hx[1]+323*(2-d)),trunc(h[d].py[1,a]),13+d);
					if (trunc(h[d].ptx3[a])<=315) and (trunc(h[d].ptx3[a])>=1) then
						putpixel(h[d].ptx3[a]+323*(2-d),trunc(h[d].py[2,a]),0);

					h[d].ptx3[a]:=trunc(h[d].px[1,a]-h[c].hx[1]);
							
					h[d].px[2,a]:=h[d].px[1,a]-h[d].hx[1]; h[d].py[2,a]:=h[d].py[1,a];
				end;                                              
		{if t mod 20=1 then begin
			_tayttovari(0);
			bar(1,1,100,30);
			setcolor(15);
			d:=1;
			_kirjoitadesluku(2,2,4,4,ty[1].kory[1]);
			_kirjoitadesluku(2,12,4,4,-random(3)+1);
               
		end;}

		{************************* K„„nt„j„ *************************************}
		if (t mod 20 = 15) then
			for d:=1 to 2 do
				if (h[d].loser>=11) then begin
					a:=-random(3)+1;
					h[d].k[1]:=h[d].k[1]+h[d].suunta*aste*a;
					if h[d].k[1]<0 then h[d].k[1]:=h[d].k[1]+360;
					if h[d].k[1]>360 then h[d].k[1]:=h[d].k[1]-360;
					
        end;
		{************************* Vauhdit & Paikkakordinaatit ******************}
		for d:=1 to 2 do begin
			h[d].v:=h[d].vk/sca;
			h[d].vy:=h[d].vy+sini(h[d].k[1])*h[d].v+g/sca-h[d].vtuki;
			h[d].vx:=h[d].vx+kosi(h[d].k[1])*h[d].v*h[d].suunta;
			{ILMANVASTUS}
			h[d].vy:=h[d].vy/ilmanvastus;
			h[d].vx:=h[d].vx/ilmanvastus;
			h[d].hx[1]:=h[d].hx[1]+h[d].vx;
			h[d].kx[1]:=trunc((h[d].hx[1]+h[d].x[1,0]+1)/ktark);
		end;
		{************************************************************************}
    for d:=1 to 2 do
			helkkarinkoordinaatit2;
		{************************* Kattoon lento ********************************}
		if (t=3) then
			for d:=1 to 2 do
				if (h[d].y[1,0]<koko10) and (h[d].vk<>0) then begin
          _tayttovari(0);
					bar(50+319*(d-1),451,48-trunc(h[d].vk*5)+319*(d-1),462);
					h[d].vk:=0;
				end;
		{************************* Maahan t”rm„„minen ***************************}
		for d:=1 to 2 do begin
    	for a:=1 to 6 do begin
				karttaero:=h[d].kx[1]*ktark-h[d].hx[1]-158;
				c:=0;
				repeat
					c:=c+1;
					karttaero:=karttaero+ktark;
				until karttaero+ktark>=h[d].x[1,a];

				sx:=h[d].kx[1]+c;
      
				if sx<1 then sx:=1;
				if sx>=kartankoko then sx:=sx mod 2 + kartankoko-2;
				kulmakartta:=-(map[sx]-map[sx+1])/ktark;
				karttaero:=-((h[d].kx[1]+c)*ktark-h[d].hx[1]-158-h[d].x[1,a]);
				maah[a]:=map[sx]+round(karttaero*kulmakartta);
			 	
        {
        setcolor(0);
				if (d=2) and (a=6) then line(trunc(h[d].x[2,a]+323*(d-1)),447,trunc(h[d].x[2,a]+323*(d-1)),260);
				setcolor(15);
				if (d=2) and (a=6) then line(trunc(h[d].x[1,a]+323*(d-1)),447,trunc(h[d].x[1,a]+323*(d-1)),maah[0]);
			  }				 
			end;
			for a:=1 to 6 do
				if h[d].y[1,a]>maah[a] then begin
          {** laskeutuminen **}
				if (maah[1]<443) and (h[d].vy<0.2) and (abs(maah[1]-maah[2])<1) and (a<3) and (h[d].k[1]>80) and (h[d].k[1]<110) then begin
						h[d].y[1,0]:=maah[1]-koko15-1;
						h[d].k[1]:=90;
						h[d].ka:=0;
						h[d].vtuki:=(h[d].vk+g)/sca;
						if h[d].vtuki<0 then h[d].vtuki:=0;
						h[d].v:=h[d].vk/sca;
						h[d].vy:=0;
						h[d].vx:=0;
					 	helkkarinkoordinaatit2;
						helkkarinkoordinaatit;
					end
				 	else h[d].loser:=100;  
				end;
		end;
		{************************* Kummaus **************************************}
		if t mod 20=0 then begin
			for d:=1 to 2 do
				helkkarinkoordinaatit;
			for d:=1 to 2 do
				kummaus;
			setcolor(0);
			maapiirto(2); {maa}
		end;
    {************************* Piirto Maa & Helik. **************************}
		if t mod 20=0 then begin
			setcolor(15);
			for d:=1 to 2 do begin
      	c:=d mod 2 +1;
				if abs(h[d].hx[1]-h[c].hx[1])<157-koko40 then begin
					h[d].rx[1]:=h[c].hx[1]-h[d].hx[1]-323*(c-d);
					piirto(1,c,c+13,h[d].rx[1]+(c-1)*323);
				end
				else h[d].rx[1]:=0;
				h[d].rx[2]:=h[d].rx[1];
      
				piirto(1,d,d+13,(d-1)*323);

				h[d].pro:=h[d].pro+h[d].prok*trunc(-h[d].vk/2);
				if h[d].pro>25 then h[d].pro:=25;
				if h[d].pro<0 then h[d].pro:=0;
				if h[d].pro=25 then h[d].prok:=-1;
				if h[d].pro=0 then h[d].prok:=1;
	
		  end;
			{maa}
      setcolor(2);
      maapiirto(1);

      
      for a:=1 to 2 do begin
				for d:=1 to 2 do
					if (h[d].kx[2]<kartankoko-1) and (h[d].y[2,0]>0) then
						putpixel(160+319*(a-1)+trunc((h[d].hx[2]+316)*bb/ktark-bb),aaa+trunc(h[d].y[2,0]*aa+aa),0);
				for d:=1 to 2 do
					if (h[d].kx[1]<kartankoko-1) and (h[d].y[1,0]>0) then
						putpixel(160+319*(a-1)+trunc((h[d].hx[1]+316)*bb/ktark-bb),aaa+trunc(h[d].y[1,0]*aa+aa),13+d);
			end;	


			{savu}
		{	if h[d].loser>0 then
				for a:=1 to h[d].loser do
      }



      for d:=1 to 2 do begin
				for a:=0 to 19 do begin
					h[d].x[2,a]:=h[d].x[1,a];
					h[d].y[2,a]:=h[d].y[1,a];
				end;
				h[d].hx[2]:=h[d].hx[1];
				h[d].k[2]:=h[d].k[1];
				h[d].kx[2]:=h[d].kx[1];
			end;
			
		end;
		{************************* Kuoleminen ***********************************}
		for d:=1 to 2 do
			if h[d].loser=100 then begin
				
				{rajahdys;}
				{if h[d].loser=100 then d:=d mod 2 +1;}
        if h[d].rx[2]<>0 then
					piirto(2,d,0,-h[d].rx[2]+(d-1)*323);
				
				
				{setcolor(12);
				outtextXY(10,235,'Winner: PLAYER');
				 _kirjoitakokluku(380,235,1,d);
				delay(20000);}
				_tayttovari(0);
				bar(1+323*(d-1),0,315+323*(d-1),vesi);
			 	bar(50+319*(d-1),451,48-trunc(h[d].vk*5)+319*(d-1),462);
				alkutiedot;  {Energia loppu PS. kato yl”s}
			end;

	until merkki=_esc;
end.
		 

~~~


# Worm game

A worm game using Turbo Pascal was (naturally) also coded. Most of the snake games had possibility for multiplayer game and edit levels (walls etc.) in separate editor. A start menu was based on this plan: 
![worm game start menu planning](/assets/pics/page/screenshot/matopeliplan.jpg){: .mx-auto.d-block :}

It is actually interesting observation that it took long time for me to understand that in games and nowadays in developed dashboards it isn't good idea to make it possible to edit and change all the parameters.
Does it really matter how rectangles are separated (ruuduväli) and how many points players get by eating "fruits"? Ok, if 0 points are given, then last worm moving wins.

![worm game start menu planning1](/assets/pics/page/screenshot/matopeli_pascal.JPG){: .mx-auto.d-block :}
![worm game start game 1](/assets/pics/page/screenshot/matopeli_pascal_v2.JPG){: .mx-auto.d-block :}
![worm game start game 2](/assets/pics/page/screenshot/matopeli_pascal_v3.JPG){: .mx-auto.d-block :}
![worm game even game](/assets/pics/page/screenshot/matopeli_pascal_v4.JPG){: .mx-auto.d-block :}

Installation files available here: [MATO.zip](https://www.dropbox.com/s/xc9t4u2g3wcf70p/MATO.zip?dl=0). Download file, unzip it and run SIIRRA.BAT. It will create folder "mato" to c-disk and copy files there. 
Note that worm game level paths are hard coded and thus game works only if it is in location C:/mato/. &#128531; Play game using the DOSBox and start it by PELAA.bat as

~~~
Z:\> mount C C:\MATO
Z:\> C:
C:\> PELAA
~~~


# References
- Thumbnail picture [Antique Software: Turbo Pascal v5.5](https://edn.embarcadero.com/article/20803)
- [Turbo Pascal (With DOSBox)](https://sourceforge.net/projects/turbopascal-wdb/)
