FROM node:lts-alpine3.11
RUN apk add --no-cache \
      chromium \
      nss \
      freetype \
      freetype-dev \
      harfbuzz \
      ca-certificates \
      ttf-freefont --repository=http://dl-cdn.alpinelinux.org/alpine/v3.11/community
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD [ "npm", "start" ]
