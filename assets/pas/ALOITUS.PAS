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