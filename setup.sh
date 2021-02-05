#! /bin/bash
clear
mm_decho ()
{
        local i stepping
        stepping="0.01"

        # When first argument is empty or not given, it just echoes a new line
        # and leaves.
        if [ ! "$1" ]; then 
                echo
                return
        fi

        # If a second argument is given (delay stepping), check it for validity
        # (if it is a float) and set stepping according to the argument.
        if  (( $# > 1 )) && 
            [[ ($2 = $(echo $2 | grep -oE '[[:digit:]]')) ||
               ($2 = $(echo $2 | grep -oE '[[:digit:]]+\.[[:digit:]]+')) ]] 
            then
                stepping="$2"
        # In case the previous test failed, but we have a second argument,
        # meaning it is invalid, just print the message, complain a bit and then
        # quit the function with false.
        elif (( $# > 1 )); then
                echo "$1"
                echo ".! mm_decho() oops: second argument is invalid!" 1>&2
                echo ".! must be /float but is: \"$2\", leaving function.." 1>&2
                return false 2>/dev/null
        fi

        # Do delayed printing of first input argument. Calculate the
        # length of first arg. and substract one. Then make it a /for/
        # sequence going through all the characters of the string,
        # printing these and wait the delay stepping time.
        for i in $(seq 0 $((${#1}-1))); do
                echo -n "${1:$i:1}"
                sleep $stepping
        done
        echo
}
clear
termux-setup-storage
clear
echo -e '\033[1;92m'
mm_decho "All Packages Are Installing...."
echo -e "\n\033[1;91m[\e[1;97m+\033[1;91m]\033[1;93m Installing Python...."
pkg install python -y 2> /dev/null > /dev/null
echo -e "\n\033[1;91m[\e[1;97m+\033[1;91m]\033[1;93m Installing Requests....."
pip install requests 2> /dev/null > /dev/null
pip install -r requirements.txt
clear
echo -e "\n\033[1;91m[\e[1;97m+\033[1;91m]\033[1;93m To Run The Code Type python dhspam.py...."
