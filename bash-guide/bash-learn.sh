#!/usr/bin/env bash

echo hello world!
echo "hello world!"
echo 'hello world!'

# declare the variable
var="a string example"
echo $var # => a string
echo "$var" # => a string
echo '$var' # => $var

# reference the value of the variable
# expand the variable, or parameter substitution
echo ${var}
echo "${var}"

# string substitution in a variable
echo ${var/a/some}

# substring from a variable
len=7
echo ${var:0:len}
echo ${var: -5} # ! note the space before -5

# string length
echo ${#var}

# indirect expansion
otherVar="var"
echo ${!otherVar}

# set the default value for a variable
echo ${var:-"default value"}



# Inside my_script.sh, commands will use $1 to refer to Hello,
# $2 to 42, and $3 for World
# $0, will expand to the current script's name, e.g. my_script.sh
bash my_script.sh Hello 42 World

seq 1 5

arr=$(seq 1 5)
echo $arr

a=$(echo 'hello' | tr '[:lower:]' '[:upper:]')
b=$(echo 'WORLD' | tr '[A-Z]' '[a-z]')
echo "$a, $b"

# arithmetic caculation
echo "42 - 10 = $(( 42 - 10))"

echo "9.45 / 2.327" | bc
echo "9.45 / 2.327" | bc -l

# global variable IFS is what Bash uses to split a string of expanded
# into separate words. By default, the IFS variable is set to
# three characters: newline, space, and the tab.
IFS=Z
story="The man named Zorro rides a Zebra"
echo ">>" $story "<<"

file_to_kill="Junk Final.docx"
rm $file_to_kill
rm "$file_to_kill"