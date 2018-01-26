#!/usr/bin/env bash

#set -e

export ProjectName="app"

CK='\u2714'
ER='\u274c'

alias cls='printf "\033c"'

export DEV_UID=$(id -u)
export DEV_GID=$(id -g)

app_start()
{
    app_console npm run start
}


app_install()
{
    echo -n "Project name ($ProjectName)? "
    read answer
    if [ $answer ]; then
      ProjectName="$answer"
    fi

    mkdir ~/nodecache && chmod 777 ~/nodecache

    echo "$ProjectName" > projectname
    echo "$ProjectName"/node_modules >> .gitignore

    mkdir $ProjectName && docker-compose -f docker-compose.tasks.yml run --rm --user $(id -u):$(id -g) node ng new $ProjectName

}


app_console()
{
    docker run -it --rm -p 9000:9000 -v "$PWD"/app:/usr/src/app -w /usr/src/app --user $(id -u):$(id -g) jguillermo/docker-angular-cli:latest "$@"
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