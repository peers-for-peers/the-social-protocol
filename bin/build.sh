#!/bin/bash

set -e

PATH=$PATH:./node_modules/.bin

mkdir -p build
rm build/* || true

browserify index.js --debug -s TheSocialProtocol \
    | exorcist build/the_social_protocol.js.map \
    > build/the_social_protocol.js

uglifyjs build/the_social_protocol.js --mangle --compress warnings=false \
    --source-map-content build/the_social_protocol.js.map \
    --source-map-filename build/the_social_protocol.min.js.map \
    > build/the_social_protocol.min.js
