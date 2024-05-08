
# ExpressJS:
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci
COPY . .

CMD ["node", "index.js"]

# Install node-gyp on Node Alpine version:
FROM node:20-alpine

RUN apk add --no-cache \
    make \
    gcc \
    g++ \
    python3 \
    pkgconfig \
    pixman-dev \
    cairo-dev \
    pango-dev \
    libjpeg-turbo-dev \
    giflib-dev

WORKDIR /app

COPY package*.json ./
RUN npm install
COPY . .

CMD ["node", "index.js"]


# Fix by changing `FROM node:20-alpine` to `FROM node:20-buster-slim`:
FROM node:20-buster-slim

WORKDIR /app

COPY package*.json ./
RUN npm ci
COPY . .

CMD ["node", "index.js"]


# NestJS Framework:
FROM node:20-alpine as build

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY --chown=node:node . .
RUN npm run build

RUN npm ci --only=production && npm cache clean --force

USER node

FROM node:20-alpine

WORKDIR /app

COPY --from=build --chown=node:node /app/package*.json ./
COPY --from=build --chown=node:node /app/node_modules ./node_modules
COPY --from=build --chown=node:node /app/dist ./dist

CMD ["node", "dist/main.js"]


