#!/bin/bash
#   Write a bash script such that:
#+  1) The script should exit with error code if the user is not a root user.
#+  2) The script switches to /var/log directory.
#+  3) If the directory does not exsists, it exits.
#+  4) The script deletes the content of syslog file inside /var/log. 
#+  5) The script delete the content of wtmp file inside /var/log. 
#+  6) The script echoes the number of lines in the syslog and wtmp file it cleared.  

if [[ $UID -ne 0 ]]
then
    echo "User is not Root."
    exit 1
fi

cd /var/log 
if [ $? -ne 0 ]; 
then 
    echo "Directory does not exist"
    exit 1
fi

syslog_lines=$(wc -l < syslog) # getting the no of lines of syslog and wtmp file
wtmp_lines=$(wc -l < wtmp)

>syslog   #will redirect empty string to syslog file(i.e:clearing the file)
>wtmp

echo "Cleared ${syslog_lines} lines from syslog file and ${wtmp_lines} lines from wtmp file."