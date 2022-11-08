FROM node:16
# Installing libvips-dev for sharp Compatability
RUN apt-get update && apt-get install libvips-dev -y
ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}
WORKDIR /opt/
COPY ./package.json ./package-lock.json ./
ENV PATH /opt/node_modules/.bin:$PATH
RUN npm install
WORKDIR /opt/app
COPY ./ .
RUN npm run build
EXPOSE 1337
CMD ["npm", "run", "develop"]

# First, we get a node image 16 (We can use :14) if we wanted to use version 14 of node instead.
# We are setting an argument as default to develop as we want to not have to provide this every time we run our setup. The ENV is a way to override it if we want to like production
# WORKDIR we are creating a folder inside our container 🚀 where our node_modules will live
# We copy package.json and yarn.lock (or package-lock.json if you use npm) into our work directory. We do this FIRST as 🐳 docker caches each layer and this will then speed up our build process. Unless the file changes. 📝
# We then tell Docker where to look for our node_modules
# In case we have some network issues or a bit of slow internet we are setting a large timeout to give it some extra time.
# We then run yarn install to install all dependencies.
# We then change directories into /opt/app
# We then copy the project that we created first into this folder.
# Then we run yarn build to build our strapi project.
# At the end, we expose the port 1337 and tell Docker to run yarn develop

# https://blog.dehlin.dev/docker-with-strapi-v4

# npx @strapi-community/dockerize