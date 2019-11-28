const service = require('../services/HackersServices')

module.exports ={
    getHackers : async (req,res)=>{
        const data = await service.getHackers();
        res.status(200).send(data);
    },
    getHackerByToken : async (req,res)=>{
        const {token} = req.params;
        const data = await service.getHackerByToken(token);
        if (data.length === 0){
            res.status(404).send('Hacker not found :(')
        }else{
            res.status(200).send(data[0])
        }
    }
}