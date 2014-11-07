#!/bin/bash

function do_build(){
    cd saiku-core
    mvn -DskipTests -Dmaven.test.failure.ignore=true clean install
    pause
    cd ..
    cd saiku-webapp
    mvn clean install
    pause
    cd ..
    #git submodule init
    #git submodule update
    #cd saiku-ui
    #git pull
    #git checkout 3.0.1-SNAPSHOT
    #git pull origin 3.0.1-SNAPSHOT
    # $git subtree pull --prefix=saiku-ui
    cd ../saiku-ui
    npm install
    mvn clean package install:install-file -Dfile=target/saiku-ui-3.0.1-SNAPSHOT.war  -DgroupId=org.saiku -DartifactId=saiku-ui -Dversion=3.0.1-SNAPSHOT -Dpackaging=war
    pause
    cd ../saiku-server
    mvn clean package
}

function do_run(){
    cw kill 8015
    cd saiku-server
    mvn -o install
    mvn jetty:run &
}

function do_start_ui(){
    cw kill 80
    cd ../saiku-ui
    node server.js 80 localhost 8015
}



for OPT in $@ ; do

    echo "开始执行： $OPT"

    case $OPT in
        build)
            do_build
            ;;
        server)
            do_run
            ;;
        ui)
            do_start_ui
            ;;
        all)
            ./saiku run server stop
            ./saiku build all
            ./saiku run server start
            tail -f /home/will/saiku/saiku-server/target/dist/saiku-server/tomcat/logs/catalina.out &
            ;;
        help)
            do_help
            ;;
    esac

done
