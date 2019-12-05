const service = require('../services/TeamsService');

module.exports = {
    createTeam: async (req, res) => {
        const {teamData,hackers,createdBy} = req.body;
        if (teamData && hackers) {
            teamData['userCreatedBy'] = createdBy;
            let result = await service.createTeam(teamData,hackers);
            if (result.errno) {
               return res.status(500).send({success:false,msg:result.errno});
            }else{
                return res.status(200).send({success:true,msg:"Team created successfully"});
            }

        } else {
            return res.status(400).send("Something goes wrong! :(");
        }
    },
    getCategories: async(req,res)=>{
        const data = await service.getCategories();
        res.status(200).send(data);
    },

    getTeams: async(req,res)=>{
        const data = await service.getTeams();
        res.status(200).send(data);
    }
}