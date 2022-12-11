function setup() {
    // create the canvas for the map
    var canvas = createCanvas(800, 600);
    canvas.parent('map');
  

    // The latitude of Helsinki, Finland is 60.192059, and the longitude is 24.945831.

    // create the Leaflet map
    var map = L.map('map').setView([60.192059, 24.945831], 13);
    //L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
    //  attribution: 'Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors',
    //  maxZoom: 18
    //}).addTo(map);


    L.tileLayer('https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png', {
        attribution: 'Map data © <a href="https://openstreetmap.org">OpenStreetMap</a> contributors',
        maxZoom: 18
      }).addTo(map);


    
// https://{s}.tile.openstreetmap.fr/osmfr/{z}/{x}/{y}.png


    // map.setView([51.505, -0.09], 13);

  }
  
  function draw() {
    // update the map
    // ...
    // background(200);

    //fill(100,0,0);
    //ellipse(30,30,40,40);

    // p5: https://editor.p5js.org/haques/sketches/5kH03sdnC ... kopio - katso vinkkeja
     
  }