const connection = require('../config/dbConnector')
const db = connection.makeDb()

module.exports = {
    createUser: async (user) => {
        let result;
        try {
            result = await connection.withTransaction(db, async () => {
                id = await db.query("INSERT INTO users SET ?", [user]);
            })
        } catch (err) {
            return err
        }
        return result
    },
    getPassword : async (username)=>{
        let result = await db.query("SELECT password as pass FROM users WHERE username = ?",[username]);
        return result[0].pass
    },
}