FROM node:18.11 as builder

# Setup workdir
WORKDIR /app

# Install app dependencies
COPY package.json ./
RUN npm install

# Add source code
COPY ./public  public
COPY ./src     src

# Build application
RUN npm run build

# Copy to production image
FROM nginx:1.17-alpine

WORKDIR /var/www

COPY --from=builder /app/dist   ./
COPY ./public                   public
COPY .github/*.conf             /etc/nginx/conf.d/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]