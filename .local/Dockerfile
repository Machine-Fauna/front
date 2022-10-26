FROM node:18.11

# Setup workdir
WORKDIR /app

# Install app dependencies
COPY package.json ./
RUN npm install --dev

# Setup runtime
EXPOSE 3000
ENTRYPOINT ["npm", "start"]