FROM node:alpine as builder

WORKDIR /app

Copy . .

RUN npm install && \
    npm run build 

From nginx:alpine

COPY --from=builder /app/dist/* /usr/share/nginx/html/ 