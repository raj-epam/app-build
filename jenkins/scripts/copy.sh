#!/bin/sh         
sftp -i $1 dhluser@10.0.0.5 << ! 
 sudo ls /opt/tomcat/webapps
 sudo cp /opt/tomcat/webapps/sample.jar /opt/tomcat/backup/$(date)/sample.jar
 rm -f /opt/tomcat/webapps/sample.jar
 put sample.jar /opt/tomcat/webapps/sample.jar
 bye
 !