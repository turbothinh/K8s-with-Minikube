FROM node:10.15.3-stretch-slim
EXPOSE 8080
COPY server.js .
CMD node server.js
