FROM openjdk:14-jdk-alpine

RUN apk --update add jq && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/* && \
    wget https://github.com/secdec/attack-surface-detector-cli/releases/download/v1.3.5/attack-surface-detector-cli-1.3.5.jar -O /tmp/oasd.jar



ADD entrypoint.sh  /entrypoint.sh

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]