#!/bin/bash
cd saiku-core
mvn -DskipTests -Dmaven.test.failure.ignore=true clean install
cd ..
cd saiku-webapp
mvn clean install
cd ..
#git submodule init
#git submodule update
#cd saiku-ui
#git pull
#git checkout 3.0.1-SNAPSHOT 
#git pull origin 3.0.1-SNAPSHOT
# $git subtree pull --prefix=saiku-ui
cd ../saiku-ui
mvn clean package install:install-file -Dfile=target/saiku-ui-3.0.1-SNAPSHOT.war  -DgroupId=org.saiku -DartifactId=saiku-ui -Dversion=3.0.1-SNAPSHOT -Dpackaging=war
cd -
cd saiku-server
mvn clean package


