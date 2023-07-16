# DESIGN DATABASES WITH POSTGRESQL

## Building an Inventory Database with PostgreSQL

In this project you’ll build out a database schema that could be used to organize an inventory of mechanical parts. This schema will keep track of all the parts, their manufacturer, category, location in storeroom, available inventory, and other relevant information.

A database like this might be updated and queried by an inventory management application that accepts input from many users who might not be familiar with the database structure. As a result, we should make sure that there are sufficient data quality checks to ensure that only valid data can be entered into the database.

We'll start with tables with just a few constraints and build upon them throughout the project. Press 'Start' to begin inspecting the data.

### Improving Parts Tracking

1. The next few instructions will guide you through adding constraints to the parts table. Before making any changes, write a query to inspect the first 10 rows of parts.
    Take a look at the output. What data is stored in this table? This is also a good opportunity to inspect the entire schema. What other tables are available to you?

    `Use SELECT * FROM parts LIMIT 10;` to inspect the first 10 rows of parts.

2. The parts table is the central table in our database, it stores all the information about the individual parts in our storeroom. Let’s make sure that we have some basic checks in place to ensure data integrity. Alter the code column so that each value inserted into this field is unique and not empty.

    To ensure there are no empty values we can place UNIQUE and NOT NULL constraints on code. Fill in the code below to add these constraints.

        ```sql
        ALTER TABLE parts
        ALTER COLUMN code SET ____ ____;

        ALTER TABLE parts
        ADD UNIQUE(____);
        ```

3. The parts table is missing values in the description column. Alter the table so that all rows have a value for description.

    As an extra exercise, think about how you might alter the table if you wanted to fill in missing description fields with different values for each part.

    Because there are missing values in this table, we’d need to backfill these values before adding a constraint. Fill in the code below to be able to add the constraint on description without throwing an error.

        ```sql
        UPDATE parts
        SET description = 'None Available'
        WHERE description ____ ____;
        BONUS:
        ```

    To update each row with a different value, you can follow the same pattern, but you’ll need to fill the descriptions. See the following example. First, we create an intermediate table that will store descriptions.

        ```sql
        CREATE TABLE part_descriptions (
            id int PRIMARY KEY,
            description text
        );
        ```

    Then we fill the intermediate table with the descriptions for the empty rows in 'parts'. In this example we assume we’re filling id=1 and id=2.

        ```sql
        INSERT INTO part_descriptions VALUES (1, '5V resistor'), (2, '3V resistor');
        ```

    Finally, we update the values in the original table using an UPDATE statement while joining the original table with the table with descriptions.

        ```sql
        UPDATE parts
        SET description = part_descriptions.description
        from part_descriptions
        where part_descriptions.id = parts.id
        and parts.description IS NULL
        ```

4. To test that you’ve successfully back-filled parts, add a constraint on parts that ensures that all values in description are filled and non-empty.

    To do this, you can add a NOT NULL constraint on description. If you’ve successfully back-filled parts, Postgres will allow you to add a NOT NULL constraint. Fill in the code below to try it out.

        ```sql
        ALTER TABLE parts
        ALTER COLUMN description SET ____ ____;
        ```

5. Test the constraint by trying to insert a row into parts with the following information.

    Because you've set description to NOT NULL, PostgreSQL should reject this insert. Examine the error and change the description to a different value so that the row can be inserted.

    | id | description  | code  | manufacturer_id |
    |----|--------------|-------|-----------------|
    | 54 |              | V1-009| 9               |

    Attempt to insert the following row. After you attempt to insert this row, examine the error and fill in some value for description that

    `INSERT INTO parts (id, code, manufacturer_id) VALUES (54, 'V1-009', 9);`

### Improving Reordering Options

6. In our database schema, we have a table called reorder_options. This table keeps track of the parts, quantities, and prices available from their manufacturers.

    Let's implement a check that ensures that price_usd and quantity are both NOT NULL. Can you think of some other constraints we might want to add to this table?

    To implement these rules we need to alter the columns and set each not null. Fill in the code below to add these constraints.

        ```sql
        ALTER TABLE reorder_options
        ALTER COLUMN ____ SET NOT NULL;
        ```

7. Let’s implement a check that ensures that price_usd and quantity are both positive. Can you think of how to enforce these rules as a single constraint and as two separate constraints?

    To ensure that both of these fields are positive we can create either one or two checks. Fill in the code below to ensure that both fields are positive using a single check.

        ```sql
        ALTER TABLE reorder_options
        ADD CHECK (____ > 0 AND ____ > 0);
        ```

8. Let's assume our storeroom mostly tracks parts with a price per unit between 0.02 USD and 25.00 USD. Add a constraint to reorder_options that limits price per unit to within that range. Assume that price per unit for a given ordering option is the price divided by the quantity.

    We can use a CHECK constraint to enforce the constraints upper and lower limits. Fill in the code below that finishes this constraint.

        ```sql
        ALTER TABLE reorder_options
        ADD CHECK (price_usd/quantity > ____ AND price_usd/quantity < ____);
        ```

9. Add a constraint to ensure that we don’t have pricing information on parts that aren’t already tracked in our DB schema. Form a relationship between parts and reorder_options that ensures all parts in reorder_options refer to parts tracked in parts.

    We should add a foreign key constraint that links reorder_options and parts. As an intermediate step, we need to make sure there is a primary key on parts. Fill in the code below to add such a constraint.

        ```sql
        ALTER TABLE parts
        ADD PRIMARY KEY (____);
        ALTER TABLE reorder_options
        ADD FOREIGN KEY (____) REFERENCES parts (____);
        ```

### Improving Location Tracking

10. The locations table stores information about the locations of a part for all the parts available in our storeroom. Let’s add a constraint that ensures that each value in qty is greater than 0.

    We can add a CHECK constraint on locations to ensure that qty is greater than 0. Fill in the code below to complete this constraint.

        ```sql
        ALTER TABLE locations
        ADD CHECK (____ > ____);
        ```

11. Let's ensure that locations records only one row for each combination of location and part. This should make it easier to access information about a location or part from the table. For example, our database should display:

    | id | part_id | location | count |
    |----|---------|----------|-------|
    | 1  | 10      | 11B      | 5     |
    rather than:

    | id | part_id | location | count |
    |----|---------|----------|-------|
    | 1  | 10      | 11B      | 2     |
    | 2  | 10      | 11B      | 3     |

    This requirement is suggesting that part_id and location should be unique within the locations table. To do this we can add a UNIQUE constraint. Fill in the code below to complete the constraint.

        ```sql
        ALTER TABLE locations
        ADD UNIQUE (____, ____);
        ```

12. Let's ensure that for a part to be stored in locations, it must already be registered in parts. Write a constraint that forms the relationship between these two tables and ensures only valid parts are entered into locations.

    For this requirement, we must link locations and parts with a `FOREIGN KEY` constraint. Fill in the code below to complete the constraint.

        ```sql
        ALTER TABLE locations
        ADD FOREIGN KEY (____) REFERENCES parts (____);
        ```

### Improving Manufacturer Tracking

13. Let's ensure that all parts in parts have a valid manufacturer. Write a constraint that forms a relationship between parts and manufacturers that ensures that all parts have a valid manufacturer.

    To form a relationship between tables we’d want to use a `FOREIGN KEY` constraint that establishes parts as a child table and manufacturers as a parent. Fill in the code below to add this constraint.

        ```sql
        ALTER TABLE parts
        ADD FOREIGN KEY (____) REFERENCES ____ (id);
        ```

14. Let's test the most recent constraint we’ve added. Assume that 'Pip Industrial' and 'NNC Manufacturing' merge and become 'Pip-NNC Industrial'. Create a new manufacturer in manufacturers with an id=11.

    For this task we must insert a row into manufacturers. Fill in the code below with the values described above.

        ```sql
        INSERT INTO manufacturers(name, id)
        VALUES (____, ____);
        ```

15.  Update the old manufacturers’ parts in 'parts' to reference the new company you’ve just added to 'manufacturers'.

    We need to find a way to select the old manufacturers’ rows in parts and replace them with the new. We can use manufacturer_id with IN to select these rows. IN works similarly to OR — it will filter the rows that match any of the values inside the IN parentheses.

    Fill in the code below to update parts.

        ```sql
        UPDATE parts
        SET manufacturer_id = 11
        WHERE manufacturer_id IN (____, ____);
        Another way of writing this would be

        UPDATE parts
        SET manufacturer_id = 11
        WHERE manufacturer_id = ____ OR manufacturer_id = ____;
        ```
