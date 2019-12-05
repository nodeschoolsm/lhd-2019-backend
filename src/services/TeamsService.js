const connection = require('../config/dbConnector');
const db = connection.makeDb();
const {addIdTeam} = require('../helpers/helper');


module.exports = {
    createTeam: async (teamData,hackers) => {
        let result;
        try {
            result = await connection.withTransaction(db, async () => {
                id = await db.query("INSERT INTO teams SET ?", [teamData]);
                idTeam = id.insertId;
                const hackersWithTeams = addIdTeam(hackers,idTeam);
                await db.query("INSERT INTO team_hackers (idHacker,idTeam,idEvent) VALUES ?", [hackersWithTeams]);
                await db.query("INSERT INTO hackers (idHacker) VALUES ? ON DUPLICATE KEY UPDATE checkin = ?",[hackers.map((hacker,i)=>[hackers[i]]),1]);
            })
        } catch (err) {
            return err
        }
        return result
    },
    getCategories: async () =>{
        let result = await db.query("SELECT idCategory, description FROM categories WHERE status = 1");
        return result
    }
}