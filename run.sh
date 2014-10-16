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
    mvn clean package install:install-file -Dfile=target/saiku-ui-3.0.1-SNAPSHOT.war  -DgroupId=org.saiku -DartifactId=saiku-ui -Dversion=3.0.1-SNAPSHOT -Dpackaging=war
    pause
    cd ../saiku-server
    mvn clean package
}

function do_run(){
    cd saiku-server
    mvn run
}



for OPT in $@ ; do

    echo "开始执行： $OPT"

    case $OPT in
        build)
            do_build
            ;;
        run)
            do_run
            ;;
        saiku)
            do_mvn_jetty_run_saiku
            ;;
        etl)
            do_mvn_jetty_run_etl
            ;;
        all)
            do_start_all
            ;;
        help)
            do_help
            ;;
    esac

done
