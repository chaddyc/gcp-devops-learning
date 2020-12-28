#check if docker works correctly
docker run hello-world

#check docker version
docker --version

#display docker images pulled
docker images

#view running docker containers
docker ps

#view all docker containers
docker ps -a

#create a docker file
cat > Dockerfile <<EOF
# Use an official Node runtime as the parent image
FROM node:6

# Set the working directory in the container to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Make the container's port 80 available to the outside world
EXPOSE 80

# Run app.js using node when the container launches
CMD ["node", "app.js"]
EOF

