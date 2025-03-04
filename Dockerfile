FROM streamthoughts/jikkou:latest AS base


FROM base AS dev
USER root
# on alpine, install bash and git
RUN apk add --no-cache bash git sudo
RUN deluser appuser
# Give the user a home and a shell
RUN adduser -D -s /bin/bash appuser
# Make the user a sudoer
RUN echo "appuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
USER appuser
# ENTRYPOINT ["/app/jikkou"]
