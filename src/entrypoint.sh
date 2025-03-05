#!/usr/bin/env bash
# Requires root privileges
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
sudo jikkou config set-context "${JIKKOU_CONTEXT_NAME}" --config-props=kafka.client.bootstrap.servers="${JIKKOU_CONFIG_KAFKA_CLIENT_BOOTSTRAP_SERVERS}"
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
echo "Checking if Kafka is ready..."
until jikkou health get kafka 1>/dev/null 2>&1; do
    echo "Waiting for Kafka to be ready..."
    sleep 1
done

jikkou apply -f "${SCRIPT_DIR}/kafka-topics.yml"
