<img src="https://r2cdn.perplexity.ai/pplx-full-logo-primary-dark%402x.png" style="height:64px;margin-right:32px"/>

# MongoDB Essential Commands - Complete Reference Guide

## Database Operations

### Connect and Show Databases

```bash
# Connect to MongoDB
mongo
mongo --host <hostname> --port <port> -u <username> -p <password>

# Show all databases
show dbs

# Show current database
db

# Create or switch to database
use <database_name>

# Drop current database
db.dropDatabase()
```


## Collection Operations

### Basic Collection Commands

```bash
# Create collection
db.createCollection('<collection_name>')

# Show all collections
show collections

# Get collection names programmatically
db.getCollectionNames()

# Drop a collection
db.<collection_name>.drop()
```


## CRUD Operations

### CREATE Operations

```javascript
// Insert single document
db.<collection>.insertOne({
    name: "John Doe",
    age: 30,
    email: "john@example.com"
})

// Insert multiple documents
db.<collection>.insertMany([
    { name: "Alice", age: 25, city: "New York" },
    { name: "Bob", age: 32, city: "London" },
    { name: "Charlie", age: 28, city: "Paris" }
])

// Legacy insert method
db.<collection>.insert({ name: "Jane", age: 27 })
```


### READ Operations

```javascript
// Find all documents
db.<collection>.find()

// Find with pretty formatting
db.<collection>.find().pretty()

// Find one document
db.<collection>.findOne()

// Find with filter
db.<collection>.find({ age: 30 })
db.<collection>.find({ age: { $gt: 25 } })

// Find with projection (select specific fields)
db.<collection>.find({}, { name: 1, age: 1, _id: 0 })

// Find with sorting
db.<collection>.find().sort({ age: 1 })  // Ascending
db.<collection>.find().sort({ age: -1 }) // Descending

// Find with limit
db.<collection>.find().limit(5)

// Find with skip
db.<collection>.find().skip(10)
```


### UPDATE Operations

```javascript
// Update single document
db.<collection>.updateOne(
    { name: "John Doe" },
    { $set: { age: 31 } }
)

// Update multiple documents
db.<collection>.updateMany(
    { city: "New York" },
    { $set: { country: "USA" } }
)

// Replace entire document
db.<collection>.replaceOne(
    { name: "John Doe" },
    { name: "John Smith", age: 35, email: "john.smith@example.com" }
)

// Update with upsert (insert if not found)
db.<collection>.updateOne(
    { name: "New User" },
    { $set: { age: 25 } },
    { upsert: true }
)

// Find and modify
db.<collection>.findOneAndUpdate(
    { name: "Alice" },
    { $set: { age: 26 } },
    { returnNewDocument: true }
)
```


### DELETE Operations

```javascript
// Delete single document
db.<collection>.deleteOne({ name: "John Doe" })

// Delete multiple documents
db.<collection>.deleteMany({ age: { $lt: 25 } })

// Find and delete
db.<collection>.findOneAndDelete({ name: "Alice" })

// Remove all documents (but keep collection)
db.<collection>.deleteMany({})
```


## Query Operators

### Comparison Operators

```javascript
// Equal
db.<collection>.find({ age: 30 })

// Not equal
db.<collection>.find({ age: { $ne: 30 } })

// Greater than
db.<collection>.find({ age: { $gt: 25 } })

// Greater than or equal
db.<collection>.find({ age: { $gte: 25 } })

// Less than
db.<collection>.find({ age: { $lt: 40 } })

// Less than or equal
db.<collection>.find({ age: { $lte: 40 } })

// In array
db.<collection>.find({ city: { $in: ["New York", "London"] } })

// Not in array
db.<collection>.find({ city: { $nin: ["Paris", "Tokyo"] } })
```


### Logical Operators

```javascript
// AND
db.<collection>.find({ 
    $and: [
        { age: { $gte: 25 } },
        { city: "New York" }
    ]
})

// OR
db.<collection>.find({
    $or: [
        { age: { $lt: 25 } },
        { city: "London" }
    ]
})

// NOT
db.<collection>.find({ age: { $not: { $gte: 30 } } })

// NOR
db.<collection>.find({
    $nor: [
        { age: { $lt: 25 } },
        { city: "Paris" }
    ]
})
```


## Indexing Operations

### Index Management

```javascript
// Create single field index
db.<collection>.createIndex({ username: 1 })

// Create compound index
db.<collection>.createIndex({ name: 1, age: -1 })

// Create unique index
db.<collection>.createIndex({ email: 1 }, { unique: true })

// Create text index
db.<collection>.createIndex({ content: "text" })

// Create sparse index
db.<collection>.createIndex({ phone: 1 }, { sparse: true })

// Get all indexes
db.<collection>.getIndexes()

// Drop index
db.<collection>.dropIndex("username_1")
db.<collection>.dropIndex({ username: 1 })

// Drop all indexes
db.<collection>.dropIndexes()
```


## Aggregation Operations

### Basic Aggregation

```javascript
// Count documents
db.<collection>.count()
db.<collection>.countDocuments({ age: { $gte: 25 } })

// Distinct values
db.<collection>.distinct("city")

// Group by and count
db.<collection>.aggregate([
    { $group: { _id: "$city", count: { $sum: 1 } } }
])

// Match and group
db.<collection>.aggregate([
    { $match: { age: { $gte: 25 } } },
    { $group: { _id: "$city", avgAge: { $avg: "$age" } } }
])

// Sort aggregation results
db.<collection>.aggregate([
    { $group: { _id: "$city", count: { $sum: 1 } } },
    { $sort: { count: -1 } }
])
```


## Database Administration

### User Management

```javascript
// Create user
db.createUser({
    user: "username",
    pwd: "password",
    roles: ["readWrite"]
})

// Show users
db.getUsers()

// Drop user
db.dropUser("username")
```


### Database Statistics

```javascript
// Database stats
db.stats()

// Collection stats
db.<collection>.stats()

// Get collection size
db.<collection>.totalSize()
```

These essential MongoDB commands cover the fundamental operations needed for database management, from basic CRUD operations to advanced querying and indexing. Regular practice with these commands will help build proficiency in MongoDB database administration and development.[^1][^2][^3][^4][^5]
<span style="display:none">[^10][^11][^12][^13][^14][^15][^16][^17][^18][^19][^20][^6][^7][^8][^9]</span>

<div align="center">⁂</div>

[^1]: https://www.mongodb.com/docs/manual/reference/cheatsheet/

[^2]: https://www.mongodb.com/docs/manual/crud/

[^3]: https://www.geeksforgeeks.org/mongodb/mongodb-cheat-sheet/

[^4]: https://gist.github.com/bradtraversy/f407d642bdc3b31681bc7e56d95485b6

[^5]: https://hexmos.com/freedevtools/c/databases/mongodb/

[^6]: https://www.mongodb.com/docs/manual/reference/command/listCollections/

[^7]: https://www.mongodb.com/resources/products/fundamentals/crud

[^8]: https://stackoverflow.com/questions/8866041/how-can-i-list-all-collections-in-the-mongodb-shell

[^9]: https://www.geeksforgeeks.org/mongodb/mongodb-crud-operations/

[^10]: https://www.mongodb.com/docs/manual/core/databases-and-collections/

[^11]: https://www.codewithharry.com/blogpost/mongodb-cheatsheet

[^12]: https://www.scaler.com/topics/crud-operations-in-mongodb/

[^13]: https://www.mongodb.com/docs/manual/reference/method/db.createCollection/

[^14]: https://dev.to/burakboduroglu/mongodb-cheat-sheet-1a6a

[^15]: https://delbridge.solutions/mongodb-crud-operations/

[^16]: https://www.w3schools.com/mongodb/mongodb_mongosh_create_collection.php

[^17]: https://www.mongodb.com/docs/mongodb-vscode/crud-ops/

[^18]: https://studio3t.com/knowledge-base/articles/mongodb-collections-a-complete-guide-and-tutorial/

[^19]: https://www.almabetter.com/bytes/cheat-sheet/mongodb

[^20]: https://dbschema.com/blog/mongodb/mongodb-crud-operations/

