FROM node:10-alpine
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY package*.json ./
USER node
RUN npm install
COPY --chown=node:node . .
EXPOSE 8080
CMD [ "node", "index.js" ]
CMD docker stop $(docker ps -aq)
CMD docker system prune -a -f
CMD docker pull caiosagui/nodejs-image
CMD docker run --name nodejs-image -p 80:8080 -d caiosagui/nodejs-image