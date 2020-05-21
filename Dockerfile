# Use base image
FROM node:alpine as builder
WORKDIR '/app'
#  LOCAL   CONTAINER
COPY package.json .
RUN npm install
COPY . .
# CMD ["npm", "run", "start"]
RUN npm run build


FROM nginx
#  LOCAL   CONTAINER
COPY --from=builder /app/build /usr/share/nginx/html

