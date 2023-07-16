/*      PE04
Week 5
Thaddeus Thomas
IS456: Database Systems Management
 */
-- Task 1:
/*  Create two tables name contacts and groups (each 5 columns), with contact_id and group_id columns 
as a primary and foreign key column.
Create a column named phone numbers and email addresses, and names
------------------------------------------------------*/
PRAGMA foreign_keys = OFF;

BEGIN TRANSACTION;

CREATE TABLE
  IF NOT EXISTS groups (
    group_id INTEGER PRIMARY KEY AUTOINCREMENT,
    names TEXT NOT NULL
  );

CREATE TABLE
  IF NOT EXISTS contacts (
    contact_id INTEGER PRIMARY KEY AUTOINCREMENT,
    names TEXT NOT NULL,
    phone_numbers VARCHAR(10) NOT NULL
        CHECK (length(phone_numbers) >= 10),
    email_addresses VARCHAR(50) NOT NULL,
    group_id INTEGER,
    CONSTRAINT fk_groups 
        FOREIGN KEY (group_id)
        REFERENCES groups (group_id) 
        ON UPDATE DO NOTHING
        ON DELETE CASCADE
  );

COMMIT;

PRAGMA foreign_keys = ON;

-- Task 2:
/*  -- Insert values of 5 names, (with email addresses and phone numbers) in to contacts table
-- explicitly name columns
-- then query the table again to make sure the insert was successful
---------------------------------------------------------*/
INSERT INTO
  groups (group_id, names)
VALUES
  (1, 'Their can be only one group');

INSERT INTO
  groups (group_id, names)
VALUES
  (2, 'But we made a second');

INSERT INTO
  contacts (group_id, names, phone_numbers, email_addresses)
VALUES
  (1, 'Adam', 1238885544, 'adam1@fakenews.com');

INSERT INTO
  contacts (group_id, names, phone_numbers, email_addresses)
VALUES
  (1, 'John', 4335145435, 'John@nonews.com');

INSERT INTO
  contacts (group_id, names, phone_numbers, email_addresses)
VALUES
  (2, 'Tim', 2352653467, 'Tim@whatnews.com');

INSERT INTO
  contacts (group_id, names, phone_numbers, email_addresses)
VALUES
  (2, 'Bob', 4335145476, 'Bob@notnews.com');

INSERT INTO
  contacts (group_id, names, phone_numbers, email_addresses)
VALUES
  (2, 'Bernice', 1234626250, 'Bernice@realnews.com');

SELECT * FROM contacts;
SELECT * FROM groups;

-- Task 3:
/*  -- Update existing rows in contacts table, with new values:Johnson for contact_id = 2
----------------------------------------------------------------*/
UPDATE contacts 
SET names = 'Johnson',
    email_addresses = 'Johnson@whatnews.com'
WHERE contact_id = 2;


--Task 4: 
/*  -- Delete rows in groups table where the group_ID is 2
-- Truncate the table
-- Drop the table */
DELETE FROM groups
WHERE group_id = 2;
SELECT * FROM groups;

DELETE FROM contacts;
DELETE FROM groups;

DROP TABLE contacts;
DROP TABLE groups;
