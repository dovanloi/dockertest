FROM node:12.13-alpine

# Set working dir in the container to /
WORKDIR /usr/src/app

# Copy application to / directory and install dependencies
COPY package.json ./
RUN npm config set registry http://registry.npmjs.org
RUN npm install
COPY . .
RUN npm run build

EXPOSE 5001

# what should be executed when the Docker image is launching
CMD ["npm", "run", "start:prod"]
