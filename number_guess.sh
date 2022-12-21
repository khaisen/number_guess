#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USER_NAME

SECREAT_NUMBER=$((1 + $RANDOM % 1000))

RUN_GAME() {
  read GUESS_NO
  if [[ ! $GUESS_NO =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    PLAY_GAME
  elif [[ $GUESS_NO > $SECREAT_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
    PLAY_GAME
  elif [[ $GUESS_NO < $SECREAT_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
    PLAY_GAME
  elif [[ $GUESS_NO == $SECREAT_NUMBER ]]
  then
    #echo "$NUMBER_OF_GUESSES is your number of guesses"
    UPDATE_NUMBER_OF_GUESSES=$($PSQL "UPDATE games SET number_of_guesses = $NUMBER_OF_GUESSES WHERE game_id=$CHECK_GAME_ID AND user_id=$USER_ID")
    FIND_BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id = $USER_ID")
    UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $FIND_BEST_GAME WHERE user_id = $USER_ID")
    echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECREAT_NUMBER. Nice job!
  fi
}

PLAY_GAME() {
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USER_NAME'")
  CHECK_GAME_ID=$($PSQL "SELECT game_id FROM games WHERE game_id = $GAME_ID AND user_id = $USER_ID")
  if [[ -z $CHECK_GAME_ID ]]
  then
    NUMBER_OF_GUESSES=1
    ADD_GAME=$($PSQL "INSERT INTO games(game_id,user_id,number_of_guesses) VALUES($GAME_ID,$USER_ID,0)")
    #echo $SECREAT_NUMBER; #to be removed
    echo "Guess the secret number between 1 and 1000:"
    RUN_GAME
  else
    NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES+1))
    RUN_GAME
  fi
}

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USER_NAME'")
if [[ -z $USER_ID ]]
then
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  ADD_USER=$($PSQL "INSERT INTO users(username,game_played,best_game) VALUES('$USER_NAME',0,0)")
  UPDATE_GAME_PLAYED=$($PSQL "UPDATE users SET game_played = 1")
  GAME_ID=$((100 + $RANDOM % 10000))
  PLAY_GAME
else
  GAME_PLAYED=$($PSQL "SELECT game_played FROM users WHERE username = '$USER_NAME'")
  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username='$USER_NAME'")
  USER_NAME_DB=$($PSQL "SELECT user_id FROM users WHERE username = $USER_ID")
  echo "Welcome back, $USER_NAME_DB! You have played $GAME_PLAYED games, and your best game took $BEST_GAME guesses."
  UPDATE_GAME_PLAYED=$($PSQL "UPDATE users SET game_played = ($GAME_PLAYED + 1)")
  GAME_ID=$((100 + $RANDOM % 10000))
  PLAY_GAME
fi

