#!/bin/bash
echo 'downloading latest tinybird cli'
docker pull tinybirdco/tinybird-cli-docker:latest
echo '** 🚨🚨🚨 FORCE 🚨🚨🚨 starting upload process pipes'
docker run --name tinybirdci --rm --env-file ${PWD}/.env -it -v ${PWD}/data/tinybird:/mnt/data tinybirdco/tinybird-cli-docker bash -c "
cd /mnt/data && \
tb auth --token \$TB_TOKEN && \
tb push ./pipes/*.pipe --force
"