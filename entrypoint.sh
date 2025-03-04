#!/usr/bin/env bash
# Requires root privileges
sudo jikkou config set-context mycontext --config-props=kafka.client.bootstrap.servers=broker:9092
# Test
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
