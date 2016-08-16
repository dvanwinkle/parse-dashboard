FROM node:4.4.2
EXPOSE 4040
WORKDIR /src
ADD . /src
RUN cd /src \
 && npm install \
 && npm run build \
 && npm cache clear \
 && rm -rf ~/.npm \
 && rm -rf /var/lib/apt/lists/*
RUN ["npm", "run", "build"]
CMD ["npm", "run", "start"]
