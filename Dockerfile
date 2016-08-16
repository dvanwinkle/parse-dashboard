FROM node:4.4.2
# File Author / Maintainer
MAINTAINER Dan VanWinkle <dan.vanwinkle@krush.com>

# Provides cached layer for node_modules
ADD package.json /tmp/package.json
RUN cd /tmp && \
    npm install && \
    npm cache clear && \
    mkdir -p /src && \
    cp -a /tmp/node_modules /src/ && \
    cp /tmp/package.json /src && \
    rm -rf /tmp/* && \
    rm -rf ~/.npm && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /src
ADD . /src
RUN cd /src && \
    npm run build && \
    npm cache clear && \
    rm -rf ~/.npm && \
    rm -rf /var/lib/apt/lists/*

CMD ["npm", "run", "start"]
