#!/bin/bash
echo 'downloading latest tinybird cli'
docker pull tinybirdco/tinybird-cli-docker:latest
echo '** starting tests'
docker run --name tinybirdci --rm --env-file ${PWD}/.env -v ${PWD}/data/tinybird:/mnt/data tinybirdco/tinybird-cli-docker bash -c "
cd /mnt/data && \
tb auth --token \$TB_TOKEN && \
echo '*** uploading fixtures' && \
tb push datasources --fixtures --force && \
chmod +x ./scripts/exec_test.sh && \
./scripts/exec_test.sh
"
