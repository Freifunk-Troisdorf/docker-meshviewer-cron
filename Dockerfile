FROM alpine:3.10.3
LABEL maintainer "Stefan Hoffmann, Nils Jakobi"

# Configure cron
COPY crontab /etc/cron/crontab

# Copy script
WORKDIR /opt/fftdf/
COPY nodePoller.sh .

# Init cron
RUN crontab /etc/cron/crontab

CMD ["crond", "-f"]
