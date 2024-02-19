#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -t --no-align -c"

echo Enter your username:
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

if [[ -z $USER_ID ]] 
then
ENTER_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
echo "Welcome, $USERNAME! It looks like this is your first time here."
USER_ID=$($PSQL "SELECT user_id FROM users WHERE username='$USERNAME'")

else
GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id=$USER_ID")
BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id=$USER_ID")

echo Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.
fi

SECRET_NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=1

echo "Guess the secret number between 1 and 1000:"
read GUESS

until [[ $GUESS == $SECRET_NUMBER ]]
do
if [[ ! $GUESS =~ ^[1-9][0-9]?*$ ]]
then
echo "That is not an integer, guess again:"
read GUESS
(( NUMBER_OF_GUESSES++ ))

else

if [[ $GUESS > $SECRET_NUMBER ]]
then 
echo "It's lower than that, guess again:"
(( NUMBER_OF_GUESSES++ ))
read GUESS

elif [[ $GUESS < $SECRET_NUMBER ]]
then
echo "It's higher than that, guess again:"
(( NUMBER_OF_GUESSES++ ))
read GUESS

fi
fi
done

INSERT_GAME=$($PSQL "INSERT INTO games(user_id, guesses) VALUES ($USER_ID, $NUMBER_OF_GUESSES)")
echo You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!