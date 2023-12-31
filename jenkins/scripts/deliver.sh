#!/usr/bin/env bash

# echo 'The following Maven command installs your Maven-built Java application'
# echo 'into the local Maven repository, which will ultimately be stored in'
# echo 'Jenkins''s local Maven repository (and the "maven-repository" Docker data'
# echo 'volume).'
# set -x
# mvn jar:jar install:install help:evaluate -Dexpression=project.name
# set +x

# echo 'The following complex command extracts the value of the <name/> element'
# echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
# set -x
NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
set +x

# echo 'The following complex command behaves similarly to the previous one but'
# echo 'extracts the value of the <version/> element within <project/> instead.'
# set -x
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`
set +x

# echo 'The following command runs and outputs the execution of your Java'
# echo 'application (which Jenkins built using Maven) to the Jenkins UI.'
# set -x
# java -jar target/${NAME}-${VERSION}.jar

#cp target/${NAME}-${VERSION}.jar $BUILD_NUMBER.jar
cp target/${NAME}-${VERSION}.jar sample.jar

echo "File created"
ssh -i $1 dhluser@10.0.0.5 << EOF 
sudo ls /opt/tomcat/webapps
sudo mkdir -p /opt/tomcat/backup/$(date +%F)/$2
sudo cp /opt/tomcat/webapps/sample.jar /opt/tomcat/backup/$(date +%F)/$2/
sudo rm -f /opt/tomcat/webapps/sample.jar
EOF
 