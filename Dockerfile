# Use base image
FROM node:alpine as builder
WORKDIR '/app'

#  LOCAL   CONTAINER
COPY package*.json ./
RUN npm install

COPY . .
# CMD ["npm", "run", "start"]
RUN npm run build

# New Image
FROM nginx
EXPOSE 80
#  LOCAL   CONTAINER

#COPY --from=builder /app/build /usr/share/nginx/html
COPY --from=0 /app/build /usr/share/nginx/html
