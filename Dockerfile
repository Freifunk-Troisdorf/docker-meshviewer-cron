FROM alpine:3.10.3
LABEL maintainer "Stefan Hoffmann, Nils Jakobi"

VOLUME [ "/opt/data" ]

# prerequisists
RUN apk add curl sed

# Configure cron
COPY crontab /etc/cron/crontab

# Copy script
WORKDIR /opt/fftdf/
COPY nodePoller.sh .

# Init cron
RUN crontab /etc/cron/crontab

ENTRYPOINT ["crond", "-f"]
