const service = require('../services/HackersServices')

module.exports ={
    createHacker: async (req, res) => {
        const hacker = req.body;
        if (hacker) {
            let result = await service.createHacker(hacker);
            if (result.errno) {
               return res.status(500).send({success:false,msg:result.errno});
            }else{
                return res.status(200).send({success:true,msg:"Hacker created successfully"});
            }

        } else {
            return res.status(400).send("Something goes wrong! :(");
        }
    },
    getHackers : async (req,res)=>{
        const data = await service.getHackers();
        res.status(200).send(data);
    },
    getHackerByToken : async (req,res)=>{
        const {token} = req.params;
        const data = await service.getHackerByToken(token);
        if (data.length === 0){
            res.status(404).json({found:false})
        }else{
            if(data[0].checkin==1){
                res.status(406).json({found:true,checkin:true})
            }else{

                res.status(200).send(data[0])
            }
        }
    },
    updateHacker : async (req,res)=>{
        const {token} = req.params;
        const data = await service.updateHacker(token);
        if(data.affectedRows != 0){
            res.status(200).send('Succesfull update!')
        }else{
            res.status(500).send('Something goes wrong :(')
        }
    }
}