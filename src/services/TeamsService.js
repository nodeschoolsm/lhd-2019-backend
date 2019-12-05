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
    },
    getTeams: async () =>{
        let result = await db.query("SELECT a.idTeam as id, b.description as category, a.nameTeam, (SELECT COUNT(*) FROM team_hackers WHERE idTeam=a.idTeam) as members FROM teams a INNER JOIN categories b ON a.idCategory=b.idCategory WHERE a.status = 1");
        return result
    },
    getMembers: async (idTeam) =>{
        let result = await db.query("SELECT a.idTeam as id, b.description as category, a.nameTeam, (SELECT COUNT(*) FROM team_hackers WHERE idTeam=a.idTeam) as members, a.timeCreatedBy FROM teams a INNER JOIN categories b ON a.idCategory=b.idCategory WHERE a.status = 1 AND a.idTeam=?",[idTeam]);
        result = JSON.parse(JSON.stringify(result[0]))
        let data = {
            nameTeam: result.nameTeam,
            category: result.category,
            timeCreatedBy: result.timeCreatedBy,
            members:[]
        }
        result = await db.query('SELECT a.idHacker, CONCAT(TRIM(b.firstName)," ",TRIM(b.lastName)) as hacker_name,b.email FROM team_hackers a INNER JOIN hackers b ON a.idHacker=b.idHacker WHERE a.idTeam=?',[idTeam]);
        data.members.push(JSON.parse(JSON.stringify(result)))
        return data
    }
}