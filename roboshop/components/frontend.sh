#!/bin/bash 

COMPONENT=frontend

ID=$(id -u)

if [ $ID -ne 0 ] ; then 
    echo -e "\e[31m This script is expected to be run by a root user or with a sudo privilege \e[0m"
    exit 1
fi 

echo "Installing Nginx :"
yum install nginx -y  &>> "/tmp/${COMPONENT}.log"

if [ $? -eq 0 ] ; then 
    echo -e "\e[32m success \e[0m"
else 
    echo -e "\e[31m failure \e[0m"
fi 

echo -n "Downloading the frontend component :"
curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

if [ $? -eq 0 ] ; then 
    echo -e "\e[32m success \e[0m"
else 
    echo -e "\e[31m failure \e[0m"
fi 

# It's always a great idea to perform validation before you get an exception.
# If the script is executed as a root user or as a sudo user, then it has to proceed.
# If not , I was to exit the script with some nice message.



# ```
# # yum install nginx -y
# # systemctl enable nginx
# # systemctl start nginx

# ```

# Let's download the HTDOCS content and deploy it under the Nginx path.

# ```
# # curl -s -L -o /tmp/frontend.zip "https://github.com/stans-robot-project/frontend/archive/main.zip"

# ```

# Deploy in Nginx Default Location.