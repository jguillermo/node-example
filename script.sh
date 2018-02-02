#!/usr/bin/env bash

#set -e

export ProjectName="app"

CK='\u2714'
ER='\u274c'

alias cls='printf "\033c"'

DOCKER_IMAGE="jguillermo/docker-node:9"

APP_PATH=app

export DEV_UID=$(id -u)
export DEV_GID=$(id -g)

app_start()
{
    app_console_port npm run start
}


app_install()
{
    mkdir ~/nodecache && chmod 777 ~/nodecache
    app_console npm install
}

app_console()
{
   docker run -it --rm -v "$PWD"/$APP_PATH:/usr/src/app -w /usr/src/app --user $(id -u):$(id -g) $DOCKER_IMAGE "$@"
}

app_console_port()
{
   docker run -it --rm -p 9000:9000 -v "$PWD"/$APP_PATH:/usr/src/app -w /usr/src/app --user $(id -u):$(id -g) $DOCKER_IMAGE "$@"

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