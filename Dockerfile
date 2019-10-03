FROM node:alpine

RUN sed -i 's=/v3.*/=/v3.10/=g' /etc/apk/repositories
RUN apk -U upgrade

ADD ./ /usr/src/app
WORKDIR /usr/src/app
USER root
# RUN apk add --update libc6-compat
COPY . .
RUN rm -rf node_modules \
    && yarn 

RUN npm run build

EXPOSE 3000 9229 4545 5433
# CMD ./scripts/start.sh
CMD ["yarn", "dev"]