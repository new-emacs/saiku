#!/bin/bash
#export PATH=/usr/share/java/maven-2.2.1/bin/:$PATH
git merge master
curl https://raw.github.com/pentaho/mondrian/lagunitas/demo/FoodMart.mondrian.xml > util/FoodMart.xml
cp util/FoodMart.xml saiku-core/saiku-service/src/test/resources/org/saiku/olap/discover/FoodMart.xml
cd saiku-core
<<<<<<< HEAD
mvn -DskipTests -Dmaven.test.failure.ignore=true clean install   
=======
mvn -U clean install -DskipTests=true 
>>>>>>> upstream/mondrian-4
cd ..
cd saiku-webapp
mvn -U clean install
cd ..
git submodule init
git submodule update
cd saiku-ui
git pull
<<<<<<< HEAD
git checkout saiku3 
git pull origin saiku3
mvn clean package install:install-file -Dfile=target/saiku-ui-3.0-SNAPSHOT.war  -DgroupId=org.saiku -DartifactId=saiku-ui -Dversion=3.0-SNAPSHOT -Dpackaging=war
=======
mvn -U clean package install:install-file -Dfile=target/saiku-ui-2.6-SNAPSHOT.war  -DgroupId=org.saiku -DartifactId=saiku-ui -Dversion=MONDRIAN4-SNAPSHOT -Dpackaging=war
>>>>>>> upstream/mondrian-4
cd ../saiku-server
mvn -U clean package
cd ../saiku-bi-platform-plugin
<<<<<<< HEAD
# mvn clean package
=======
mvn -U clean package
>>>>>>> upstream/mondrian-4
cd ../saiku-bi-platform-plugin-p5
# mvn clean package
