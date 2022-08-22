FROM node:14 AS builder
WORKDIR /app
COPY ./package*.json /app/
COPY ./yarn.lock /app/
RUN yarn
COPY ./nest-cli.json /app/
COPY . /app/
RUN yarn build

# FROM node:16-alpine
# WORKDIR /app
# COPY ./ormconfig.js ./
# COPY --from=builder /app/dist ./
# COPY --from=builder /app/package.json ./
# # If the same version as yarn.lock is not specified in the typeorm, an error occurs when deploying.
# RUN yarn add typeorm@0.2.43
CMD ["yarn", "start:prod"]
