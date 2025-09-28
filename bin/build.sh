#!/usr/bin/env bash

if [ -z "$1" ]; then
    echo "Template missing! Usage: <template> <apk|image>"
    exit 1
fi

if [ -z "$2" ]; then
    echo "Build type missing! Usage: <template> <apk|image>"
    exit 1
fi

if [ "$2" = "apk" ]; then
    docker run --privileged --rm -v "${PWD}":/work \
        cgr.dev/chainguard/melange build templates/$1/melange.yml \
        --arch aarch64 \
        --signing-key melange.rsa
elif [ "$2" = "image" ]; then
    docker run --rm --workdir /work -v ${PWD}:/work cgr.dev/chainguard/apko \
        build templates/$1/apko.yml $1-application:0.1.0 $1-application.tar --arch host
    find . -name "sbom*" -exec rm {} \;
    docker load <$1-application.tar
    docker image ls | grep $1-application
fi
