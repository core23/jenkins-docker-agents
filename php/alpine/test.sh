#!/usr/bin/env sh
set -eux

VERSION=8.1

cd $VERSION

docker buildx build --platform linux/amd64 -t 192.168.41.15:15000/jenkins-php-agent:${VERSION} .

docker run --init --rm -it -v ~/Development/Web/work/isg/selfservice:/home/jenkins --entrypoint=composer 192.168.41.15:15000/jenkins-php-agent:${VERSION} show -o

docker images 192.168.41.15:15000/jenkins-php-agent:${VERSION}

docker push 192.168.41.15:15000/jenkins-php-agent:${VERSION}
