# this file is useful for the deployment to the outside world..
# Build phase

FROM node:alpine
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
# run phase     
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

