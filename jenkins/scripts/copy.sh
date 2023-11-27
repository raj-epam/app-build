#!/bin/sh         
sftp -i $1 dhluser@10.0.0.5 <<EOF sudo ls /opt/tomcat/webapp
 sudo cp /opt/tomcat/webapp/simple.war /opt/tomcat/backup/$(date)/simple.war
 put ./target/my-app-1.0-SNAPSHOT.jar /opt/tomcat/webapp/simple.war
 exit
 EOF