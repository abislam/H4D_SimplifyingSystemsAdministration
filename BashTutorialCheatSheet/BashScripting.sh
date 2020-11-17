#! /bin/bash

#### Hello bash script

echo "Hello Bash Script"

#### Redirect to file
##this will create file.txt and output the echo there
echo "hello bash script" > file.txt

##append to text file
##cat will open an editor where users can edit the file
#one > replaces the text. two >> appends the text
cat >> file.txt

####comments
#single line comment
: 'multiline comments
multiline comments
multiline comments
multiline comments
multiline comments
multiline comments'


####hereDoc
#valCreative is basically a variable
#that stores the string
#this can print multiline comments to the screen
cat << valCreative
this is hello creative text
add another line
valCreative

####conditional Statements
#if/else elif statement

#count is a variable
count = 10

#if count is equal to 10
#-eq is equal to
#-ne is not equal to
#-gt is greater than
#-lt is less than
#for < > symbols use ((condition)) insead of []
if [ $count -eq 10 ]
then
	#execute this block
	echo "the condition is true"
elif (( $count <= 9 ))
then
	echo "the condition is then"
else
	echo "the condition is false"
#end if
fi

####and operator

age = 10

if [ "$age" -gt 18 ] && [ "$age" -lt 40 ]
then
	echo "Age is correct"
else
	echo "Age is not correct"
fi

####or operator
# -o
age = 10

if [ "$age" -gt 18 ] -o [ "$age" -lt 40 ]
then
	echo "Age is correct"
else
	echo "Age is not correct"
fi

#different syntax if you want to use || for or
age = 10

if [ "$age" -gt 18 ] || [ "$age" -lt 40 ]
then
	echo "Age is correct"
else
	echo "Age is not correct"
fi

####loops, while loops, until, for, break, continue
#while
number = 1
while [ $number -lt 10 ]
do
	echo "$number"
	number = $(( number+1 ))
done


#until loop
#until will run until condition becomes true
number = 1
until [ $number -ge 10 ]
do
	echo "$number"
	number = $(( number+1 ))
done

#for loop
#prints from 0 through 20
#{start..end..increment}
for i in {0..20}
do
	echo $i
done

#another way of writing for loop
for (( i=0; i<5; i++ ))
do
	echo $i
done

#BREAK
#BREAK breaks out of for loop when if condition is true
#echo will get skipped
for (( i=0; i<=10; i++ ))
do
	if[ $i -gt 5 ]
	then
		break
	fi
	echo $i
done

#CONTINUE
#CONTINUE breaks out of if loop when if condition is true
#for loop is still active
for (( i=0; i<=10; i++ ))
do
	if[ $i -gt 5 ]
	then
		continue
	fi
	echo $i
done

####Script input
#type ./filename.sh input1 input2 input3
#the echo will take those inputs and print
echo $1 $2 $3

#unlimited inputs
#this is an array of unlimited inputs
#@ represents unlimited 
args=( "$@" )

echo ${args[0]} ${args[1]} ${args[2]}

#print the whole array
echo $@

#find length of array
echo $#

#read file using STDIN
#reading line by line
while read line
do
	echo "$line"
#in command line put file name as an input
#1 represents the file name
done < "${1:-/dev/stdin}"

#Script output STDOUT STDERR
#1 represents STDOUT 2 represents STDERR
ls -al 1>file1.txt 2>file2.txt

#using STDOUT and STDERR in same file
ls -al 1>file1.txt 2>&1


####send output to another script file
MESSAGE="Hello world"
export MESSAGE
./secondScript.sh




















