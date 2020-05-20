---


---

<p><strong>Available Endpoint:</strong></p>
<pre><code>//store for record game
url: http://localhost:5000/football/recordgame
method: post
body:{
"clubhomename":"barcelona", (example)
"clubawayname":"real madrid", (example)
"score":"4:3" (example)
}

//get rank by club name
url: http://localhost:5000/football/rank?clubname=barcelona
method: GET

//get pts for all clubs
url: http://localhost:5000/football/leaguestanding
method: GET

//get club data
http://localhost:5000/team
method: GET

//create club
http://localhost:5000/team
method: POST
body: {
"clubname":"chelsea" (example)
}
</code></pre>
<p><strong>To run in local machine</strong></p>
<blockquote>
<p>clone this project<br>
enter directory<br>
run &gt;npm install, using cmd within project directory (with node js installed on pc)<br>
run &gt;node index.js</p>
</blockquote>

