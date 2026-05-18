#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

echo $($PSQL "TRUNCATE teams,games RESTART IDENTITY;")

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  # check if not header
  if [[ $YEAR != 'year' ]]
  then
    #try to read both teams id
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")

    #if not winner id insert into database
    if [[ -z $WINNER_TEAM_ID ]]
    then
      INSERT_WINNER_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
      if [[ $INSERT_WINNER_TEAM == "INSERT 0 1" ]]
      then
        WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")
      fi
    fi
    #if not opponent id insert into database
    if [[ -z $OPPONENT_TEAM_ID ]]
    then
      INSERT_OPPONENT_TEAM=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
      if [[ $INSERT_OPPONENT_TEAM == "INSERT 0 1" ]]
      then
        OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")
      fi
    fi
    #insert game info into database
    INSERT_GAME_INFO=$($PSQL "INSERT INTO games(year,round,winner_goals,opponent_goals,winner_id,opponent_id) VALUES($YEAR,'$ROUND',$WINNER_GOALS,$OPPONENT_GOALS,$WINNER_TEAM_ID,$OPPONENT_TEAM_ID);")
    if [[ $INSERT_GAME_INFO == 'INSERT 0 1' ]]
    then
      echo "Insert game"
    fi

  fi
done