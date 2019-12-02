const connection = require('../config/dbConnector')
const db = connection.makeDb()

module.exports = {
    getHackers : async ()=>{
        let result = await db.query("SELECT idHacker, firstName, lastName  FROM hackers");
        return result
    },
    getHackerByToken : async (token)=>{
        let result = await db.query("SELECT idHacker as id, CONCAT(firstName,' ',lastName) as name, email FROM hackers WHERE token = ?",[token]);
        return result
    },
    updateHacker : async (token)=>{
        let result = await db.query("UPDATE hackers SET checkin = 1 WHERE token = ?",[token]);
        return result
    }
}