#!/bin/bash
#   Write a bash script such that:
#+  1) The script exits if it is not a root user.
#+  2) The script takes the input from user as user name.
#+  3) The script sets the default password of user inside script.
#+  4) The script exits if the parameter is not provided.
#+  5) The script exits if the user already exsists.
#+  6) The script creates user, home directory of user, change ownership of home directory from root to user.
#+  7) The scripts gives sudo rights to user.
#+  8) The script changes the default shell from "sh" to "bash".
#+  9) The scrit echoes success message if the user is created.
#+  10) The scrit echoes error message if the user is not created. 

if [[ $UID -ne 0 ]]
then
    echo "User is not Root."
    exit 1
fi
echo "Enter the user name: "
read user

if id -u $user >/dev/null 
then
	echo user already exist
	exit 1
else
	if $(useradd -m -p $(openssl passwd -1 110110) $user)
	then
		$(usermod -aG sudo $user)
		$(usermod -s /bin/bash $user)
		echo "Success the user is created."
	else
		echo "User is not created."
	fi
fi

