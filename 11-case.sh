#!/bin/bash 

# Syntax for CASE 
# case  $var in 
#     opt1) command1 ;; 
     
#     opt2) command2 ;;

# esac

ACTION=$1

case $ACTION in 
    start) 
        echo -e "\e[32m Starting RabbitMQ Service \e[0m"
        ;;
    stop) 
        echo -e "\e[31m Stopping RabbitMQ Service \e[0m"
        ;;
    restart) 
        echo -e "\e[33m Restarting RabbitMQ Service \e[0m"
        ;;
    *)
        echo -e "\e[36m Possible values are start or stop or restart only \e[0m"
        ;;

esac 
