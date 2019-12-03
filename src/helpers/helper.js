module.exports = {
    /**
     *  Add IdTeam to each hacker
     * @param {Array} arrayOfHackers 
     * @param {Number} idTeam 
     * @returns {Array} New array with arrays inside that contains idHacker and idTeam
     */
    addIdTeam: (arrayOfHackers, idTeam) => {
        return arrayOfHackers.map((hacker, i) => [arrayOfHackers[i], idTeam]);
    }
}