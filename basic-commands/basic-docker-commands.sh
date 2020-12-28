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

#create example node.js app
cat > app.js <<EOF
const http = require('http');

const hostname = '0.0.0.0';
const port = 80;

const server = http.createServer((req, res) => {
    res.statusCode = 200;
      res.setHeader('Content-Type', 'text/plain');
        res.end('Hello World\n');
});

server.listen(port, hostname, () => {
    console.log('Server running at http://%s:%s/', hostname, port);
});

process.on('SIGINT', function() {
    console.log('Caught interrupt signal and will exit');
    process.exit();
});
EOF

#build docker app in same directory as dockerfile
docker build -t node-app:0.1 .

#run docker container based on the image built
docker run -p 4000:80 --name my-app node-app:0.1

#test your docker app
curl http://localhost:4000

#stop and remove container app
docker stop my-app && docker rm my-app

#start container app in the background
docker run -p 4000:80 --name my-app -d node-app:0.1

#check docker container logs
docker logs [container_id]

#run another container with new image version
docker run -p 8080:80 --name my-app-2 -d node-app:0.2

#follow the log's output as the container is running
docker logs -f [container_id]