FROM alpine:3.7
LABEL maintainer "Stefan Hoffmann>"

# Configure cron
COPY crontab /etc/cron/crontab

# Init cron
RUN crontab /etc/cron/crontab

CMD ["crond", "-f"]