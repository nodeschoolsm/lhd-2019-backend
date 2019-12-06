const connection = require('../config/dbConnector')
const db = connection.makeDb()

module.exports = {
    createHacker: async (hacker) => {
        let result;
        try {
            result = await connection.withTransaction(db, async () => {
                id = await db.query("INSERT INTO hackers SET ?", [hacker]);
            })
        } catch (err) {
            return err
        }
        return result
    },
    getHackers : async ()=>{
        let result = await db.query("SELECT idHacker, firstName, lastName  FROM hackers");
        return result
    },
    getHackerByToken : async (token)=>{
        let result = await db.query("SELECT idHacker as id, CONCAT(firstName,' ',lastName) as name, email,checkin FROM hackers WHERE token = ?",[token]);
        return result
    },
    updateHacker : async (token)=>{
        let result = await db.query("UPDATE hackers SET checkin = 1 WHERE token = ?",[token]);
        return result
    }
}