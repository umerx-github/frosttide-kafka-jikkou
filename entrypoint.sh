#!/usr/bin/env bash
# Requires root privileges
sudo jikkou config set-context "${JIKKOU_CONTEXT_NAME}" --config-props=kafka.client.bootstrap.servers="${JIKKOU_CONFIG_KAFKA_CLIENT_BOOSTRAP_SERVERS}"
# What the above command does is equivalent to the following
# cat << EOF >/etc/jikkou/config
#   "currentContext" : "myconfig",
#   "myconfig" : {
#     "configFile" : null,
#     "configProps" : {
#       "kafka.client.bootstrap.servers" : "broker:9092"
#     }
#   }
# }
# EOF
jikkou apply -f ./kafka-topics.yml
