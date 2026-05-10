---
layout: post
title: Driving Around via Copenhagen
subtitle: Road trip
tags:
  - Travelling
  - Via Baltic
  - Scandinavia
comments: false
cover-img: /assets/pics/cover/e1024/e-queens-gambit.jpg
thumbnail-img: /assets/pics/thumbnail/e384-direct/e-pic-0004.jpg
published: true
---

# Munchen to Munchen

- [Travel map full](https://talonendm.github.io/compass/geojsonmap/Rgeojson/v4.html)

## Weather

- [Kaunas](https://www.accuweather.com/en/lt/kaunas/228309/weather-forecast/228309?type=locality&city=kaunas)
- [Gdansk](https://www.accuweather.com/en/pl/gda%C5%84sk/275174/weather-forecast/275174?type=locality&city=gda%C5%84sk)
- [szczecin](https://www.accuweather.com/en/pl/szczecin/276655/weather-forecast/276655?type=locality&city=szczecin)
- [Rostock](https://www.accuweather.com/en/de/rostock/18055/weather-forecast/169581?type=locality&city=rostock)
- [Copenhagen](https://www.accuweather.com/en/dk/copenhagen/123094/weather-forecast/123094?type=locality&city=copenhagen)
- [Öland](https://www.accuweather.com/en/se/aspby/308212/weather-forecast/308212?type=locality&city=%C3%96land)
- [Stockholm](https://www.accuweather.com/en/se/stockholm/314929/weather-forecast/314929?type=locality&city=stockholm)

# Road trip

## Kaunas

Kaunas is the second-largest city in Lithuania and one of the country’s most important cultural and historical centers. Located at the meeting point of the Nemunas and Neris rivers, the city is known for its blend of medieval architecture, interwar modernism, and lively student atmosphere. During the interwar period, Kaunas served as the temporary capital of Lithuania, which led to rapid cultural and architectural development that still shapes the city today. Its Old Town features cobblestone streets, historic churches, and landmarks such as Kaunas Castle and Town Hall Square.

Today, Kaunas is a vibrant and modern city with a strong focus on education, arts, and innovation. The city is home to several universities, museums, galleries, and annual cultural events that attract both locals and tourists. In recent years, Kaunas has gained international recognition for its modernist architecture and creative urban projects, helping it become an increasingly popular destination in the Baltic region. Visitors often enjoy its green parks, riverside walks, and growing café and restaurant scene, which together create a welcoming and dynamic atmosphere.

1. **Kaunas Castle**     A medieval castle located where the Nemunas and Neris rivers meet. It is one of the oldest landmarks in the city and offers scenic views and historical exhibitions.
2. **Laisvės Alėja**     The main pedestrian street of Kaunas, lined with cafés, restaurants, shops, and historic architecture. Perfect for walking and experiencing the city atmosphere.
3. **Ninth Fort**     A historical fort and museum that commemorates tragic events from World War II and Soviet occupation. Known for its striking memorial and educational exhibits.

## Top 3 Places to See in Gdańsk

1. **Old Town (Main Town Hall & Long Market)**  
   The historic heart of :contentReference[oaicite:0]{index=0}, featuring colorful merchant houses, fountains, and landmarks like the Main Town Hall along the Long Market (Długi Targ).

2. **St. Mary’s Church**  
   :contentReference[oaicite:1]{index=1} — One of the largest brick churches in the world, offering a vast interior and a tower with panoramic views of the city.

3. **Westerplatte**  
   :contentReference[oaicite:2]{index=2} — A historic peninsula where World War II began, now a memorial site with monuments and open-air exhibits.


## Top 3 Places to See in Szczecin

1. **Pomeranian Dukes’ Castle**  
   A Renaissance castle that once served as the residence of the dukes of Pomerania. Today it hosts exhibitions, concerts, and cultural events.

2. **Wały Chrobrego (Chrobry Embankment)**  
   A scenic riverside promenade with impressive architecture, museums, and panoramic views over the Oder River.

3. **St. James Cathedral**  
   One of the tallest churches in Poland, known for its Gothic architecture and observation tower offering views across the city.

## Top 3 Places to See in Rostock

1. **Historic Old Town (Neuer Markt)**  
   The central square of :contentReference[oaicite:0]{index=0}, surrounded by colorful gabled buildings, the Town Hall, and lively cafés. It’s the best place to start exploring the city’s Hanseatic heritage.

2. **St. Mary’s Church (Marienkirche)**  
   :contentReference[oaicite:1]{index=1} — A striking Gothic church known for its massive astronomical clock dating back to the 15th century and its impressive brick architecture.

3. **Warnemünde Beach & Lighthouse**  
   :contentReference[oaicite:2]{index=2} — A popular seaside district of Rostock featuring a wide sandy beach, a scenic promenade, and a historic lighthouse overlooking the Baltic Sea.
  
# Links

- [Google Maps](https://maps.app.goo.gl/vyF5ybzsPCqdv7VU7)
- stuff - take with you, [privata ta.dm](https://docs.google.com/spreadsheets/d/19BkGyPCeYUFju6qmrPmDd3s-zcD2MNX5jRguvoorb1c/edit?usp=sharing)
- general summer plans, [private ta.dm](https://docs.google.com/document/d/1PyTRdfl51dnbZYe0ZIq83jFfvQ_F2qFU4TMWlZXUqI4/edit?usp=sharing)
- [rooffighter](https://talonendm.github.io/rooffighter) game

# Travel map code

## Updated

### gsheets -package

The gsheet package is more lightweight but does not have a direct sheet = "name" argument. Instead, it can only fetch the first worksheet/tab from a Google Sheet. gsheet reads the worksheet/tab that corresponds to the gid in the URL. Each tab in a Google Sheet has a unique gid (you can see it in the URL when that tab is selected).

Stored to local: I:\Oma Drive\data\googlesheetRpaths

Code: Reteatteri/R

## Old 

```

# I:\Oma Drive\data\travelling / create_geojson_path_2025.R

library(httr)
library(jsonlite)
# install.packages('mapboxapi')
library(mapboxapi)
# install.packages("data.table")
library(data.table)

# Mapbox configuration
# token <- "p... created 2508"
token <- Sys.getenv("MAPBOX_PUBLIC_TOKEN")
# mapboxapi::mb_access_token(token, install = TRUE)

# .............................
create_route <- function(origin = NULL, destination = NULL, routetype = NULL, swap_coordinates = TRUE) {

  if (swap_coordinates) {
    origin <- c(origin[2], origin[1])
    destination <- c(destination[2], destination[1])
  }

  route <- mapboxapi::mb_directions(
    # access_token = token,
    origin = origin,
    destination = destination,
    exclude = 'ferry',
    profile = routetype,  # Options: "driving", "walking", "cycling"
    output = "sf"         # Return as sf object
  )

  return(route)
}
# .............................
routes <- list()

coord <- read.csv("I:/Oma Drive/data/travelling/2025munchen_travel_coordinates.txt")
routes <- list()
for (i in c(1:dim(coord)[1])) {
  print(paste0(i, ": ", coord$origin_lat[i], ", ", coord$origin_lon[i], " to ",
               coord$destination_lat[i], ", ", coord$destination_lon[i], " (", coord$routetype[i], ")"))

  routes[[i]] <- create_route(
    origin = c(coord$origin_lon[i],coord$origin_lat[i]),
    destination = c(coord$destination_lon[i],
                    coord$destination_lat[i]),
    routetype = coord$routetype[i],
    swap_coordinates = FALSE
  )
}

route_all <- data.table::rbindlist(routes)
sf::st_write(route_all, "D:/temp/routeXXXsaksa.geojson", driver = "GeoJSON", delete_dsn = TRUE)
# .............................

```

---

[Disclaimer](https://talonendm.github.io/disclaimer)

