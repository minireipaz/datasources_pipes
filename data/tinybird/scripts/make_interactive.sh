#!/bin/bash
echo 'downloading latest tinybird cli'
docker pull tinybirdco/tinybird-cli-docker:latest
echo '** starting interactive mode'
docker run --name tinybirdci --rm -it --env-file ${PWD}/.env -v ${PWD}/data/tinybird:/mnt/data tinybirdco/tinybird-cli-docker bash

# cd /mnt/data && \
# tb auth --token \$TB_TOKEN
