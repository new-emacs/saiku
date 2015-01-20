#!/bin/bash
cd saiku-core
mvn -DskipTests -Dmaven.test.failure.ignore=true clean install
cd ..
cd saiku-webapp
mvn clean install
cd ..
cd ../saiku-ui
mvn clean package install:install-file -Dfile=target/saiku-ui-3.0.9-SNAPSHOT.war  -DgroupId=org.saiku -DartifactId=saiku-ui -Dversion=3.0.9-SNAPSHOT -Dpackaging=war
cd -
cd saiku-server
mvn clean package


