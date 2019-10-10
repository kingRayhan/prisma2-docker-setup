FROM node:10

RUN apt-get update && apt-get install -y build-essential && apt-get install -y python

WORKDIR /usr/src/app

# RUN apk add --update libc6-compat
COPY ./package.json ./
COPY ./yarn.lock ./
COPY ./prisma ./
RUN yarn 

COPY . .

# CMD ./scripts/start.sh
CMD ["yarn", "dev"]