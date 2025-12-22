#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Remove all table data
($PSQL "TRUNCATE TABLE games, teams")

# TEAMS=()

# IN_ARRAY() {
#   local needle="$1"
#   shift
#   local item

#   for item in "$@"; do
#     [[ "$item" == "$needle" ]] && return 0
#   done

#   return 1
# }

while IFS=',' read -r year round winner opponent winner_goals opponent_goals;
do
  [[ $winner = "winner" ]] && continue

  # get winner team id
  WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
  # if not found winner team id
  if [[ -z $WINNER_TEAM_ID ]]
  then
    # insert winner team
    WINNER_TEAM_INSERT=$($PSQL "INSERT INTO teams(name) VALUES('$winner')")
    # get winner team id
    WINNER_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$winner'")
  fi
  
  # get opponent team id
  OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
  # if not found opponent team id
  if [[ -z $OPPONENT_TEAM_ID ]]
  then
    # insert opponent team
    OPPONENT_TEAM_INSERT=$($PSQL "INSERT INTO teams(name) VALUES('$opponent')")
    # get opponent team id
    OPPONENT_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$opponent'")
  fi
  
  # insert games result
  GAME_INSERT_RESULT=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $WINNER_TEAM_ID, $OPPONENT_TEAM_ID, $winner_goals, $opponent_goals)")
  # echo "$year $round $winner $opponent $winner_goals $opponent_goals"
done < games.csv

# printf "%s\n" "${TEAMS[@]}"


