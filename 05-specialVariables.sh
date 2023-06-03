#!/bin/bash 

# Special variables gives special properties to your variables 

# Here are few of the special variabes :  $0 to $9 , $? ,  $#,  $* , $@ 

echo $0     # $0 prints the script name yoi're executing 
echo "Name of the script executed is $0"
echo "Name of the Trainer is $1"
echo "Training Batch Number is $2"
echo "Current Topics is $3" 

# We can supply the values from the command line 

# bash scriptName.sh 100   200   300    ( like this you can supply a maximum of 9 variables from the command line)
#                     $1    $2    $3  