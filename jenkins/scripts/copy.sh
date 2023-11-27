#!/bin/sh         
sftp -i $1 dhluser@10.0.0.5 << ! 
 sudo ls /opt/tomcat/webapp
 sudo cp /opt/tomcat/webapp/sample.jar /opt/tomcat/backup/$(date)/sample.jar
 rm -f /opt/tomcat/webapp/sample.jar
 put sample.jar /opt/tomcat/webapp/sample.jar
 bye
 !