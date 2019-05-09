
FROM node:10-stretch

# NOTE(douglasduteil): change the default timezone to Paris, Europe
# see https://w3blog.fr/2015/03/04/proxy-et-timezone-pour-votre-dockerfile/
ENV TZ Europe/Paris
RUN cp /usr/share/zoneinfo/Europe/Paris /etc/localtime

WORKDIR /app

RUN yarn --frozen-lockfile && yarn cache clean
COPY ./site /app

RUN yarn build && yarn export
