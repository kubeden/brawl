#!/bin/bash

# Define options

while getopts ":ht:w:" option; do
   case $option in
      h) #display Help
	 Help
	 exit;;
      t) # Display target
	 Target=$OPTARG;;
      w) # File name
	 File=$OPTARG;;
     \?) # Invalid option
         echo -e ""
	 echo -e "\033[0;31m Error: Invalid option \033[0m"
	 echo -e ""
         exit;;
   esac
done



# Define functions

Help()
{
   # Display Help
   echo ""
   echo "Brawl is a basic crawling tool written in bash."
   echo
   echo "Syntax: ./brawl [-h|-t|-w]"
   echo ""
   echo "options:"
   echo "	-t     Target. Is expecting a hostname (e.g. asciiden.com)."
   echo "	-w     Wordlist. Is expecting path to your wordlist."
   echo
   echo "TL;DR"
   echo -e "*The creator of the tool killed two hours making this*"
   echo -e "He does not regret any minute of it. It was fun, he says."
   echo ""
}

Crawl() {
if [[ $File != "" && $Target != "" && -t 1 ]]
then
	echo -e ""
	echo -e "\033[0;33mStarting a scan on $Target and reading from $File\033[0m"
	echo -e ""
	echo -e "\033[0;33mStarting an HTTP (80) test:\033[0m"
	while read -r line; do
    		path="$line"
		echo -e "Status of \033[0;35m/$path \033[0mis: "`curl -s -o /dev/null -w "%{http_code}" http://$Target/$path`
	done < "$File"
	echo -e ""
	echo -e "\033[0;33mNow starting an HTTPS (443) test:\033[0m"
	while read -r line; do
                path="$line"
                echo -e "Status of \033[0;35m/$path \033[0mis: "`curl -s -o /dev/null -w "%{http_code}" https://$Target/$path`
	done < "$File"
	echo -e ""
elif [[ $File != "" && $Target != "" ]]
then
        echo -e ""
        echo -e "Starting a scan on $Target and reading from $File"
        echo -e ""
        echo -e "Starting an HTTP (80) test:"
        while read -r line; do
                path="$line"
                echo -e "Status of /$path is: "`curl -s -o /dev/null -w "%{http_code}" http://$Target/$path`
        done < "$File"
        echo -e ""
        echo -e "Now starting an HTTPS (443) test:"
        while read -r line; do
                path="$line"
                echo -e "Status of /$path is: "`curl -s -o /dev/null -w "%{http_code}" https://$Target/$path`
        done < "$File"
        echo -e ""
else
	echo -e ""
	echo -e "\033[31mYou have to use the -w and -t arguments."
        echo -e "\033[0m"
        Help
fi
}

# Call functions
Crawl
