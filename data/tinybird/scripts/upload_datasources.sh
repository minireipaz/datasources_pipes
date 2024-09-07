#!/bin/bash
echo 'downloading latest tinybird cli'
docker pull tinybirdco/tinybird-cli-docker:latest
echo '** starting upload process'
echo '** 🚨🚨🚨 workflows datasource needs already created token with DATA GROUP ID ${KAFKA_GROUP_ID_WORKFLOW} and read access 🚨🚨🚨'
docker run --name tinybirdci --rm --env-file ${PWD}/.env -it -v ${PWD}/data/tinybird:/mnt/data tinybirdco/tinybird-cli-docker bash -c "
cd /mnt/data && \
tb auth --token \$TB_TOKEN && \
tb push ./datasources/*.datasource

"
# tb connection create kafka --bootstrap-servers \$KAFKA_URI --key \$KAFKA_KEY --secret \$KAFKA_SECRET --connection-name \$KAFKA_CONNECTION_NAME && \
# tb datasource connect \$KAFKA_CONNECTION_NAME workflows --kafka-topic \$KAFKA_TOPIC_WORKFLOW --kafka-group \$KAFKA_GROUP_ID_WORKFLOW --kafka-auto-offset-reset \$KAFKA_GROUP_WORKFLOW_OFFSET && \
