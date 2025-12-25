#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# ($PSQL "TRUNCATE TABLE users;")

AUTH() {
  echo "Enter your username:"
  read input_username

  USER=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username='$input_username'")

  if [[ -z $USER ]]; then
    $PSQL "INSERT INTO users(username) VALUES('$input_username')" >/dev/null
    username=$input_username
    games_played=0
    best_game=
    echo "Welcome, $username! It looks like this is your first time here."
  else
    IFS='|' read -r username games_played best_game <<< $USER
    best_game=$best_game
    echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
  fi
}

VALIDATE() {
  if (( GUESS_NUMBER == secret_number )); then
    echo "winner"
  elif (( GUESS_NUMBER < secret_number )); then
    echo "higher"
  else
    echo "lower"
  fi
}

GET_GUESS_NUMBER() {
  read GUESS_NUMBER
  while [[ ! "$GUESS_NUMBER" =~ ^[0-9]+$ ]]; do
    echo "That is not an integer, guess again:"
    read GUESS_NUMBER
  done
}

MAIN_GAME() {
  number_of_guesses=0
  secret_number=$(( RANDOM % 1000 + 1 ))
  echo $secret_number
  echo "Guess the secret number between 1 and 1000:"

  while true; do
    GET_GUESS_NUMBER
    (( number_of_guesses++ ))
    RESULT=$(VALIDATE)

    if [[ $RESULT = "winner" ]]; then
      break
    elif [[ $RESULT = "higher" ]]; then
      echo "It's higher than that, guess again:"
    else
      echo "It's lower than that, guess again:"
    fi
  done

  if [[ -z $best_game ]] || (( number_of_guesses < best_game )); then
    best_game=$number_of_guesses
  fi

  $PSQL "UPDATE users SET games_played = games_played + 1, best_game = $best_game WHERE username='$username'" >/dev/null

  echo "You guessed it in $number_of_guesses tries. The secret number was $secret_number. Nice job!"
}

AUTH
MAIN_GAME


