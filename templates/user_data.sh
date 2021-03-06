#!/bin/bash
echo ECS_CLUSTER=${cluster_name} >> /etc/ecs/ecs.config
# ECS_ENABLE_CONTAINER_METADATA=true
echo 'OPTIONS="$${OPTIONS} --storage-opt dm.basesize=${docker_storage_size}G"' >> /etc/sysconfig/docker
/etc/init.d/docker restart
echo ECS_ENGINE_AUTH_TYPE=dockercfg >> /etc/ecs/ecs.config
echo 'ECS_ENGINE_AUTH_DATA={"https://index.docker.io/v1/": { "auth": "${dockerhub_token}", "email": "${dockerhub_email}"}}' >> /etc/ecs/ecs.config

# Append addition user-data script
${additional_user_data_script}
