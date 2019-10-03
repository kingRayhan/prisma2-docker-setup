FROM node:12.4.0
EXPOSE 3000 9229 4545
WORKDIR /usr/src/app
RUN echo $DATABASE_URL

RUN rm -rf node_modules \
    && npm i -g --unsafe-perm prisma2@2.0.0-alpha.193  \
    && npm install \
    && chown -R node /usr/src/app

RUN prisma2 generate

COPY package.json .
COPY package-lock.json .


COPY . .

RUN npm run build

# CMD ./scripts/start.sh
CMD ["npm", "run", "dev"]