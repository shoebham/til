### Category mysql

---

 - [Display Output In A Vertical Format](#display-output-in-a-vertical-format)
 - [Doing Date Math](#doing-date-math)
 - [Dump A Database To A File](#dump-a-database-to-a-file)
 - [List Databases And Tables](#list-databases-and-tables)
 - [Show Create Statement For A Table](#show-create-statement-for-a-table)
 - [Show Tables That Match A Pattern](#show-tables-that-match-a-pattern)
 - [Show Indexes For A Table](#show-indexes-for-a-table)

---

# Display Output In A Vertical Format

Output for tables with lots of columns can be hard to read and sometimes
overflow the terminal window. Consider the output from [Show Indexes For A
Table](show-indexes-for-a-table.md):

```sql
> show indexes in users;
+-------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+-------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| users |          0 | PRIMARY      |            1 | id          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| users |          0 | unique_email |            1 | email       | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+-------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
```

We can vertically orient the output of a statement by terminating it with
`\G` instead of `;` (or `\g`).

```sql
> show indexes in users\G
*************************** 1. row ***************************
        Table: users
   Non_unique: 0
     Key_name: PRIMARY
 Seq_in_index: 1
  Column_name: id
    Collation: A
  Cardinality: 0
     Sub_part: NULL
       Packed: NULL
         Null:
   Index_type: BTREE
      Comment:
Index_comment:
*************************** 2. row ***************************
        Table: users
   Non_unique: 0
     Key_name: unique_email
 Seq_in_index: 1
  Column_name: email
    Collation: A
  Cardinality: 0
     Sub_part: NULL
       Packed: NULL
         Null:
   Index_type: BTREE
      Comment:
Index_comment:
```

# Doing Date Math

MySQL has an array of functions for interacting with `date` and `datetime`
values. If you'd like to do math with a date to compute a date in the future
or the past, you can use the
[`DATE_ADD()`](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_date-add)
and
[`DATE_SUB()`](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html#function_date-sub)
functions.

```mysql
mysql> select now() Now, date_add(now(), interval 10 minute) '10 Minutes Later';
+---------------------+---------------------+
| Now                 | 10 Minutes Later    |
+---------------------+---------------------+
| 2018-10-18 15:53:29 | 2018-10-18 16:03:29 |
+---------------------+---------------------+

mysql> select now() Now, date_sub(now(), interval 9 day) '9 Days Earlier';
+---------------------+---------------------+
| Now                 | 9 Days Earlier      |
+---------------------+---------------------+
| 2018-10-18 15:54:01 | 2018-10-09 15:54:01 |
+---------------------+---------------------+
```

There are equivalent `ADDDATE()` and `SUBDATE()` functions if you prefer.

Check out [the
docs](https://dev.mysql.com/doc/refman/5.5/en/date-and-time-functions.html)
for more details.

# Dump A Database To A File

The `mysqldump` client is a handy tool for creating a backup or snapshot of
a MySQL database. The standard use of this command produces an alphabetical
series of statements that comprise the structure and data of the specified
database. It directs all of this to `stdout`. You'll likely want to redirect
it to a file.

```bash
$ mysqldump my_database > my_database_backup.sql
```

The output will include special comments with MySQL directives that disable
things like constraint checking. This is what allows the output to be in
alphabetical order without necessarily violating any foreign key
constraints.

If you need to dump multiple databases, include the `--databases` flag with
a space-separated list of database names. Or dump all of them with
`--all-databases`.

See `man mysqldump` for more details.

# List Databases And Tables

If you've started a [mysql](https://dev.mysql.com/) session, but haven't
connected to a particular database yet, you can list the available databases
like so:

```sql
> show databases;
+-----------------------------+
| Database                    |
+-----------------------------+
| information_schema          |
| my_app_dev                  |
+-----------------------------+
```

If you are curious about the tables in a particular database, you can list
them by specifying the database's name:

```sql
> show tables in my_app_dev;
+------------------------------+
| Tables_in_my_app_dev         |
+------------------------------+
| pokemons                     |
| trainers                     |
+------------------------------+
```

Alternatively, you can connect to the database of interest and then there is
no need to specify the name of the database going forward.

```sql
> use my_app_dev;
> show tables;
+------------------------------+
| Tables_in_my_app_dev         |
+------------------------------+
| pokemons                     |
| trainers                     |
+------------------------------+
```

# Show Create Statement For A Table

In MySQL, you can get a quick rundown of a table using `describe users`. An
alternative to this approach is to have MySQL show the `create` statement
for a table.

```sql
> show create table users\G
*************************** 1. row ***************************
       Table: users
Create Table: CREATE TABLE `users` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) NOT NULL,
  `email` varchar(80) NOT NULL,
  `middle_initial` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1
```

This includes some additional information like primary key and index
information. It is also a great way to study the SQL that it takes to create
all the facets of a table.

See the [`show create table`
docs](https://dev.mysql.com/doc/refman/5.7/en/show-create-table.html) for
more details.

h/t Jake Worth

# Show Tables That Match A Pattern

An unfamiliar database with tons of tables can be a difficult thing to
navigate. You may have an idea of the kind of table you are looking for
based on a domain concept you've seen elsewhere.

You can pare down the results returned by `show tables` by including a
`like` clause with a pattern. For example, this statement will show me only
tables that have the word `user` in them:

```sql
> show tables like '%user%';
+-------------------------------+
| Tables_in_jbranchaud (%user%) |
+-------------------------------+
| admin_users                   |
| users                         |
+-------------------------------+
```

# Show Indexes For A Table

When describing a table, such as the table `users`:

```sql
> describe users;
+------------+-----------------------+------+-----+---------+----------------+
| Field      | Type                  | Null | Key | Default | Extra          |
+------------+-----------------------+------+-----+---------+----------------+
| id         | mediumint(8) unsigned | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(80)           | NO   |     | NULL    |                |
| last_name  | varchar(80)           | NO   |     | NULL    |                |
| email      | varchar(80)           | NO   | UNI | NULL    |                |
+------------+-----------------------+------+-----+---------+----------------+
```

I can see in the `Key` column that there is a primary key and a unique key
for this table on `id` and `email`, respectively.

These keys are indexes. To get more details about each of the indexes on
this table, we can use the
[`show indexes`](https://dev.mysql.com/doc/refman/5.7/en/show-index.html)
command.

```sql
> show indexes in users;
+-------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| Table | Non_unique | Key_name     | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment |
+-------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
| users |          0 | PRIMARY      |            1 | id          | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
| users |          0 | unique_email |            1 | email       | A         |           0 |     NULL | NULL   |      | BTREE      |         |               |
+-------+------------+--------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+
```

