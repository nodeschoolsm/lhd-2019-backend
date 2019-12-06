const service = require('../services/UsersServices');
const bcrypt = require('bcrypt');
const saltRounds = 10;

module.exports ={
    createUser: async (req, res) => {
        const user = req.body;
        if (user) {
            const hashedPass = await bcrypt.hash(user.password,saltRounds);
            user.password = hashedPass;
            let result = await service.createUser(user);
            if (result.errno) {
                console.log(result)
                return res.status(500).send({success:false,msg:result.errno});
            }else{
                return res.status(200).send({success:true,msg:"User created successfully"});
            }

        } else {
            return res.status(400).send("Something goes wrong! :(");
        }
    },
    loginUser: async (req, res) => {
        const {username,password} = req.body;
        if (username && password) {
            let dbPassword = await service.getPassword(username);
            const result = await bcrypt.compare(password,dbPassword);
            if (result) {
                return res.status(400).send({success:true});
            }else{
                return res.status(200).send({success:false,msg:"Bad Credentials"});
            }

        } else {
            return res.status(400).send("Something goes wrong! :(");
        }
    }
}