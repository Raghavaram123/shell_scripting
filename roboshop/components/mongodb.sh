#!/bin/bash 

COMPONENT=mongodb
LOGFILE="/tmp/${COMPONENT}.log"

ID=$(id -u)

if [ $ID -ne 0 ] ; then 
    echo -e "\e[31m This script is expected to be run by a root user or with a sudo privilege \e[0m"
    exit 1
fi 

stat() {
    if [ $1 -eq 0 ] ; then 
        echo -e "\e[32m success \e[0m"
    else 
        echo -e "\e[31m failure \e[0m"
        exit 2
    fi 
}

echo -n  "Configuring the $COMPONENT repo :"
curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
stat $? 

echo -n "Installing $COMPONENT : "
yum install -y $COMPONENT-org   &>> $LOGFILE
stat $? 

echo -n "Enabling the DB visibility :"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf
stat $? 

echo -n "Starting $COMPONENT : "
systemctl daemon-reload mongod      &>> $LOGFILE
systemctl enable mongod      &>> $LOGFILE
systemctl restart mongod       &>> $LOGFILE
stat $?

# 1. Install Mongo & Start Service.

# ```
# 1. Setup MongoDB repos.

# ```bash
# # curl -s -o /etc/yum.repos.d/mongodb.repo https://raw.githubusercontent.com/stans-robot-project/mongodb/main/mongo.repo
# ```

# 1. Install Mongo & Start Service.
# ```