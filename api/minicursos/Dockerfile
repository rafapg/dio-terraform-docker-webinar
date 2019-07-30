FROM node:8.3-alpine

COPY . /usr/src/app/
WORKDIR /usr/src/app

RUN rm -rf /usr/src/app/node_modules && \
	npm install

ENTRYPOINT npm run start