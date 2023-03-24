#!/bin/bash
#   Write a bash script such that:
#+  1) The script exits if user is not a root.
#+  2) The script zips all the scipts files with .sh extention in current directory.
#+  3) The name of zip file should be same as script name.

if [[ $UID -ne 0 ]]
then
    echo "User is not Root."
    exit 1
fi

dir=$(pwd)

for file in "$dir"/*.sh
do
	filename=$(basename "$file" .sh)
	zip "$filename.zip" "$file"
done

if [ $? -eq 0 ]
then
  echo "All .sh files in current directory have been zipped successfully."
else
  echo "An error occurred while zipping the .sh files."
fi