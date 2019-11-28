const connection = require('../config/dbConnector')
const db = connection.makeDb()

module.exports = {
    getHackers : async ()=>{
        let result = await db.query("SELECT id_hacker, first_name, last_name  FROM hackers");
        return result
    },
    getHackerByToken : async (token)=>{
        let result = await db.query("SELECT id_hacker, first_name, last_name FROM hackers WHERE token = ?",[token]);
        return result
    }
}