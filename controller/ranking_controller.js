const models = require('../models')

const rank_model = models.ranking
const team_model = models.team

exports.index = (req, res)=>{
    rank_model.findAll({
        include:[{model: team_model, as: 'team'}],
        order: [['pts', 'DESC']]
    }).then(data=>{
        const points = data.map(v=>{return {clubname: v.team.name, point: v.pts }})
        res.send({points})
    }).catch(err=>{res.send(err)})
}

exports.rank = (req, res)=>{
   rank_model.findOne({
       include:[{model: team_model, as: "team",where:{name: req.query.clubname}}]
   }).then(data=>{
       const standing = {
           clubname: data.team.name,
           standing: data.rank
       }
       res.send({standing})
   }).catch(err=>res.send(err))
}