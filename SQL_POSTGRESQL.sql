--Schema: A relational database requires a schema that defines its structure—tables, columns, data types, constraints, and relationships.
--Primary Keys: Unique identifiers for each row in a table. They are essential for data integrity and are used to relate records between tables via foreign keys.
--Foreign Keys: References to primary keys in another table, used to link related data across tables.
--Relationships: By connecting tables through primary and foreign keys, you can structure normalized data and perform meaningful queries.
--Entity Relationship Diagrams (ERDs): Visualize how entities (tables) relate to each other in a database schema.
--Data Integrity: Enforced using keys and data types. Ensures consistency and accuracy of stored data.

--Queries: Requests to retrieve specific data from the database.
SELECT * 
  FROM dogs 
  WHERE age < 3; 
--WHERE clause: Filter results based on conditions. Use comparison operators like <, =, >, etc.
--Select with ORDER BY: Retrieve and sort results based on a column.
SELECT columns 
  FROM table_name 
  ORDER BY column_name;

--CREATE TABLE Statement: This statement is used to create a new table in a database.
CREATE TABLE first_table ();
--ALTER TABLE ADD COLUMN Statement: This statement is used to add a column to an existing table.
ALTER TABLE table_name
  ADD COLUMN column_name DATATYPE;
--ALTER TABLE DROP COLUMN Statement: This statement is used to drop a column from an existing table.
ALTER TABLE table_name
  DROP COLUMN column_name;
--ALTER TABLE RENAME COLUMN Statement: This statement is used to rename a column in a table.
ALTER TABLE table_name
  RENAME COLUMN column_name TO new_name;
--DROP TABLE Statement: This statement is used to drop an entire table from the database.
DROP TABLE table_name;
--ALTER DATABASE RENAME Statement: This statement is used to rename a database.
ALTER DATABASE database_name
  RENAME TO new_database_name;
--DROP DATABASE Statement: This statement is used to drop an entire database.
DROP DATABASE database_name;

--ALTER TABLE ADD COLUMN with Constraint: This statement is used to add a column with a constraint to an existing table.
ALTER TABLE table_name
  ADD COLUMN column_name DATATYPE constraint;
--NOT NULL constraint: This constraint ensures that a column cannot have null values
column_name varchar(50) NOT NULL
--ALTER TABLE ADD PRIMARY KEY Statement: This statement is used to add a primary key constraint to a table.
ALTER TABLE table_name
  ADD PRIMARY KEY(column_name);
--ALTER TABLE DROP CONSTRAINT Statement: This statement is used to drop a constraint from a table.
ALTER TABLE table_name 
  DROP CONSTRAINT constraint_name;
--ALTER TABLE ADD COLUMN with Foreign Key: This statement is used to add a foreign key column that references another table.
ALTER TABLE table_name
  ADD COLUMN column_name DATATYPE 
  REFERENCES referenced_table_name(referenced_column_name);
--ALTER TABLE ADD UNIQUE Statement: This statement is used to add a UNIQUE constraint to a column.
ALTER TABLE table_name
  ADD UNIQUE (column_name);
--ALTER TABLE ALTER COLUMN SET NOT NULL Statement: This statement is used to set a NOT NULL constraint on an existing column.
ALTER TABLE table_name
  ALTER COLUMN column_name SET NOT NULL;
--INSERT Statement with NULL Values: This statement demonstrates how to insert NULL values into a table.
INSERT INTO table_name(column_a) VALUES(NULL);
INSERT INTO table_name(column_b) VALUES('value'); --if column allows nulls
--Composite Primary Key: This constraint defines a primary key that consists of multiple columns.
CREATE TABLE course_enrollments (
  student_id INT,
  course_id INT,
  PRIMARY KEY (student_id, course_id)
  );

--INSERT Statement: This statement is used to insert a single row into a table.
INSERT INTO table_name
VALUES
('Gino', 3);
--INSERT Statement with Multiple Rows: This statement is used to insert multiple rows into a table in a single operation.
INSERT INTO table_name
VALUES
('Gino', 3),
('Nora', 2);
--UPDATE Statement: This statement is used to update existing data in a table based on a condition.
UPDATE table_name
  SET column_name=new_value
  where condition;
--DELETE Statement: This statement is used to delete rows from a table based on a condition.
DELETE FROM table_name
  WHERE condition;

--NUMERIC Data Type: This data type is used to store precise decimal numbers with a specified precision and scale.
price NUMERIC(10, 2)
--TEXT Data Type: This data type is used to store variable-length character strings with no specific length limit.
column_name TEXT
--INTEGER Data Type: This data type is used to store whole numbers without decimal places.
units_sold INTEGER
--SMALLINT and BIGINT Data Types: These are variants of INTEGER with smaller and larger ranges respectively.
--SERIAL Data Type: This data type is used to create auto-incrementing integer columns in PostgreSQL.
id SERIAL
--VARCHAR Data Type: This data type is used to store variable-length character strings with a specified maximum length.
name VARCHAR(50)
--DATE Data Type: This data type is used to store date values (year, month, day).
event_date DATE
--TIME Data Type: This data type is used to store time values (hour, minute, second).
start_time TIME
--TIMESTAMP Data Type: This data type is used to store date and time values, optionally with time zone information.
event_timestamp TIMESTAMP
event_timestamp TIMESTAMP WITH TIME ZONE
--BOOLEAN Data Type: This data type is used to store true/false values.
is_active BOOLEAN

--Database Relationships
--These are the different ways tables can be related to each other in a relational database.
--One-to-one: each record in one table corresponds to exactly one record in another table.
--One-to-many: one record in a table can be associated with multiple records in another table.
--Many-to-one
--Many-to-many: This relationship type is implemented using a junction table that contains foreign keys from both related tables.
CREATE TABLE book_authors (
  author_id INT REFERENCES authors(id),
  book_id INT REFERENCES books(id)
);
--Self-referencing (recursive)

--Advanced SQL (Joins)
--INNER JOIN Statement: This join returns only the rows that have matching values in both tables.
SELECT *
FROM products
INNER JOIN sales ON products.product_id = sales.product_id;

--FULL OUTER JOIN Statement: This join returns all rows from both tables, including unmatched rows from either table.
SELECT *
FROM products
FULL OUTER JOIN sales ON products.product_id = sales.product_id;

--LEFT OUTER JOIN Statement: This join returns all rows from the left table and matching rows from the right table.
SELECT *
FROM products
LEFT JOIN sales ON products.product_id = sales.product_id;

--RIGHT OUTER JOIN Statement: This join returns all rows from the right table and matching rows from the left table.
SELECT *
FROM products
RIGHT JOIN sales ON products.product_id = sales.product_id;

--SELF JOIN Statement: This join is used to join a table with itself to compare rows within the same table.
SELECT A.column_name, B.column_name
FROM table_name A
JOIN table_name B ON A.related_column = B.related_column;

--CROSS JOIN Statement: This join returns the Cartesian product of two tables, combining every row from the first table with every row from the second table.
SELECT *
FROM table1
CROSS JOIN table2;

  







