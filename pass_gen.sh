#!/bin/bash

# include the utils.sh
# source ./utils.sh

# Random Password gnertor script with options...

#new tput test code

# clear screen
tput clear

# move cursor
tput cup 3 23

# set color
tput setaf 3
echo "*** Murph's ***"
tput sgr0

tput cup 5 15
tput rev
echo "*** Random Password Generator ***"
tput sgr0

tput cup 7 15
echo "What method do you want to use?"
tput cup 8 16
echo "1. Hash and base64 the date."
tput cup 9 16
echo "2. Use urandom."
tput cup 10 16
echo "3. Use openssl's rand function."
tput cup 11 16
echo "4. A reverse urandom"
tput cup 12 16
echo "5. Filter a string from urandom."
tput cup 13 16
echo "6. Use dd then base64."
tput cup 14 16
echo "7. MD5 the current date."

tput bold
tput cup 16 15
read -p "Enter option between 1 and 7. " m1
tput cup 17 15
read -p "How many characters in the password?  " n1

tput clear
tput sgr0
# tput rc
tput cup 10 15
echo "Your password is: "


# old echo code
#
# echo "*** Random Password Generator ***"
#
# echo "Choose an option below."
# echo $'\n'
# #questions to set Variables
# echo "What method do you want to use?"
# echo -e "\n"
# echo "1. Hash and base64 the date."
# echo "2. Use urandom."
# echo "3. Use openssl's rand function."
# echo "4. A reverse urandom"
# echo "5. Filter a string from urandom."
# echo "6. Use dd then base64."
# echo "7. MD5 the current date."
# echo " "
# read -p "Enter option between 1 and 7. " m1
#
# read -p "How many characters in the password?  " n1

if [[ $m1 -lt 1 ]]
then
  echo "Choose an option greater than 1!!"

elif [[ $m1 -gt 7 ]]
then
  echo "Choose an option less than 8!!"
fi

if [ $m1 -eq 1 ]
then
  # hash and base64 the date
  date +%s | sha256sum | base64 | head -c $n1 ; echo

elif [ $m1 -eq 2 ]
then
  # using the urandom function
  < /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-$n1};echo

elif [ $m1 -eq 3 ]
then
  # using openssl's rand function
  openssl rand -base64 $n1

elif [ $m1 -eq 4 ]
then
  # reverse urandom
  tr -cd '[:alnum:]' < /dev/urandom | fold -w$n1 | head -n1

elif [ $m1 -eq 5 ]
then
  # filters strings from urandom
  strings /dev/urandom | grep -o '[[:alnum:]]' | head -n $n1 | tr -d '\n'; echo

elif [ $m1 -eq 6 ]
# simpler urandom 6 digit
#< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c$n1
then
  # using dd Command
  dd if=/dev/urandom bs=1 count=32 2>/dev/null | base64 -w 0 | rev | cut -b 2- | rev

elif [ $m1 -eq 7 ]
then
  # simpleest
  date | md5sum
fi

exit $?

tput clear
tput sgr0
tput rc
