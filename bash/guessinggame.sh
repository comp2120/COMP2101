#!/bin/bash
#
# This script implements a guessing game
# it will pick a secret number from 1 to 10
# it will then repeatedly ask the user to guess the number
#    until the user gets it right

# Give the user instructions for the game
cat <<EOF
Let's play a game.
I will pick a secret number from 1 to 10 and you have to guess it.
If you get it right, you get a virtual prize.
Here we go!

EOF

# Pick the secret number and save it
secretnumber=$(($RANDOM % 10 +1)) # save our secret number to compare later
userguess=-1
typeset -i num=0

# This loop repeatedly asks the user to guess and tells them if they got the right answer
# TASK 1: Test the user input to make sure it is not blank
# TASK 2: Test the user input to make sure it is a number from 1 to 10 inclusive
# TASK 3: Tell the user if their guess is too low, or too high after each incorrect guess

read -p "Give me a number from 1 to 10: " userguess # ask for a guess

while [ $userguess != $secretnumber ]; do # ask repeatedly until they get it right
  num=num+1
  read -p "Give me a number from 1 to 10: " userguess # ask for another guess
#check if the input is higher or lower than the given number 
  if (($userguess < $secretnumber)); then
     echo "the number is higher than your guess."
  elif (( $userguess > $secretnumber)); then
     echo "the number is lower than your guess."
  fi
#check if the number is between 1 to 10 
  if (($userguess < 1 )); then
     echo "the number cannot be lower than 1."
  elif (($userguess > 10 )); then
     echo "the number cannot be higher than 10."
  fi
done
echo "You got it! Have a milkdud."

