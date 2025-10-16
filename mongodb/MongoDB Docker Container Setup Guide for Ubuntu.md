<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# MongoDB Docker Container Setup Guide for Ubuntu

This comprehensive guide provides step-by-step instructions for creating and running MongoDB containers in Docker on Ubuntu, along with detailed shell usage instructions and best practices.

![MongoDB Docker Setup Process Flowchart](https://ppl-ai-code-interpreter-files.s3.amazonaws.com/web/direct-files/b711437165202149df2b799f654fb78a/65ab9238-c316-4920-8d48-76be8354bcd9/57e37385.png)

MongoDB Docker Setup Process Flowchart

## Prerequisites and Docker Installation

Before setting up MongoDB in Docker, ensure your Ubuntu system has Docker installed and running. Here are the essential installation steps:[^1]

**Install Docker on Ubuntu:**

```bash
sudo apt update && sudo apt upgrade -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update
sudo apt install docker-ce
```

**Verify Docker installation:**

```bash
sudo systemctl status docker
```


## Basic MongoDB Container Setup

### Method 1: Simple Docker Run Command

The most straightforward way to run MongoDB in a Docker container:[^2]

```bash
docker pull mongo:latest
docker run -d --name mongodb -p 27017:27017 mongo:latest
```

This command:

- Downloads the latest MongoDB image (`docker pull mongo:latest`)
- Creates a container named "mongodb" (`--name mongodb`)
- Runs it in detached mode (`-d`)
- Maps port 27017 from container to host (`-p 27017:27017`)


### Method 2: MongoDB with Authentication

For development environments requiring authentication:[^3]

```bash
docker run -d --name mongodb \
  -p 27017:27017 \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=password123 \
  mongo:latest
```

**Environment variables:**

- `MONGO_INITDB_ROOT_USERNAME`: Sets the admin username
- `MONGO_INITDB_ROOT_PASSWORD`: Sets the admin password


### Method 3: MongoDB with Persistent Storage

To ensure data persistence across container restarts:[^4][^5]

```bash
# Create a named volume
docker volume create mongo-data

# Run MongoDB with persistent storage
docker run -d --name mongodb \
  -p 27017:27017 \
  -v mongo-data:/data/db \
  -e MONGO_INITDB_ROOT_USERNAME=admin \
  -e MONGO_INITDB_ROOT_PASSWORD=password123 \
  mongo:latest
```

The volume mount (`-v mongo-data:/data/db`) ensures that MongoDB data persists even when the container is removed or updated.[^6]

## Docker Compose Configuration

For more complex setups and better management, Docker Compose is recommended:[^1][^7]

### Basic Docker Compose Setup

Create a `docker-compose.yml` file:

```yaml
version: '3.8'
services:
  mongodb:
    image: mongo:latest
    container_name: mongodb
    restart: always
    ports:
      - "27017:27017"
    environment:
      MONGO_INITDB_ROOT_USERNAME: admin
      MONGO_INITDB_ROOT_PASSWORD: password123
    volumes:
      - mongo-data:/data/db
      - mongo-config:/data/configdb
    networks:
      - mongodb-network

volumes:
  mongo-data:
    driver: local
  mongo-config:
    driver: local

networks:
  mongodb-network:
    driver: bridge
```

**Start the MongoDB container:**

```bash
docker-compose up -d
```


### Production-Ready Configuration

For production environments, include additional security and monitoring features:[^1]

```yaml
version: '3.8'
services:
  mongodb:
    image: mongo:6.0
    container_name: mongodb
    restart: unless-stopped
    ports:
      - "127.0.0.1:27017:27017"  # Bind to localhost only
    environment:
      MONGO_INITDB_ROOT_USERNAME: ${MONGO_USERNAME}
      MONGO_INITDB_ROOT_PASSWORD: ${MONGO_PASSWORD}
      MONGO_INITDB_DATABASE: ${MONGO_DATABASE}
    volumes:
      - mongo-data:/data/db
      - mongo-config:/data/configdb
    healthcheck:
      test: echo 'db.runCommand("ping").ok' | mongosh localhost:27017/test --quiet
      interval: 30s
      timeout: 10s
      retries: 3
    networks:
      - mongodb-network

  mongo-express:
    image: mongo-express
    container_name: mongo-express
    restart: unless-stopped
    ports:
      - "8081:8081"
    environment:
      ME_CONFIG_MONGODB_SERVER: mongodb
      ME_CONFIG_MONGODB_ADMINUSERNAME: ${MONGO_USERNAME}
      ME_CONFIG_MONGODB_ADMINPASSWORD: ${MONGO_PASSWORD}
      ME_CONFIG_BASICAUTH_USERNAME: admin
      ME_CONFIG_BASICAUTH_PASSWORD: admin123
    depends_on:
      - mongodb
    networks:
      - mongodb-network

volumes:
  mongo-data:
  mongo-config:

networks:
  mongodb-network:
    driver: bridge
```


## Accessing MongoDB Shell

### Connecting to MongoDB Shell

Once your MongoDB container is running, you can access the MongoDB shell using several methods:[^8]

**Method 1: Direct shell access (for containers without authentication):**

```bash
docker exec -it mongodb mongosh
```

**Method 2: With authentication:**

```bash
docker exec -it mongodb mongosh -u admin -p password123 --authenticationDatabase admin
```

**Method 3: For containers with custom connection parameters:**

```bash
docker exec -it mongodb mongosh --host localhost --port 27017 -u admin -p password123 --authenticationDatabase admin
```


### Authentication Database Specification

When using the root user created with environment variables, you must specify `authSource=admin` in your connection string. This is because the root user is created in the admin database:[^9]

```bash
# Correct connection string
mongosh "mongodb://admin:password123@localhost:27017/myproject?authSource=admin"
```


## Essential MongoDB Commands

### Database Operations

Once connected to the MongoDB shell, here are the fundamental commands:

**Basic database operations:**

```javascript
// List all databases
show dbs

// Switch to a specific database (creates it if it doesn't exist)
use myapp

// Get current database name
db.getName()

// Drop the current database
db.dropDatabase()
```


### Collection Operations

```javascript
// Show all collections in current database
show collections

// Create a collection
db.createCollection("users")

// Get collection statistics
db.users.stats()

// Drop a collection
db.users.drop()
```


### Document Operations

```javascript
// Insert documents
db.users.insertOne({name: "John Doe", email: "john@example.com", age: 30})
db.users.insertMany([
  {name: "Jane Smith", email: "jane@example.com", age: 25},
  {name: "Bob Wilson", email: "bob@example.com", age: 35}
])

// Find documents
db.users.find()                          // Find all
db.users.find({age: {$gte: 30}})         // Find users 30 or older
db.users.findOne({name: "John Doe"})     // Find one document

// Update documents
db.users.updateOne(
  {name: "John Doe"},
  {$set: {age: 31, city: "New York"}}
)

db.users.updateMany(
  {age: {$lt: 30}},
  {$set: {status: "young"}}
)

// Delete documents
db.users.deleteOne({name: "John Doe"})
db.users.deleteMany({age: {$lt: 25}})
```


### User Management

For databases with authentication enabled:

```javascript
// Create a new user with specific privileges
db.createUser({
  user: "appuser",
  pwd: "apppassword",
  roles: [
    {role: "readWrite", db: "myapp"},
    {role: "read", db: "logs"}
  ]
})

// List all users
db.getUsers()

// Drop a user
db.dropUser("appuser")
```


### Administrative Commands

```javascript
// Check server status
db.serverStatus()

// Get MongoDB version
db.version()

// Check connection status
db.runCommand({connectionStatus: 1})

// Get database statistics
db.stats()

// Exit the shell
exit
```


## Data Persistence and Volume Management

### Understanding Docker Volumes

MongoDB requires persistent storage to maintain data across container restarts. Docker provides several volume options:[^4][^5]

**Named volumes (recommended):**

```bash
docker volume create mongodb-data
docker run -d --name mongodb -v mongodb-data:/data/db mongo:latest
```

**Bind mounts (for direct file access):**

```bash
mkdir -p /home/user/mongodb-data
docker run -d --name mongodb -v /home/user/mongodb-data:/data/db mongo:latest
```


### Volume Best Practices

1. **Always use persistent storage** for production MongoDB containers[^6]
2. **Backup volumes regularly** using Docker volume backup techniques[^5]
3. **Monitor disk usage** as MongoDB data can grow significantly
4. **Use named volumes** for better portability and management

### Backup and Restore Operations

**Create a backup:**

```bash
# Create backup directory
mkdir -p ./mongodb-backup

# Backup using mongodump inside container
docker exec mongodb mongodump --out /tmp/backup
docker cp mongodb:/tmp/backup ./mongodb-backup/
```

**Restore from backup:**

```bash
docker cp ./mongodb-backup mongodb:/tmp/restore
docker exec mongodb mongorestore /tmp/restore
```


## Container Management Commands

### Essential Docker Commands for MongoDB

**Check container status:**

```bash
docker ps -a                    # List all containers
docker logs mongodb             # View container logs
docker stats mongodb            # View resource usage
```

**Start, stop, and restart:**

```bash
docker start mongodb            # Start stopped container
docker stop mongodb             # Stop running container
docker restart mongodb          # Restart container
```

**Container maintenance:**

```bash
docker exec -it mongodb bash    # Access container shell
docker inspect mongodb          # Get detailed container info
docker rm mongodb               # Remove container (stops if running)
```


## Troubleshooting Common Issues

### Connection Problems

**Issue: Cannot connect to MongoDB from host**

- **Solution**: Ensure port mapping is correct (`-p 27017:27017`)
- **Check**: Container is running (`docker ps`)
- **Verify**: No other service is using port 27017

**Issue: Authentication failed**

- **Solution**: Use correct authentication database (`--authenticationDatabase admin`)
- **Check**: Environment variables are set correctly
- **Verify**: Password and username match container configuration


### Data Persistence Issues

**Issue: Data disappears after container restart**

- **Solution**: Ensure volume is properly mounted to `/data/db`
- **Check**: Volume exists (`docker volume ls`)
- **Verify**: Volume mount path is correct in container


### Performance Considerations

**Resource limits for production:**

```bash
docker run -d --name mongodb \
  --memory=2g \
  --cpus=2 \
  -p 27017:27017 \
  -v mongo-data:/data/db \
  mongo:latest
```


## Security Best Practices

### Network Security

1. **Bind to localhost only** in production: `-p 127.0.0.1:27017:27017`
2. **Use Docker networks** to isolate MongoDB containers
3. **Implement firewall rules** to restrict access
4. **Use TLS encryption** for production deployments

### Authentication Security

```bash
# Strong password generation
openssl rand -base64 32

# User with minimal privileges
db.createUser({
  user: "readonly",
  pwd: "strong_password_here",
  roles: [{role: "read", db: "myapp"}]
})
```


### Container Security

1. **Run containers as non-root user** when possible
2. **Keep MongoDB images updated** regularly
3. **Use specific version tags** instead of `latest` in production
4. **Implement health checks** for monitoring

## Advanced Configuration Options

### Custom MongoDB Configuration

Create a custom `mongod.conf` file and mount it:

```yaml
# docker-compose.yml
services:
  mongodb:
    image: mongo:latest
    volumes:
      - ./mongod.conf:/etc/mongod.conf
      - mongo-data:/data/db
    command: mongod --config /etc/mongod.conf
```


### Replica Set Configuration

For high availability setups:

```bash
docker run -d --name mongo-replica \
  -p 27017:27017 \
  mongo:latest --replSet myReplicaSet
```This comprehensive guide provides everything needed to successfully deploy and manage MongoDB containers in Docker on Ubuntu systems. The combination of proper volume management, authentication setup, and shell command knowledge ensures robust database operations in containerized environments.
<span style="display:none">[^10][^11][^12][^13][^14][^15][^16][^17][^18][^19][^20][^21][^22][^23][^24][^25][^26][^27][^28][^29][^30][^31][^32][^33][^34][^35][^36][^37]</span>

<div align="center">⁂</div>

[^1]: https://www.bmc.com/blogs/mongodb-docker-container/
[^2]: https://earthly.dev/blog/mongodb-docker/
[^3]: https://stackoverflow.com/questions/34559557/how-to-enable-authentication-on-mongodb-through-docker
[^4]: https://betterprogramming.pub/persistent-databases-using-dockers-volumes-and-mongodb-9ac284c25b39
[^5]: https://docs.docker.com/engine/storage/volumes/
[^6]: https://www.upgrad.com/blog/how-to-use-mongodb-docker/
[^7]: https://collabnix.com/how-to-run-mongodb-with-docker-and-docker-compose-a-step-by-step-guide/
[^8]: https://stackoverflow.com/questions/32944729/how-to-start-a-mongodb-shell-in-docker-container
[^9]: https://dt.in.th/MongoDBAuthSource
[^10]: https://phoenixnap.com/kb/docker-mongodb
[^11]: https://www.youtube.com/watch?v=xBbSR7xU2Yw
[^12]: https://hub.docker.com/r/alpine/mongosh
[^13]: https://blog.devops.dev/mongodb-setup-101-from-containers-to-compass-for-absolute-beginners-af80b47746b5
[^14]: https://www.mongodb.com/docs/manual/tutorial/install-mongodb-enterprise-with-docker/
[^15]: https://www.mongodb.com/compatibility/docker
[^16]: https://www.cherryservers.com/blog/install-mongodb-ubuntu-2404
[^17]: https://hub.docker.com/_/mongo
[^18]: https://www.mongodb.com/docs/mongodb-shell/install/
[^19]: https://stackoverflow.com/questions/45449260/installing-mongodb-in-a-docker-container
[^20]: https://hub.docker.com/_/mongo-express
[^21]: https://www.mongodb.com/docs/mongodb-shell/
[^22]: https://www.mongodb.com/community/forums/t/failing-to-setup-community-docker-container/287314
[^23]: https://www.mongodb.com/docs/atlas/cli/current/atlas-cli-deploy-docker/
[^24]: https://hub.docker.com/r/rtsp/mongosh
[^25]: https://forums.docker.com/t/how-mongodb-work-in-docker-how-to-connect-with-mongodb/44763
[^26]: https://hub.docker.com/r/bitnami/mongodb
[^27]: https://www.librechat.ai/docs/configuration/mongodb/mongodb_auth
[^28]: https://zacfukuda.com/blog/docker-compose-nodejs-mongodb-2024
[^29]: https://digitizedliving.com/2023/03/development/docker/initiate-your-mongodb-container-with-env-environment-variables/
[^30]: https://stackoverflow.com/questions/52302770/mongo-db-persistence-in-docker-with-volumes
[^31]: https://blog.devops.dev/how-i-install-mongodb-in-docker-a-quick-hands-on-guide-c94207c93680
[^32]: https://github.com/docker-library/mongo/issues/715
[^33]: https://stackoverflow.com/questions/42912755/how-to-create-a-db-for-mongodb-container-on-start-up
[^34]: https://www.mongodb.com/community/forums/t/configure-remote-access-to-mongodb-running-on-docker-with-replica-set-on-ubuntu/14042
[^35]: https://www.mongodb.com/community/forums/t/docker-container-doesnt-initialize-default-databases-when-using-environment-variables/123578
[^36]: https://forums.docker.com/t/create-new-database-in-mongodb-with-docker-compose/58306
[^37]: https://www.mongodb.com/community/forums/t/proper-way-of-backing-up-a-docker-volume-used-by-mongodb/244728```

