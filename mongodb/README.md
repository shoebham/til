### Category mongodb

---

 - [Determine The Database Version](#determine-the-database-version)
 - [Dump A Remote Database](#dump-a-remote-database)
 - [Get Size Stats For A Collection](#get-size-stats-for-a-collection)
 - [List Size Stats For All Collections](#list-size-stats-for-all-collections)

---

# Determine The Database Version

Whether your Mongo database is local or remote, you should connect to it using
the [`mongo` CLI](https://docs.mongodb.com/manual/mongo/).

Once connected, you can issue the following query:

```
db.version()
```

This will output the version of your Mongo database.

[source](https://docs.mongodb.com/manual/reference/method/db.version/)

# Dump A Remote Database

Here is a single-line script for dumping a remote mongo database. This will
dump it to your local filesystem in a binary format (`.bson`) that you can then
restore to another mongo instance.

Create a file like this called `mongdump-cmd` and replace the various
placeholder values (e.g. `<HOST>`) with valid values for your remote mongo
instance.

```bash
mongodump --host '<HOST>:<PORT>' \
          --ssl \
          --username '<USER>' \
          --password '<PASSWORD>' \
          --authenticationDatabase 'admin' \
          --out ./mongo-backups/<DATE>-dump
```

Create the backup directory:

```bash
$ mkdir mongo-backups
```

Then execute the bash script:

```bash
$ bash mongodump-cmd
```

This will dump everything on the remote instance into the
`mongo-backups/2020-06-20-dump/` directory. You can also include the `--db`
flag to dump a specific database.

This can later be used with `mongoresetore` to restore the data to the mongo
instance you specify.

# Get Size Stats For A Collection

For any collection in your MongoDB instance.

```javascript
> db.getCollectionNames()
["books", "authors", "genres"]
```

You can list a collection of stats, which include the amount of disk space that
collection is utilizing.

```javascript
> db.books.stats().size
11057056
```

By default this size is in bytes, which isn't all that human-readable of a
value.

By passing in a `scale` value to `stats()`, you can get a value that is a bit
more understandable. A scale of `1024` would give you kilobytes, so a scale of
`1024 * 1024` would give you megabytes.

```javascript
> db.books.stats({ scale: 1024 * 1024 }).size
10
```

[source](https://docs.mongodb.com/manual/reference/method/db.collection.stats/)

# List Size Stats For All Collections

In [Get Size Stats for a Collection](get-size-stats-for-a-collection.md), we
saw how to use `db.collection.stats()` and its `scale` parameter to get a
useful size metric for a given collection.

We can combine some of this concepts with some scripting to list human-readable
size metrics for all of our database's collections:

```javascript
> db.getCollectionNames().forEach(function (collectionName) {
    sizeInMb = db[collectionName].stats({ scale: 1024 * 1024 }).size;
    print(collectionName + ": " + sizeInMb + "MB");
  })
books: 10MB
authors: 2MB
genres: 1MB
```

This snippet gets all the collections for the current database and iterates
over them. For each collection name, it looks up the `size` stat for that
collection scaled to megabytes and then prints it all out with some contextual
information.

[source](https://docs.mongodb.com/manual/faq/storage/#data-storage-diagnostics)

