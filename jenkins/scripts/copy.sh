#!/bin/sh         
sftp -i $1 dhluser@10.0.0.5 << !
put sample.jar /opt/tomcat/webapps/sample.jar
bye
!