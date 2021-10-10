FROM node:14 as development

WORKDIR /home/node/app

COPY package*.json  yarn.lock ./

RUN yarn

COPY . .

# RUN yarn prisma generate

FROM development as production

RUN yarn build

EXPOSE ${API_PORT}
