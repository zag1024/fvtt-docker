FROM node:14-alpine

ENV UID=5000
ENV GID=5000

RUN deluser --remove-home node && \
    addgroup -g $GID foundry && \
    adduser -u $UID -G foundry -D foundry

USER foundry
RUN mkdir -p /home/foundry/data && mkdir -p /home/foundry/app

WORKDIR /home/foundry/app
COPY --chown=$UID:$GID ./foundryvtt/ .

EXPOSE 30000
CMD ["node", "./resources/app/main.js", "--headless", "--dataPath=/home/foundry/data" ]
