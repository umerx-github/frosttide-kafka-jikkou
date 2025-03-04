FROM streamthoughts/jikkou:latest AS base
USER root
RUN ln -s /app/jikkou /usr/local/bin/jikkou
RUN apk add --no-cache bash sudo
COPY . /frosttide-kafka-jikkou
RUN chown -R appuser:appuser /frosttide-kafka-jikkou
WORKDIR /frosttide-kafka-jikkou
USER appuser
ENTRYPOINT [ "/bin/bash", "-c", "entrypoint.sh" ]

FROM base AS dev
USER root
# Create symlink from /usr/local/bin/jikkou to /app/jikkou
# on alpine, install bash and git
RUN apk add --no-cache git
RUN deluser appuser
# Give the user a home and a shell
RUN adduser -D -s /bin/bash appuser
# Make the user a sudoer
RUN echo "appuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER appuser
# ENTRYPOINT ["/app/jikkou"]
