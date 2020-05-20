const express = require('express')
const app = express()
const port = process.env.PORT || 5000
const bodyParser = require('body-parser')

const cors = require('cors')

app.use(express.static('public'))
app.use(bodyParser.json())
app.use(bodyParser.urlencoded({extended: false}))
app.use(cors())

const team_controller = require('./controller/team_controller')
const rank_controller = require('./controller/ranking_controller')
const matches_controller = require('./controller/matches_controller')

app.get('/', (req, res) => {
    res.send(`youre on port ${port}`)
})

app.get('/team', team_controller.index)
app.post('/team', team_controller.store)
app.get('/football/leaguestanding', rank_controller.index)
app.get('/football/rank', rank_controller.rank)
app.post('/football/recordgame', matches_controller.post_matches)

app.listen(port, ()=> console.log(`Listening on port ${port}!`))