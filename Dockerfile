FROM node:lts-alpine
LABEL maintainer "anarion80 (https://github.com/anarion80)"

#RUN mkdir -p /app/code/
WORKDIR /app/code

RUN ln -s /run/database.json /app/code/database.json

ADD backend /app/code/backend
ADD frontend /app/code/frontend
ADD migrations /app/code/migrations
ADD package.json index.js /app/code/
ADD docker-entrypoint.sh /

RUN apk add --no-cache bash su-exec \
    && npm install --omit=dev
#RUN npm install --production

EXPOSE 3000

ENTRYPOINT [ "/docker-entrypoint.sh"]