#!/bin/bash
echo "What is your name?"
read name
echo 
echo "Hello $name."
firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}
echo "You are building version $version"
echo "Do you need to change the version?"
echo "(1 for Yes/0 for No)"
read versioncontinue
echo 
if [ $versioncontinue -eq 1 ]
then
  echo "Okay."
  for filename in source/*
  do
    echo $filename
  done
  echo 
  for filename in source/*
  do 
    if [ $filename == "source/secretinfo.md" ]
    then
      echo "Not copying..." $filename
    else
      echo "Copying..." $filename
      cp $filename build/.
    fi
  done
  echo 
  echo "Files currently in Build version $version:"
  ls build/.
else
  echo "Please come back when you are ready."
fi