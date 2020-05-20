'use strict';
module.exports = (sequelize, DataTypes) => {
  const matches = sequelize.define('matches', {
    date: DataTypes.DATE,
    team_id_home: DataTypes.INTEGER,
    team_id_away: DataTypes.INTEGER,
    score_home: DataTypes.INTEGER,
    score_away: DataTypes.INTEGER
  }, {});
  matches.associate = function(models) {
    // associations can be defined here
  };
  return matches;
};