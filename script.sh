#!/usr/bin/env bash

#set -e

export ProjectName="app"

CK='\u2714'
ER='\u274c'

alias cls='printf "\033c"'

DOMAIN="localhost:9000"

DOCKER_IMAGE="jguillermo/docker-node:9"

export DEV_UID=$(id -u)
export DEV_GID=$(id -g)

app_start()
{
    docker-compose -f docker-compose.yml down &&
    docker-compose -f docker-compose.yml up

    if [ $? -eq 0 ]; then
        echo -e "\n\n$CK  [Docker UP] "
        echo -e "\n----------------------------------------------------------"
        echo -e "\n App Server RUN  ===> http://$DOMAIN   \r"
        echo -e "\n----------------------------------------------------------\n"
    else
        echo -e "\n$ER [Docker UP] No se pudo levantar docker.\n"
    fi
}


app_install()
{
    mkdir ~/nodecache && chmod 777 ~/nodecache
    app_console npm install
}

app_console()
{
   docker run -it --rm  -v ~/nodecache:/nodecache -v "$PWD"/app:/usr/src --user $(id -u):$(id -g) $DOCKER_IMAGE "$@"
}

app_docker_images_build()
{
   docker-compose -f docker-compose.build.yml build $@
}

case "$1" in
"install")
    app_install
    ;;
"start")
    app_start
    ;;
"build")
    app_docker_images_build ${@:2}
    ;;
"console")
    app_console ${@:2}
    ;;
*)
    echo -e "\n\n\n$ER [APP] No se especifico un comando valido\n"
    ;;
esac