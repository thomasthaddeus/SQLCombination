/*
 * DATABASES WITH POSTGRESQL
 */

SELECT * FROM parts LIMIT 10;

ALTER TABLE parts
ALTER COLUMN code SET NOT NULL;

ALTER TABLE parts
ADD UNIQUE(code);

CREATE TABLE part_descriptions (
    id int PRIMARY KEY,
    description text
);

INSERT INTO part_descriptions VALUES (1, '5V resistor'), (2, '3V resistor');
UPDATE parts
SET description = part_descriptions.description
from part_descriptions
where part_descriptions.id = parts.id
and parts.description IS NULL;

ALTER TABLE parts
ALTER COLUMN description SET NOT NULL;

INSERT INTO parts (id, description, code, manufacturer_id) VALUES (54, 'Light Bulb', 'V1-009', 9);