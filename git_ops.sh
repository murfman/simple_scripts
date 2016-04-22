#!/bin//bash

echo "*** Script for Git Push ***"
echo
echo "Run Time: $(date) @ $(hostname)"

# Define Variables
h1="/home/brian"

# Git Operations
echo "*** Starting Git Stuff Now @ $(date) ***"
cd $h1/src/simple_scripts
git add .
sleep 1

# # Git commit Function
read -p "Enter the commit note (keep it brief)  " note
git commit -m "$note"
sleep 2

# # Git Push Command
git push origin master
sleep 3

# Finishing up
echo "*** I should be finished now. Ended at $(date) ***"


#git_ops.sh
