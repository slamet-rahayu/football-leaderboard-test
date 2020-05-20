const models = require("../models")

const team_model = models.team

exports.index = (req, res)=>{
    team_model.findAll().then(team=>{
        res.send({
            message:"success",
            team: team
        })
    })
}

exports.store = (req,res)=>{
    team_model.create({name: req.body.clubname}).then(team_data=>{
        res.send({message:"success",team_data})
    }).catch(err=>res.send(err))
}