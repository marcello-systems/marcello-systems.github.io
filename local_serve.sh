#!/usr/bin/env bash

set -e

case $1 in
    'prod-build')
        echo "Building docker image of Jekyll"
        docker build -t jekyll .

        echo "Building Jekyll site"
        docker run \
            --volume="$PWD:/srv/jekyll:Z" \
            -e JEKYLL_ENV=prod \
            -t jekyll \
            build
    ;;
    'build')
        echo "Building docker image of Jekyll"
        docker build -t jekyll .

        echo "Building Jekyll site"
        docker run \
            --volume="$PWD:/srv/jekyll:Z" \
            -t jekyll
    ;;
    'serve')
    docker run \
            --volume="$PWD:/srv/jekyll:Z" \
            -p 4000:4000 \
            -it jekyll serve
    ;;
    'reset')
    rm -fR .jekyll-cache .sass-cache _site Gemfile.lock
    ;;
esac
