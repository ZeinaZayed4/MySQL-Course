# MySQL Eng. Mohamed Yahia

# 1- Introduction

- MySQL Features:
  - High performance.
  - High availability.
  - Scalability and flexibility run anything.
  - Robust transactional support.
  - Web and data warehouse strengths.
  - Strong data protection.
  - Comprehensive application development.
  - Management ease.
  - Open source freedom and 24 \* 7 support.
  - Lowest total cost of ownership.
- MySQL Storage Engines:
  - A storage engine is a SW module that a DBMS uses to create, read, update data from a database.
  - There are 2 types of storge engines in MySQL:
    - Transactional.
    - Non-transactional.
- MyISAM:
  - is the original storage engine.
  - a fast one.
  - doesn’t support transactions.
  - provides a table-level locking.
  - used mostly in web, data warehousing.
- InnoDB:
  - is the most widely used storage engine with transaction support.
  - an ACID compliant storage engine.
  - supports low-level locking, crash recovery and multi-version concurrency control.
  - is the only engine which provides foreign key referential integrity constraint.
- Memory:
  - creates tables in memory.
  - is the fastest engine.
  - provides table-level locking.
  - doesn’t support transactions.
  - is ideal for creating temporary tables or quick lookups.
  - the data is lost when the database is restarted.
  ```bash
  mysql_secure_installation
  mysql -u root -p
  show databases;
  show engines;
  ```

# 2- DDL

- What is a database?
  - is a collection of information that is organized so that it can easily be accessed, managed, and updated.
  - there’re many types of databases like relational databases and object databases.
  - the most prevalent type is the relational database, a tabular DB in which data is defined so that it can be reorganized and accessed in a number of different ways.
- What is DDL?
  - is a shorthand for Data Definition Language which are MySQL statements or queries used to define and modify the structure of the DB schema or tables.
  - A DB schema is the logical way of grouping the DB components together like tables, views, stored procedures and other components.
  - DDL has these commands: CREATE, ALTER, TRUNCATE, DROP, COMMENT, RENAME.
- The CREATE DATABASE Command:
  - **CREATE DATABASE [IF NOT EXISTS] db_name [create_specifications]**
  - The character set is a set of symbols and their encoding.
  - DBs use these encoding to represent the equivalent symbols.
  - Collation on the other hand is the set of rules to compare these symbols and can vary.
  - Examples:
    ```sql
    CREATE DATABASE company;
    CREATE DATABASE IF NOT EXISTS company;
    CREATE DATABSE company CHARSET SET = utf8 COLLATE = utf8_general_ci;
    ```
    ```bash
    SHOW CHARACTER SET;
    SHOW COLLATION;
    ```
- The ALTRE DATABASE Command:
  - To successfully alter a DB use the following command:
    - **ALTER DATABASE db_name [alter_specifications]**
  - Example:
    ```sql
    ALTER DATABASE company CHARACTER SET DEFAULT COLLATE DEFAULT;
    ```
- The DROP DATABASE Command:
  - To successfully drop a DB from the server simply use the following command:
    - **DROP DATABASE [IF EXISTS] db_name**
  - Example:
    ```sql
    DROP DATABASE IF EXISTS company;
    ```

# 3- Tables and Data Types Part 1

- What is a database table?
  - A table is set of data elements (values) using a model of vertical columns (identifiable by name) and horizontal rows, the cell being the unit where a row and column intersect.
  - A table has specified number of columns, but can have any number of rows.
  - When talking about table columns we must know that each column must have a name and a proper data type.
  - There’s a hard limit of 4096 columns per table, but the effective maximum may be less for a given table. The exact limit depends on several interacting factors.
- Table restrictions:
  - Every table (regardless of storage engine) has a maximum row size of 65535 bytes. Storage engines may place additional constraints on this limit, reducing the effective maximum row size.
  - The maximum row size constraints the number (and possibly size) of columns because the total length of all columns can’t exceed this size. For example.. utf8 characters require up to 3 bytes per character, so far a CHAR(255) CHARACTER SET utf8 column, the server must allocate 255 x 3 = 765 bytes per value. Consequently, a table can’t contain more than 65535 / 765 = 85 such columns.
  - Storage for variable-length columns includes length bytes, which are assessed against the row size. For example.. a VARCHAR(255) CHARACTER SET utf8 column takes 2 bytes to store the length of the value, so each value can take up to 767 bytes.
  - BLOB and TEXT columns count from 1 to 4 plus 8 bytes each toward the row-size limit because their contents are stored separately from the rest of the row.
- MySQL Supported Data Types:
  - **Numeric Data Types:** Bit, BOOL or BOOLEAN, TINYINT, SAMLLINT, MEDIUMINT, INT [INTEGER], BIGINT, DECIMAL [DEC, NUMERIC, FIXED], FLOAT, DOUBLE.
  - **Date and Time Types:** Date, DateTime, Time, TimeStamp, Year.
  - **String Data Types:** CHAR, VARCHAR, TINYTEXT, TEXT, MEDIUMTEXT, LARGETEXT, TINYBLOB, BLOB, MEDIUMBLOB, LARGEBLOB, ENUM, SET.
- Numeric Data Types:
  - **Bit(M):** A bit-field type. M indicates the number of bits per value, from `1` to `64`. The default is `1` if M is omitted.
  - **TINYINT(M):** A very small integer. The signed range is `-128` to `127`. The unsigned range is `0` to `255`.
  - **BOOL or BOOLEAN:** These types are synonyms for TINIYINT(1). A value of zero is considered false. Nonzero values are considered true.
  - **SMALLINT(M):** A small integer. The signed range id `-32768` to `32767`. The unsigned range is `0`to `65535`.
  - **MEDIUMINT(M):** A medium-size integer. The signed range is `-8388608` to `8388607`. The unsigned range id `0` to `16777215`.
  - **INT or INTEGER(M):** A normal-size integer. The signed range is `-2147483648` to `2147483647`. The unsigned range is `0` to `4294967295`.
  - **BIGINT(M):** A larger integer. The signed range is `-9223372036854775808` to `9223372036854775807`. The unsigned range is `0` to `18446744073709551615`.
  - **DECIMAL(M, D):** A packed ‘exact’ fixed-point number. M is the total number of digits (the precision) and D is the number of digits after the decimal point (the scale). The decimal point and (for negative numbers) the ‘-’ sing are not counted in M. If D is `0`, values have no decimal point or fractional part. The maximum number of digits (M) for DECIMAL is `65`. The maximum number of supported decimals (D) is `30`. If D is omitted, the default is `0`. If M is omitted, the default is `10`. Equivalents are DEC, NUMERIC and FIXED.
  - **FLOAT(M, D):** A small (single-precision) floating-point number. Permissible values are `3.402823466E+38` to `-1.175494351E-38`, `0`, and `1.175494351E-38` to `3.402823466E+38`. These are the theoretical limits, based on the IEEE standard. The actual range might be slightly smaller depending on your hardware or operating system. M is the total number of digits and D is the number of digits following the decimal point. If M and D are omitted, values are stored to the limits permitted by the hardware. A single-precision floating-point number is accurate to approximately 7 decimal places.
  - **FLOAT(P):** A floating-point number. P represents the precision in bits, but MySQL uses this value only to determine whether to use FLOAT or DOUBLE for the resulting data type. If P is from 0 to 24, the data type becomes FLOAT with no M or D values. If P is from 25 to 53, the data type becomes DOUBLE with no M or D values.
  - **DOUBLE(M, D):** A normal-size (double-precision) floating-point number. Permissible values are `-1.7976931348623157E+308` to `-2.2250738585072014E-308`, `0`, and `2.2250738585072014E-308` to `1.7976931348623157E+308`. These are the theoretical limits, based on the IEEE standard. The actual range might be slightly smaller depending on your hardware or operating system.
    **`*M*`** is the total number of digits and **`*D*`** is the number of digits following the decimal point. If **`*M*`** and **`*D*`** are omitted, values are stored to the limits permitted by the hardware. A double-precision floating-point number is accurate to approximately 15 decimal places.
    `DOUBLE(***M***,***D***)` is a nonstandard MySQL extension. As of MySQL 8.0.17, this syntax is deprecated and you should expect support for it to be removed in a future version of MySQL.
- Data Storage Requirements of Numeric Data Types:
  | Data Type | Storage Required |
  | --------------------------- | -------------------------------------------- |
  | TINYINT | 1 byte |
  | SMALLINT | 2 bytes |
  | MEDIUMINT | 3 bytes |
  | INT, INTEGER | 4 bytes |
  | BIGINT | 8 bytes |
  | FLOAT(P) | 4 bytes if 0 ≤ p ≤ 24, 8 bytes if 25≤ p ≤ 53 |
  | DOUBLE[PRECISION ], REAL | 8 bytes |
  | DECIMAL(M, D) NUMERIC(M, D) | varies |
  | BIT(M) | approximately [m+7]/8 bytes |

# 4- Tables and Data Types Part 2

- Numeric Data Types Attributes:
  - **UNSIGNED**: This attribute is applied to integers, fixed-point numbers and float-point numbers to permit only non-negative numbers into the column.
  - **ZEROFILL**: This attribute will fill in the number with leading zeros if the length of number is less than the defined one.
  - **AUTO_INCREMENT**: This attribute will auto increment the value of the column by `1` (value + 1) when you insert `NULL` or `0` but you need to make sure that the column is set to `NOT NULL`.
- String Data Types:
  - **CHAR(M):** A fixed-length string that is always right-padded with spaces to the specified length when stored. M represents the column length in characters. The range of M is `0` to `255`. If M is omitted, the length is `1`.
  - **VARCHAR(M):** A variable-length string. M represents the maximum column length in characters. The range of M is `0` to `65,535`. The effective maximum length of a VARCHAR is subject to the maximum row size (`65,535` bytes, which is shared among all columns) and the character set used.
  - **BINARY(M):** The BINARY type is similar to the CHAR type, but stores binary byte strings rather than nonbinary character strings. M represents the column length in bytes.
  - **VARBINARY(M):** The VARBINARY type is similar to the VARCHAR type, but stores binary byte strings rather than nonbinary character strings. M represents the maximum column length in bytes.
  - **TINYBLOB(M):** A BLOB column with a maximum length of `255 (2⁸ − 1)` bytes. Each TINYBLOB value is stored using a `1`-byte length prefix that indicates the number of bytes in the value.
  - **TINYTEXT(M):** A TEXT column with a maximum length of `255 (2⁸ − 1)` characters. The effective maximum length is less if the value contains multibyte characters. Each TINYTEXT value is stored using a `1`-byte length prefix that indicates the number of bytes in the value.
  - **BLOB(M):** A BLOB column with a maximum length of `65,535 (2¹⁶ − 1)` bytes. Each BLOB value is stored using a `2`-byte length prefix that indicates the number of bytes in the value.
  - **TEXT(M):** A TEXT column with a maximum length of `65,535 (2¹⁶ − 1)` characters. The effective maximum length is less if the value contains multibyte characters. Each TEXT value is stored using a `2`-byte length prefix that indicates the number of bytes in the value.
  - **MEDIUMBLOB:** A BLOB column with a maximum length of `16,777,215 (2²⁴ − 1)` bytes. Each MEDIUMBLOB value is stored using a `3`-byte length prefix that indicates the number of bytes in the value.
  - **MEDIUMTEXT:** A TEXT column with a maximum length of `16,777,215 (2²⁴ − 1)` characters. The effective maximum length is less if the value contains multibyte characters. Each MEDIUMTEXT value is stored using a `3`-byte length prefix that indicates the number of bytes in the value.
  - **LONGBLOB:** A BLOB column with a maximum length of `4,294,967,295 or 4GB (2³² − 1)` bytes. The effective maximum length of LONGBLOB columns depends on the configured maximum packet size in the client/server protocol and available memory. Each LONGBLOB value is stored using a `4`-byte length prefix that indicates the number of bytes in the value.
  - **LONGTEXT:** A TEXT column with a maximum length of `4,294,967,295 or 4GB (2³² − 1)` characters. The effective maximum length is less if the value contains multibyte characters. The effective maximum length of LONGTEXT columns also depends on the configured maximum packet size in the client/server protocol and available memory. Each LONGTEXT value is stored using `4`-byte length prefix that indicates the number of bytes in the value.
  - **ENUM**: An enumeration. A string object that can have only one value, chosen from the list of values ‘value1’, ‘value2’….NULL or the special error value. ENUM values are represented internally as integers. An ENUM column can have a maximum of `655535` distinct elements, (The practical limit is less than `3000`). A table can have no more than `255` unique element list identifies among ENUM and SET columns considered as a group.
  - **SET**: A string object that can have zero or more values, each of which must be chosen from the list of values ‘value1’, ‘value2’….SET values are represented internally as integers. A SET column can have a maximum of `64` distinct members. A table can have no more than `255` unique element list identifies among its ENUM and SET columns considered as a group.
- String Data Types Attributes:
  - **NATIONAL**: This attribute is applied to CHAR and VARCHAR to define that the column should use some pre defined character set (The SQL character set).
  - **ASCII**: This attribute applies to CHAR, VARCHAR, TEXT TYPES, ENUM, and SET to switch the character set used to Latin1.
  - **UNICODE**: This attribute applies to CHAR, VARCHAR, TEXT TYPES, ENUM, and SET to switch the character set used to ucs2.
  - **BINARY**: This attribute applies to CHAR, VARCHAR, TEXT TYPES, ENUM, and SET to specify the binary collation of the column character set.
- Date and Time Data Types:
  - **DATE**: A date. The supported range is `'1000-01-01'` to `'9999-12-31'`. MySQL displays DATE values in `'***YYYY-MM-DD***'` format, but permits assignment of values to DATE columns using either strings or numbers.
  - **DATETIME(fsp)**: A date and time combination. The supported range is `'1000-01-01 00:00:00.000000'` to `'9999-12-31 23:59:59.499999'`. MySQL displays DATETIME values in `'***YYYY-MM-DD hh:mm:ss***[.***fraction***]'` format, but permits assignment of values to DATETIME columns using either strings or numbers.
  - **TIMESTAMP(fsp)**: The range is `'1970-01-01 00:00:01.000000'` UTC to `'2038-01-19 03:14:07.499999'` UTC. TIMSTAMP values are stored as the number of seconds since the epoch (`'1970-01-01 00:00:00'` UTC). A TIMSTAMP cannot represent the value `'1970-01-01 00:00:00'` because that is equivalent to 0 seconds from the epoch and the value 0 is reserved for representing `'0000-00-00 00:00:00'`, the “zero” TIMSTAMP value.
  - **TIME(fsp)**: The range is `'-838:59:59.000000'` to `'838:59:59.000000'`. MySQL displays TIME values in `'***hh:mm:ss***[.***fraction***]'` format, but permits assignment of values to TIME columns using either strings or numbers.
  - **YEAR(4)**: A year in 4-digit format. MySQL displays YEAR values in **`*YYYY*`** format, but permits assignment of values to YEAR columns using either strings or numbers. Values display as `1901` to `2155`, or `0000`.
- Data Default Values:
  - **DEFAULT**: This attribute is used in conjunction with almost every data type except for text types, blob types and the newly JSON type.
    - Ex: column_name column_type [attribute] DEFAULT
- The UNIQUE Constraint:
  - **UNIQUE**: This constraint uniquely identifies each record in a database table, When you think creating a column with no duplication this constraint will help you out. By specifying the column unique you guarantee that no duplication happens upon the column data.
    - Ex: email varchar(30) not null unique
- The PRIMARY KEY Constraint:
  - **PRIMARY KEY**: The PRIMARY KEY constraint uniquely identifies each record in a database table. Each record must have a unique value. Its used in conjunction with AUTO_INCREMENT.
    - Ex: id smallint unsigned not null primary key auto_increment
- The NOT NULL Constraint:
  - **NOT NULL**: This attributes ensure that NULL values are not acceptable data values when you insert data into the column.

# 5- Create Table in MySQL

- To create a table in MySQL use one of the following commands:
  ```sql
  CREATE TABLE [IF NOT EXISTS] table_name (creation_defination) [table_options];
  CREATE TABLE [IF NOT EXISTS] table_name LIKE existing_table_name;
  CREATE TABLE [IF NOT EXISTS] table_name (creation_defination) [table_options] SELECT_STMT;
  ```
- Ex:
  [create_table.sql](Files/create_table.sql)

# 6- Alter Table

- Adding new columns:
  ```sql
  ALTER TABLE table_name ADD COLUMN col_name (data_type) [ATTRIBUES]
  [CONSTRAINTS] [FIRST|AFTER];
  ```
- Modifying existing column:
  ```sql
  ALTER TABLE table_name MODIFY COLUMN col_name (data_type) [ATTRIBUES]
  [CONSTRAINTS];
  ```
- Changing existing column:
  ```sql
  ALTER TABLE table_name CHANGE COLUMN old_column new_column (datatype)
  [ATTRIBUES] [CONSTRAINTS];
  ```
- Deleting a column:
  ```sql
  ALTER TABLE table_name DROP COLUMN col_name;
  ```
- Ex:
  [alter_table.sql](Files/alter_table.sql)
- Rename table:
  ```sql
  RENAME TABLE old_table_name TO new_table_name;
  ```
- Truncate table:
  - To empty a table from data use the TRUNCATE TABLE command
    ```sql
    TRUNCATE TABLE table_name;
    ```
  - Note: You’ll not be able to truncate table with foreign key constraints in some cases.

# 7- Relationship Types in Databases Part 1

- Referential Integrity:
  - The technique of maintaining data always in a consistent format, part of the **ACID** philosophy. In particular, data in different tables is kept consistent through the use of **foreign key constraints**, which can prevent changes from happening or automatically propagate those changes to all related tables. Related mechanisms include the **unique constraint**, which prevents duplicate values from being inserted by mistake, and the **NOT NULL constraint**, which prevents blank values from being inserted by mistake.
- Database Relationships:
  - There are **4** types of relationships between tables in MySQL:
    - **One to One relationship:**
      - A one-to-one relationship in a relational database occurs when one parent record or field has either zero or one child record only. These relationships are the easiest to represent in databases because both the parent and child records may be in the same table.
      - An example of that is the relationship between the users and user_profiles table where each user has only one profile that contains his basic information.
    - **One to Many and Many to One relationship:**
      - In relational databases, a one-to-many relationship occurs when a parent record in one table can potentially reference several child records in another table. In a one-to-many relationship, the parent is not required to have child records; therefore, the one-to-many relationship allows zero child records, a single child record or multiple child records. The important thing is that the child cannot have more than one parent record.
      - Examples:
        - A Category can have multiple sub-categories
        - A Department can hold as many employees as it can
        - A Customer can have many purchase orders
        - An Order can hold multiple products
    - **Many to Many relationship:**
      - A many-to-many relationship refers to a relationship between tables in a database when a parent row in one table contains several child rows in the second table, and vice versa. Many-to-many relationships are often tricky to represent.
      - Examples:
        - A student can contribute to many training courses and a course can have more than one student
        - An employee can be a part of many projects and a project can have more than one
          employee
    - **Self referencing relationship:**
- Foreign Key Constraints:
  - In context of relational databases, a foreign key is a field (or collection of fields) in one table that uniquely identifies a row of another table. In simpler words, the foreign key is defined in a second table, but it refers to the primary key in the first table.
  - Foreign keys usually refer to primary keys in the parent table.
    You can create a foreign key constraint while in the CREATE TABLE or ALTER TABLE content.
  - Syntax:
    ```sql
    CONSTRAINT [symbol] FOREIGN KEY [index_name] (index_col_name, ...)
    REFERENCES tbl_name (index_col_name,...)
    [ON DELETE reference_option] [ON UPDATE reference_option];
    ```
  - EX:
    ```sql
    ALTER TABLE tbl_name ADD CONSTRAINT fk_something FOREIGN KEY
    (col_name_in_child_table) REFERENCES (col_name_in_praent_table) [reference_options];
    ```
- Ex:
  [relationship1.sql](Files/relationship1.sql)

# 8- Relationship Types in Databases Part 2

[relationship2.sql](Files/relationship2.sql)

# 9- Insert Data

- The DML (Data Manipulation Language):
  - DML statements are used for managing data within schema objects.
  - Command like: SELECT, INSERT, UPDATE, DELETE, REPLACE, CALL and more..
- The INSERT Statement:

  - is used to insert data into a database table.
  - can be used as follows:
    - INSERT [LOW PRIORITY | DELAYED | HIGH PRIORITY] [IGNORE] [INTO] fb_name [PARTITION
      (partition_name] [(col nome....]] (VALUES | VALUE) ((expr | DEFAULT)........) [ON DUPLICATE KEY UPDATE col name expr (col_name expr...]
    - INSERT [LOW PRIORITY | DELAYED | HIGH PRIORITY] [IGNORE] [INTO] fol_name [PARTITION
      (partition name...)] SET col_name (expr | DEFAULT).... [ON DUPLICATE KEY UPDATE col nome expr. col nome-expr]]
    - INSERT [LOW PRIORITY | HIGH PRIORITY] [IGNORE] [INTO] tbl_name [PARTITION (partition name...)][(colname....)] SELECTION DUPLICATE KEY UPDATE col nome expr [.col nome exp]...]
  - Examples:

    ```sql
    INSERT INTO users (username, password)
    VALUES ('Zeina', '123456');

    INSERT INTO users
    SET username = 'Zeina',
    		password = md5['123456'];

    INSERT INTO users
    SET username = 'Zeina',
    		password = md5['123456']
    		ON DUPLICATE KEY UPDATE username = CONCAT(username, 2);

    INSERT INTO users
    SELECT * FROM users2
    WHERE user_id = 4;
    ```

    [insert.sql](Files/insert.sql)

# 10- Replace, Update

- The REPLACE Statement:

  - The REPLACE statement works exactly as INSERT statement except that if an old row in the
    table has the same value as a new row for a PRIMARY KEY or a UNIQUE index, the old row
    is deleted before the new row is inserted.
  - The REPLACE STATEMENT can be used as follows:
    - REPLACE (LOW PRIORITY | DELAYED) (INTO] b name (PARTITION (partition name...)}]
      [(col_nome....]] {VALUES | VALUE) ((exor | DEFAULT).............
    - REPLACE (LOW PRIORITY | DELAYED) (INTO] (blname (PARTITION (partition name....]] SET
      col nome (exor | DEFAULT)...
    - REPLACE [LOW PRIORITY | DELAYED] [INTO] tbl_name [PARTITION (partition name...]]
      [[col name....)] SELECT...
  - Examples:

    ```sql
    REPLACE INTO `users` (username, password)
    VALUES ('Zeina', '123456');

    REPLACE INTO `users`
    SET username = 'Zeina'
    		password = md5('123456');

    REPLACE INTO `users`
    SELECT * FROM `users2`
    WHERE user_id = 4;
    ```

- The UPDATE Statement:

  - is used to update columns in a single or multiple tables.
  - The UPDATE statement can be used as follows:
    - Single-table: UPDATE [LOW PRIORITY] [IGNORE] (able reference SET col_name] (expr1 | DEFAULT)
      [col_name2=[expr2 | DEFAULT)]... [WHERE where condition] (ORDER BY...) [UMIT (row_count)
    - Multiple-tables: UPDATE [LOW PRIORITY] [IGNORE] fable references SET col_name={exori | DEFAULT) colname2 [expr2 | DEFAULT)][WHERE where_condition]
  - Example:

    ```sql
    UPDATE `users`
    SET username = 'Zeina',
    		password = md5('123456')
    WHERE user_id = 3;

    UPDATE `users`, `users2`
    				users.password = users2.password
    WHERE user_id = 2;
    ```

[replace.sql](Files/replace.sql)

# 11- Delete

- DELETE is a DML statement that removes rows from a table.
- The DELETE statement can be used as follows:
  - Single-table: DELETE (LOW PRIORITY] [QUICK] [IGNORE FROM tbl_name [PARTITION
    (partition_name] [WHERE where condition] (ORDER BY [UMIT (ow_count]
  - Multiple-table: DELETE (LOW PRIORITY] (QUICK] [IGNORE] blname[] tbl_name[.]]. FROM
    table references [WHERE where condition]
- Ex:

  ```sql
  DELETE FROM `users` ORDER BY user_id LIMIT 2;

  DELETE `users`, `users2` FROM `users`, `users2`
  WHERE users.user_id = 8 AND users.user_id = 2;
  ```

[delete.sql](Files/delete.sql)

# 12- Select Part 1

- SELECT is used to retrieve rows selected from one or more tables, and can include UNION statements and subqueries.
- SELECT statements can be very simple statements and can end up complex statements.
- SELECT expr FROM tbl_ref is the simple form of a select statement.
- SELECT [ALL | DISTINCT | DISTINCTROW] [HIGH PRIORITY]
  [MAX STATEMENT TIME N] (STRAIGHT JOIN] (SQL_SMALL_RESULT]
  [SQL_BIG_RESULT) (SQL_BUFFER RESULT] [SQL CACHE I SQL_NO_CACHE] [SQL_CALC_FOUND_ROWS] select expr [. select expr...] [FROM
  table references [PARTITION partition st] [WHERE where_condition] [GROUP BY {col_name | exor | position) [ASC | DESC).... [WITH ROLLUP]] [HAVING where condition] [ORDER BY (col_name | expr | position} [ASC DESC)....] [UMIT ((offset.] row count | row_count OFFSET offset}] [PROCEDURE procedure name (argument ist]] [INTO OUTFILE e name [CHARACTER SET charset_name] export options | INTO DUMPFILE file name | INTO var_name [var_name]] [FOR UPDATE | LOCK IN SHARE MODE]]
- Ex:
  ```sql
  SELECT * FROM employees;
  SELECT user_id, name FROM users;
  SELECT passwords FROM users2;
  ```
- The expressions examples:
  - SELECT 1 + 1
  - SELECT CURRENT_DATE
  - SELECT NOW()
  - SELECT 5 / 2

[select1.sql](Files/select1.sql)

# 13- Select Part 2

- The WHERE Clause:
  - is used in conjunctions with SELECT statement to specify only data that fit a certain condition.
  - You can add more than a condition to a SELECT statement.
  - You can use expressions also to form your conditions.
- The Expressions Syntax:
  - SELECT statement include expressions.
  - Those expressions can be of any type.
  - You can combine expressions using operators.
  - MySQL supports a lot of operators such as:
    - Arithmetic operators.
      - `+ - * / %`
    - Comparison operators.
      - BETWEEN `= > < ≤ ≥` GREATEST(), IN(), IS NOT NULL, IS NULL, IS, LEAST(), LIKE, NOT BETWEEN, `≠ <>`, NOT IN, NOT LIKE.
    - Logical operators.
      - AND `&&`, OR `||`, NOT `!`, XOR
    - Assignment operators.
    - [select2.SQL](Files/select2.sql)

# 14- ORDER BY and LIMIT

- ORDER BY Clause:
  - is used to sort the result-set by one or more columns.
  - sorts data is ascending order by default.
  - If you want to sort in descending order you can use DESC.
  - When sorting by multiple table MySQL sorts first by the first column and then tries to sort by the second column as possible.
  - Ex:
    ```sql
    SELECT * FROM distribution ORDER BY price DESC;
    SELECT * FROM distribution ORDER BY price ASC, quantity ASC;
    ```
- Limiting the result set:

  - To limit the number of rows or records fetched from a table using the SELECT statement you can use the LIMIT keyword in 2 fashions:
    - LIMIT offset, row_count which will return the result by a specific row count and starting from the defined offset, **Note** that offset start counting from zero.
    - LIMIT row_count OFFSET offset which will return the result by a specific row count and also starting from a specific offset.
  - Ex:

    ```sql
    SELECT * FROM distribution
    WHERE id BETWEEN 20000 AND 21000 LIMIT 20, 5;

    SELECT * FROM distribution
    WHERE id BETWEEN 20000 AND 21000 LIMIT 5 OFFSET 20;
    ```

[order-by.SQL](Files/order-by.sql)

# 15- String Functions

- are very useful and can be applied on any text stored in your database table.
  | Function | Usage |
  | ----------- | ------------------------------------------------------------------------------------- |
  | BIT_LENGTH | Return length of argument in bits. |
  | CHAR_LENGHT | Return no. of characters in argument. |
  | CONCAT | Return concatenated string. |
  | CONCAT_WS | Return a concatenated string with a separator. |
  | ELT | Return sting at index number. |
  | FIELD | Return the index (position) of the first argument in the subsequent arguments. |
  | TO_BASE64 | Return the argument converted to a base-64 string. |
  | FROM BASE64 | Decode to a base 64 string and return result. |
  | INSERT | Insert a substring at the specified position up to the specified number of characters |
  | INSTR | Return the index of the first occurrence of substring. |
  | LOWER | Return the argument in lowercase. |
  | UPPER | Convert to uppercase. |
  | LOCATE | Return the position of the first occurrence of substring. |
  | TRIM | Remove leading and trailing spaces. |
  | SUBSTR | Return the substring as specified. |
  | STRCMP | Compare two strings. |

[stringFunctions.SQL](Files/stringFunctions.sql)

# 16- Number Functions

| Function               | Usage                                                           |
| ---------------------- | --------------------------------------------------------------- | --- | --------------------------------------------------- |
| ABS                    | Return the absolute value.                                      |
| Trigonometry Functions | SIN. COS. TAN, ASIN, ACOS..                                     |
| CEIL                   | Return the smallest integer value not less than the argument.   |
| CONV                   | Convert numbers between different number bases.                 |
| + - \* /               | Return string at index number.                                  |
| LOG                    |                                                                 | LN  | Return the natural logarithm of the first argument. |
| LOG10                  | Return the base-10 logarithm of the argument.                   |
| LOG2                   | Return the base-2 logarithm of the argument.                    |
| PI                     | Return the value of PI.                                         |
| POW                    | Return the argument raised to the specified power.              |
| FLOOR                  | Return the largest integer value not greater than the argument. |
| RAND                   | Return a random floating-point value.                           |
| ROUND                  | Round the argument.                                             |
| SQRT                   | Return the square root of the argument.                         |

[numberFunctions.SQL](Filesf/numberFunctions.sql)

# 17- Date and Time Functions

| Function   | Usage                                                   |
| ---------- | ------------------------------------------------------- |
| ADDDATE    | Add time values (intervals) to a date value.            |
| ADDTIME    | Add time.                                               |
| CURDATE    | Returns the current date.                               |
| CURTIME    | Returns the current timestamp.                          |
| DATE       | Extract the date part of a date or datetime expression. |
| DATE_ADD   | Some os ADDDATE.                                        |
| DATE SUB   | Some os SUBDATE.                                        |
| DATADIFF   | Subtracts 2 Dates.                                      |
| DAYNAME    | Returns the name of the weekday.                        |
| DAYOFMONTH | Returns the day of the month.                           |
| DAYOFYEAR  | Returns the day of the year.                            |
| TIME       | Returns the time part of a given date.                  |
| TIMEDIFF   | Returns the difference between 2 given times.           |
| YEAR       | Returns the year part from a given date.                |
| MONTH      | Returns the month part from a given date.               |
| WEEK       | Returns the week port from a given date.                |
| DAY        | Returns the day part from a given date.                 |
| HOUR       | Returns the hours part from a given date.               |
| MINUTE     | Returns the minutes port from a given date.             |
| SECOND     | Returns the seconds part from a given date              |
| WECKOFYEAR | Returns the week number from a given date.              |
| WEEKDAY    | Returns the index number of the weekday                 |

[date-timeFunctions.SQL](Files/date-timeFunctions.sql)

# 18- Aggregate Functions - GROUP BY CLAUSE

| Function        | Usage                                             |
| --------------- | ------------------------------------------------- |
| AVG             | Return the average value of the argument.         |
| COUNT           | Return a count of the number of rows returned.    |
| COUNT(DISTINCT) | Return the count of a number of different values. |
| GROUP_CONCAT    | Return a concatenation string.                    |
| MAX             | Return the maximum value.                         |
| MIN             | Return the minimum value.                         |
| SUM             | Return the sum.                                   |

[aggregateFunctions.SQL](Files/aggregateFunctions.sql)

# 19- Unions

- You can use UNIONS if you want to select rows one after the other from several tables or several set of rows from a single table all as a single result set.
- Suppose you have two tables that list prospective and actual customers, a third that lists vendors from whom you purchase supplies, and you want tot create a single mailing list by merging names and addresses from all three tables.
- Ex:
  ```sql
  SELECT mail FROM subscribers
  UNION SELECT mail FROM mailist;
  ```

[unions.sql](Files/unions.sql)

# 20- Joins

[joins.sql](Files/joins.sql)
