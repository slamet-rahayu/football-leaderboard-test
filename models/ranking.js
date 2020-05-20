'use strict';
module.exports = (sequelize, DataTypes) => {
  const ranking = sequelize.define('ranking', {
    team_id: DataTypes.INTEGER,
    rank: DataTypes.INTEGER,
    pts: DataTypes.INTEGER,
    date: DataTypes.DATE
  }, {});
  ranking.associate = function(models) {
    // associations can be defined here
    ranking.belongsTo(models.team,{
      foreignKey: 'team_id', as: 'team'
    })
  };
  return ranking;
};