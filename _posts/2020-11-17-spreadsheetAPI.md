---
layout: post
title: spreadsheets into REST API 
tags:
  - REST API
  - data
comments: false
cover-img: /assets/pics/cover/photo/mato.JPG
thumbnail-img: /assets/pics/thumbnail/photo/bunkkeri.JPG
published: true
---
# Create free API

## Sheet Best
Turn your simple spreadsheets into REST API
- [Sheet Best](https://sheet.best/)
- Instructions for Sheet Best: [How to use API](https://docs.sheet.best/#quickstart)

## API Spreadsheets
Instantly Use Your Spreadsheets as an API and Database 
- [API Spreadsheets](https://www.apispreadsheets.com/)
- Create account: (taXXX.dm)
- Instructions: [https://www.apispreadsheets.com/]
### READ
- To READ rows from your file, make a GET request to your API URL
- There are 3 OPTIONAL url parameters you can include: dataFormat, query and limit. Play around with them and see how the API URL changes
- You will get your data as a JSON response and a status code of 200 if your request is successful
- You can get started right away with some of our pre-written code samples

I selected one sample spreadsheet, and I got url for that: 
https://api.apispreadsheets.com/data/3221/

It seems that securite level for free subscription is very low! Anyone can just read another APIs by changing the SERIAL number or scrape all data time to time.
So I decided to delete right away file that I uploaded. It contained just some energy consumption data of my garage (two lines).

However, 
this free service seems to be ok for simple games (storing records)

### CREATE
To CREATE rows from your file, make a POST request to your API URL
- You need to include a JSON encoded BODY with your new rows. Play around with the format to see how the rows should look.
- You will get a status code of 201 if your rows were successfully created

#### CURL
~~~
$ curl -X POST 'https://api.apispreadsheets.com/data/3630/' \
-H "Content-Type: application/json" \
-d '{"data": {"player":"jake","points":1000,"timestamp":"2012-04-23T18:25:43.511Z"}}'
~~~

#### HTML
~~~
<!DOCTYPE html>
<html>
<head>
	<title>Save Web Form Data to Spreadsheets</title>
	<script
		src="https://code.jquery.com/jquery-3.4.1.js"
		integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
		crossorigin="anonymous"></script>
	<script>
		function SubForm (){
			$.ajax({
				url:"https://api.apispreadsheets.com/data/3630/",
				type:"post",
				data:$("#myForm").serializeArray(),
				success: function(){
					alert("Form Data Submitted :)")
				},
				error: function(){
					alert("There was an error :(")
				}
			});
		}
	</script>
</head>
<body>
	<form id="myForm">
		<label>player</label>
		<input name="player" />
		<br/>
		<label>points</label>
		<input name="points" />
		<br/>
		<label>timestamp</label>
		<input name="timestamp" />
		<br/>
	</form>
	<button onclick='SubForm()'>Submit</button>
</body>
</html>
~~~

#### Python
~~~
# pip install requests

import requests

r = requests.post("https://api.apispreadsheets.com/data/3630/", headers={}, json={"data": {"player":"jake","points":1000,"timestamp":"2012-04-23T18:25:43.511Z"}})

if r.status_code == 201:
	# SUCCESS 
	pass
else:
	# ERROR
	pass
~~~

#### Javascirpt

~~~
fetch("https://api.apispreadsheets.com/data/3630/", {
	method: "POST",
	body: JSON.stringify({"data": {"player":"jake","points":1000,"timestamp":"2012-04-23T18:25:43.511Z"}}),
}).then(res =>{
	if (res.status === 201){
		// SUCCESS
	}
	else{
		// ERROR
	}
})
~~~

I created txt file separating name, points and date, see [date json-format](https://stackoverflow.com/questions/10286204/what-is-the-right-json-date-format). 
Here you can add new rows to [test-file](https://talonendm.github.io/pokenappis/p5/nappistaituri/test_add_points.html) API. Note, POST command accept any format (string as points etc.).

Here you can add new rows and check updated table e.g. CMD using curl command:
~~~
> curl "https://api.apispreadsheets.com/data/3630/"
{"data":[{"player":"jake","points":1000,"timestamp":"2012-04-23T18:25:43.511Z"},{"player":"pete","points":"1000","timestamp":"2018-12-10T13:49:51.141Z"}]}
~~~
