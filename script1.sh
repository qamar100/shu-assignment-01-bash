#!/bin/bash
#   Write a bash script such that:
#+  1) It installs git in a system, if it not already installed.
#+  2) The script exits if the user is not a root.
#+  3) The script echoes the version of git installed.

if [ $(whoami) != "root" ]
then 
echo "User is not Root.This script must be run as root user"
    exit 1
fi

echo "You are running this script as root user"

command -v git > /dev/null  #checking it git is installed or not and redirecting its output 

if [ $? -eq 0 ]     #if above command is successfull meaning git is installed the var $? will be 0
then 
echo "$(git --version) is already installed"
else
  echo "Installing git...."
  echo $(sudo apt-get install git >/dev/null)
  echo "$(git --version) installed."

fi  

