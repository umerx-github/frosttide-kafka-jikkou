FROM streamthoughts/jikkou:latest AS base
ENV JIKKOU_CONTEXT_NAME="mycontext"
ENV JIKKOU_CONFIG_KAFKA_CLIENT_BOOTSTRAP_SERVERS="broker:9092"
USER root
RUN ln -s /app/jikkou /usr/local/bin/jikkou
RUN apk add --no-cache bash sudo
COPY ./src /frosttide-kafka-jikkou/src
RUN chown -R appuser:appuser /frosttide-kafka-jikkou
WORKDIR /frosttide-kafka-jikkou
USER appuser
ENTRYPOINT [ "/bin/bash", "-c", "./src/entrypoint.sh" ]

FROM base AS dev
USER root
# Create symlink from /usr/local/bin/jikkou to /app/jikkou
# on alpine, install bash and git
RUN apk add --no-cache git bind-tools
RUN deluser appuser
# Give the user a home and a shell
RUN adduser -D -s /bin/bash appuser
# Make the user a sudoer
RUN echo "appuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER appuser
