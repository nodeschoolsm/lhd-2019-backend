const service = require('../services/HackersServices')
const nodeMailer = require('nodemailer');
const {template} = require('../emailTemplae/template')

const transporter = nodeMailer.createTransport({
    host:process.env.HOST_EMAIL,
    auth:{
        user:process.env.USER_EMAIL,
        pass:process.env.PASS_EMAIL
    }
})



module.exports ={
    createHacker: async (req, res) => {
        const hacker = req.body;
        if (hacker) {
            let result = await service.createHacker(hacker);
            if (result.errno) {
               return res.status(500).send({success:false,msg:result.errno});
            }else{
                await transporter.sendMail({
                    from:`'NodeSchool San Miguel' <${process.env.USER_EMAIL}>`,
                    to:hacker.email,
                    subject:'Registro Local Hack Day!',
                    html:template(`${hacker.firstName} ${hacker.lastName}`,hacker.token)
                })
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