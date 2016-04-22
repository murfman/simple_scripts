#!/bin/bash

# Random Password gnertor script with options...

echo "*** Random Password Generator ***"

echo "Choose an option below."
echo $'\n'
#questions to set Variables
echo "What method do you want to use?"
echo -e "\n"
echo "1. Hash and base64 the date."
echo "2. Use urandom."
echo "3. Use openssl's rand function."
echo "4. A reverse urandom"
echo "5. Filter a string from urandom."
echo "6. Use dd then base64."
echo "7. MD5 the current date."
echo " "
read -p "Enter option between 1 and 7. " m1

read -p "How many characters in the password?  " n1

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
