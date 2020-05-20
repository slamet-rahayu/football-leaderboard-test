const models = require("../models")

const matches = models.matches
//database model
const team_model = models.team
const rank_model = models.ranking

exports.post_matches = async(req, res)=>{ 
    //find clubname by name from body parameter  
    const clubhome = await team_model.findOne({where:{name:req.body.clubhomename}})
    const clubaway = await team_model.findOne({where:{name:req.body.clubawayname}})
    //splitting score
    const homescore = parseInt(req.body.score.split(":")[0])
    const awayscore = parseInt(req.body.score.split(":")[1])    
    //find rankinng by desc to determine club ranking
    const ranking = await rank_model.findAll({order:[["pts", "DESC"]]})
    //find club name in rank table
    let find_hometeam_in_rank = await rank_model.findOne({where:{team_id:clubhome.id}})
    let find_awayteam_in_rank = await rank_model.findOne({where:{team_id:clubaway.id}})    
       try {
           //create matches data
           const create_matches_data = await matches.create({
            date: new Date().toLocaleString(),
            team_id_home: clubhome.id,
            team_id_away: clubaway.id,
            score_home: homescore,
            score_away: awayscore
        })
            //create pts depend to game
           if (homescore > awayscore) {
               //if team already exist in ranking database then update pts or create if not exist
               if (find_hometeam_in_rank) {
                   await rank_model.update({pts: find_hometeam_in_rank.pts+3,date: new Date()},{where:{id:find_hometeam_in_rank.id}})
               } else {
                   await rank_model.create({team_id: create_matches_data.team_id_home,pts:3,date: new Date()})
               }
           } else if (homescore === awayscore) {
               if (find_hometeam_in_rank) {
                 await rank_model.update({pts: find_hometeam_in_rank.pts+1,date: new Date()},{where:{id:find_hometeam_in_rank.id}})
               } else {
                 await rank_model.create({team_id: create_matches_data.team_id_home,pts:1,date: new Date()})
               }
               if (find_awayteam_in_rank) {
                await rank_model.update({pts: find_awayteam_in_rank.pts+1,date: new Date()},{where:{id:find_awayteam_in_rank.id}})
               } else {
                await rank_model.create({team_id: create_matches_data.team_id_away,pts:1,date: new Date()})
               }
           } else {
                if (find_awayteam_in_rank) {
                await rank_model.update({pts: find_awayteam_in_rank.pts+3,date: new Date()},{where:{id:find_awayteam_in_rank.id}})
               } else {
                await rank_model.create({team_id: create_matches_data.team_id_away,pts:3,date: new Date()})
               }
           }
           //update team rank by pts achieved
           ranking.map(async (v,k)=>{await rank_model.update({rank: k+1},{where:{id: v.id}})})
           res.send({message:"success"})
       } catch (error) {
           res.send(error)
       }        
}