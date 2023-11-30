# Best night club in the city

![img](skybar.png)

### Requirements
## Conceptual Model:

As the client, running a nightclub business, I have specific needs for the database to ensure smooth operations and efficient management. Here are some key elements and functionalities that I require:

    Customer Management:
        Store customer details, including names, contact information, and membership status.
        Track customer preferences depending on their membership.

    Employee Management:
        Maintain a staff database with details like names, roles, contact information, and work schedules.

    Inventory Management:
        Keep track of bar inventory, including types and quantities of beverages and other supplies.

    Event Management:
        Schedule and manage events, parties, and promotions.

    Reservation System:
        Implement a reservation system for VIP tables or special events.
        Record customer preferences for seating arrangements.

    Financial Management:
        Record and track all financial transactions, including income and expenses.
        Generate financial reports for analysis and decision-making.

    Artist, Music and Entertainment:
        Keep track of music playlists and DJ schedules.

By addressing these specific aspects, the database would help streamline operations, enhance customer experience, and provide valuable insights for business growth and development.

## Logical Model:

Tables

The database consists of the following tables:

- employee_schedule: This table stores information about employee schedules, including the type of schedule (full-time or part-time), the number of hours worked per week, and the enter and exit hours.

- disco_table: This table stores information about the nightclub's tables, including the table ID and its location.

- reservation: This table stores information about reservations, including the customer ID, event ID, date, table ID, number of people, and payment status.

- event: This table stores information about events, including the event name, date, start time, end time, description, entry fee, and artist ID.

- consumption: This table stores information about consumption, including the item ID, quantity, and receipt ID.

- artist: This table stores information about the nightclub's artists, including the artist ID, name, description, phone number, and music genre.

- membership: This table stores information about the nightclub's memberships, including the membership ID, type, description, preferences, and status.

- event_employee: This table stores information about which employees are assigned to which events.

- receipt: This table stores information about receipts, including the receipt ID, table ID, date and time, and payment method.

- employee: This table stores information about the nightclub's employees, including the employee ID, name, last name, role, phone number, email address, gender (optional), date of birth, address, and schedule ID.

- customer: This table stores information about the nightclub's customers, including the customer ID, name, last name, gender (optional), date of birth, phone number, email address, address, and membership ID.

- inventory: This table stores information about the nightclub's inventory, including the item ID, item name, item type, item code, quantity, and price.


Relationships

The tables are related to each other in the following ways:

> The `event_employee` table has a foreign key constraint that references the `event table`. This means that each record in the `event_employee` table must have a corresponding record in the `event table` with the same event ID.
It also has a foreign key constraint that references the `employee` table.

> The `consumption` table has a foreign key constraint that references the `receipt` table and a foreign key constraint that references the `inventory` table.

> The `event` table has a foreign key constraint that references the `artist` table.

> The `employee` table has a foreign key constraint that references the `employee_schedule` table.

> The `reservation` table has a foreign key constraint that references the `event` table, it also has a foreign key constraint that references the `disco_table` table and a foreign key constraint that references the `customer` table.

> The `receipt` table has a foreign key constraint that references the `disco_table` table.

> The `customer` table has a foreign key constraint that references the `membership` table.

### Resume
    Primary Entities:
        Customer:
            Attributes: CustomerID (Primary Key), Name, ContactInfo, MembershipStatus.
        Employee:
            Attributes: EmployeeID (Primary Key), Name, ContactInfo, Role, Schedule.
        InventoryItem:
            Attributes: ItemID (Primary Key), ItemName, ItemType, Quantity, Cost.
        Event:
            Attributes: EventID (Primary Key), Name, Date, Type.
        Artist:
            Attributes: ArtistID (Primary Key), Name, Phone, MusicGender.
        Reservation:
            Fields: ReservationID (Primary Key), CustomerID, TableNumber, Date.

## Relationships Resume
Reservation-Customer (One-to-Many):

    Relates Reservation with Customer for tracking preferences.
Inventory-Sale (One-to-One):

    Links InventoryItem with sales transactions.
Event-Employee (One-to-Many):

    Relates the Employees who will work in an Event.

### Possible Views
Views:

    Views for commonly used queries, e.g., top-selling items, popular events.

# Result
## Physic Model:

![database](db.png)

> database schema for managing a disco. This schema includes tables for employee schedules, disco tables, reservations, events, consumables, artists, memberships, event employees, receipts, employees, customers, and inventory. Foreign key constraints have been defined to establish relationships between these tables.

# QUERIES

### artist
<details>
<summary>
CRUD QUERIES </summary>

CREATE (means adding or inserting rows into a table).
```sql
INSERT INTO artist (id, name, description, phone, music_gender) VALUES (1, 'Speaker Name', 'Keynote speaker', 987654321, 'Techno');
```
READ (means selecting rows from a table).
```sql
--all
SELECT * FROM artist;

--specific column
SELECT music_gender FROM artist;

--specific row
SELECT * FROM artist WHERE music_gender='techno';
```
UPDATE (means modifying rows in a table).
```sql
UPDATE artist SET music_gender = 'Reggaeton' WHERE id=1;
```
DELETE (means removing rows from a table).
```sql
DELETE FROM artist WHERE id=3;
```
</details>

### Queries for artist
1. Get artists with similar events to the reference artist:
```sql
DELIMITER $$

CREATE PROCEDURE getArtistsSimilarEvents(IN reference_artist_id INT)
BEGIN
    SELECT a.*
    FROM artist a
    WHERE EXISTS (SELECT 1 FROM event e1 WHERE e1.artist_id = reference_artist_id
    AND e1.entry_fee = e.entry_fee
    AND e1.description = e.description
    )
    AND a.id != reference_artist_id;
END; $$
DELIMITER ;

```
2. Get artists with most sold tickets:
```sql
DELIMITER $$

CREATE PROCEDURE getArtistsMostSoldTickets()
BEGIN
    SELECT
        a.*, SUM(r.number_of_people) AS total_tickets_sold
    FROM
        artist a
    LEFT JOIN event e ON a.id = e.artist_id
    LEFT JOIN reservation r ON e.id = r.event_id
    GROUP BY
        a.id
    ORDER BY
        total_tickets_sold DESC;
END; $$
DELIMITER ;

```
3. Get Artists with High Entry Fees:
```sql
DELIMITER $$

CREATE PROCEDURE getArtistsHighEF(IN min_entry_fee INT)
BEGIN
    SELECT
        a.*, AVG(e.entry_fee) AS avg_entry_fee
    FROM
        artist a
    JOIN event e ON a.id = e.artist_id
    GROUP BY
        a.id
    HAVING
        avg_entry_fee > min_entry_fee;
END; $$
DELIMITER ;

```
4.
```sql
```
5.
```sql
```

### consumption
<details>
<summary>
CRUD QUERIES </summary>

CREATE (means adding or inserting rows into a table).
```sql
INSERT INTO consumption (id, item_id, quantity, receipt_id) VALUES (1, 1, 2, 1);
```
READ (means selecting rows from a table).
```sql
--all
SELECT * FROM consumption;

--specific row
SELECT * FROM consumption WHERE receipt_id=3;
```
UPDATE (means modifying rows in a table).
```sql
UPDATE consumption SET quantity=1000;
```
DELETE (means removing rows from a table).
```sql
DELETE FROM consumption WHERE receipt_id=3;
```
</details>

### Queries for consumption
1. Get items with increasing sales trend:
```sql
DELIMITER $$

CREATE PROCEDURE itemsIncreasingSales()
BEGIN
    SELECT item_id, item_name,
        (SELECT SUM(quantity) 
            FROM consumption c
            WHERE c.item_id = i.item_id
            AND DATE_SUB(CURDATE(), INTERVAL 3 MONTH) <= (SELECT MAX(datetime) 
            FROM receipt r 
            WHERE r.id = c.receipt_id)
        ) AS quantity_last_three_months
    FROM
        inventory i;
END; $$
DELIMITER ;

```
2.
```sql
```
3.
```sql
```
4. Calculate Total Revenue from Consumables:
```sql
```
5.
```sql
```

### customer
<details>
<summary>
CRUD QUERIES </summary>

CREATE (means adding or inserting rows into a table).
```sql
INSERT INTO customer (id, name, last_name, gender, date_of_birth, phone, email, address, membership_id) VALUES
(1, 'Olivia', 'Hernandez', 'Female', '1990-09-20', 555777888, 'olivia.hernandez@example.com', '456 Pine St', 4);
```
READ (means selecting rows from a table).
```sql
--all
SELECT * FROM customer;

--specific column
SELECT phone FROM customer;

--specific row
SELECT * FROM customer WHERE membership_id=3;
```
UPDATE (means modifying rows in a table).
```sql
UPDATE customer SET membership_id=1 WHERE id=4;
```
DELETE (means removing rows from a table).
```sql
DELETE FROM customer WHERE id=1;
```
</details>

### Queries for customer
1.
```sql
```
2.
```sql
```
3.
```sql
```
4.
```sql
```
5.
```sql
```

### disco_table
<details>
<summary>
CRUD QUERIES </summary>

CREATE (means adding or inserting rows into a table).
```sql
INSERT INTO `disco_table` (tableId, location) VALUES (1, 'Main Hall');
```
READ (means selecting rows from a table).
```sql
--all
SELECT * FROM disco_table;

--specific row
SELECT * FROM disco_table WHERE tableId=3;
```
UPDATE (means modifying rows in a table).
```sql
UPDATE disco_table SET location='Rooftop' WHERE tableId=2;
```
DELETE (means removing rows from a table).
```sql
DELETE FROM disco_table WHERE location='Rooftop';
```
</details>

### Queries for disco_table
1. Get Available Tables:
```sql
```
2. Identify Popular Tables:
```sql
```
3. List tables located in the 'Rooftop' and their respective reservations:
```sql
SELECT d.tableId, d.location, r.id AS reservation_id, r.date, r.number_of_people
FROM disco_table d
JOIN reservation r ON d.tableId = r.table_id
WHERE d.location = 'Rooftop';
```
4. Find the table with the highest number of reservations in a specific month:
```sql
SELECT d.tableId, d.location, COUNT(r.id) AS reservation_count
FROM disco_table d
LEFT JOIN reservation r ON d.tableId = r.table_id
GROUP BY d.tableId, d.location
ORDER BY reservation_count DESC
LIMIT 1;
```
5. List the total number of people served on each table in one event:
```sql
```

### employee
<details>
<summary>
CRUD QUERIES </summary>

CREATE (means adding or inserting rows into a table).
```sql
INSERT INTO employee (id, name, last_name, role, phone, email, gender, date_of_birth, address, schedule_id) VALUES
(1, 'Sophia', 'Martinez', 'Hostess', 555222111, 'sophia.martinez@example.com', 'Female', '1993-11-30', '789 Pine St', 2);
```
READ (means selecting rows from a table).
```sql
--all
SELECT * FROM employee;

--specific column
SELECT CONCAT(name, ' ', last_name) FROM employee;

--specific row
SELECT * FROM employee WHERE role='waitress';
```
UPDATE (means modifying rows in a table).
```sql
UPDATE employee SET role='Bartender' WHERE id=5;
```
DELETE (means removing rows from a table).
```sql
DELETE FROM employee WHERE id=4;
```
</details>

### Queries for employee
1.
```sql
```
2.
```sql
```
3.
```sql
```
4.
```sql
```
5.
```sql
```

### employee_schedule
<details>
<summary>
CRUD QUERIES </summary>

CREATE (means adding or inserting rows into a table).
```sql
INSERT INTO employee_schedule (id, type, hours, enter_hour, exit_hour) VALUES (1, 'full-time', 9, '17:00:00', '02:00:00');
```
READ (means selecting rows from a table).
```sql
--all
SELECT * FROM employee_schedule;

--specific column
SELECT type FROM employee_schedule;

--specific row
SELECT * FROM employee_schedule WHERE hours>4;
```
UPDATE (means modifying rows in a table).
```sql
UPDATE employee_schedule SET type='Fulltime';
```
DELETE (means removing rows from a table).
```sql
DELETE FROM employee_schedule WHERE type='part time';
```
</details>

### Queries for employee_schedule
1. Procedure to calculate the total number of hours worked by each employee:
```sql
```
2.
```sql
```
3. Procedure to identify employees who are eligible for overtime pay:
```sql
```
4.
```sql
```
5. Procedure to calculate the average working hours per employee type:
```sql
```

### event
<details>
<summary>
CRUD QUERIES </summary>

CREATE (means adding or inserting rows into a table).
```sql
INSERT INTO event (id, name, date, start_time, end_time, description, entry_fee, artist_id) VALUES
(1, 'Concert', '2023-12-01', '19:00:00', '24:00:00', 'Live music event', 20, 1);
```
READ (means selecting rows from a table).
```sql
--all
SELECT * FROM event;

--specific column
SELECT date FROM event;

--specific row
SELECT * FROM event WHERE date='2023-12-01';
```
UPDATE (means modifying rows in a table).
```sql
UPDATE event SET name='Christmas Party' WHERE id=5;
```
DELETE (means removing rows from a table).
```sql
DELETE FROM event WHERE id=1;
```
</details>

### Queries for event
1.
```sql
```
2.
```sql
```
3.
```sql
```
4.
```sql
```
5.
```sql
```

### event_employee
<details>
<summary>
CRUD QUERIES </summary>

CREATE (means adding or inserting rows into a table).
```sql
INSERT INTO event_employee (id, event_id, employee_id) VALUES (1, 1, 1);
```
READ (means selecting rows from a table).
```sql
--all
SELECT * FROM event_employee;

--specific row
SELECT * FROM event_employee WHERE event_id=3;
```
UPDATE (means modifying rows in a table).
```sql
UPDATE event_employee SET event_id=1 WHERE employee_id=5;
```
DELETE (means removing rows from a table).
```sql
DELETE FROM event_employee WHERE id=3;
```
</details>

### Queries for event_employee
1.
```sql
```
2.
```sql
```
3.
```sql
```
4.
```sql
```
5.
```sql
```

### inventory
<details>
<summary>
CRUD QUERIES </summary>

CREATE (means adding or inserting rows into a table).
```sql
INSERT INTO inventory (itemId, item_name, item_type, item_code, quantity, price) VALUES (1, 'Vodka', 'Drinks', 1111, 80, 50);
```
READ (means selecting rows from a table).
```sql
--all
SELECT * FROM inventory;

--specific column
SELECT item_name FROM inventory;

--specific row
SELECT * FROM inventory WHERE quantity<10;
```
UPDATE (means modifying rows in a table).
```sql
UPDATE inventory SET quantity=1000;
```
DELETE (means removing rows from a table).
```sql
DELETE FROM inventory WHERE itemId=2;
```
</details>

### Queries for inventory
1.
```sql
```
2.
```sql
```
3.
```sql
```
4. Procedure to update the stock level for an item:
```sql
DELIMITER $$

CREATE PROCEDURE update_stock_level(IN item_id INT, IN quantity_change INT)
BEGIN
  DECLARE new_stock INT;

  SELECT quantity INTO new_stock
  FROM inventory
  WHERE item_id = item_id;

  IF NOT FOUND THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Item not found in inventory';
  END IF;

  UPDATE inventory
  SET quantity = new_stock + quantity_change
  WHERE item_id = item_id;
END; $$
DELIMITER ;

```
5.
```sql
```

### membership
<details>
<summary>
CRUD QUERIES </summary>

CREATE (means adding or inserting rows into a table).
```sql
INSERT INTO membership (id, type, description, preferences, status) VALUES (1, 'Premium', 'Premium membership', 'VIP access', 'Active');
```
READ (means selecting rows from a table).
```sql
--all
SELECT * FROM membership;

--specific column
SELECT type, preferences FROM membership;

--specific row
SELECT * FROM membership WHERE type='premium';
```
UPDATE (means modifying rows in a table).
```sql
UPDATE membership SET status = 'Nonactive';
```
DELETE (means removing rows from a table).
```sql
DELETE FROM membership WHERE id=2;
```
</details>

### Queries for membership
1. Get members with specific preferences:
```sql
DELIMITER $$

CREATE PROCEDURE getMembersWithPreferences(IN preferred_features VARCHAR(50))
BEGIN
    SELECT *
    FROM membership
    WHERE preferences LIKE CONCAT('%', preferred_features, '%');
END; $$
DELIMITER ;

```
2. Procedure to identify memberships with a high likelihood of renewal:
-- membresia pronta a renovaciones de cliente 0 o 1
```sql
CREATE PROCEDURE identify_high_renewal_likelihood_memberships()
BEGIN
  DECLARE membership_id INT;
  DECLARE renewal_likelihood DECIMAL(10,2);

  SELECT membership.id AS membership_id,
         AVG(membership.renewal_history) AS renewal_likelihood
  FROM membership
  GROUP BY membership.id
  HAVING renewal_likelihood > 0.8;

  SET renewal_likelihood = renewal_likelihood;
END;

```
3.
```sql
```
4.
```sql
```
5.
```sql
```

### receipt
<details>
<summary>
CRUD QUERIES </summary>

CREATE (means adding or inserting rows into a table).
```sql
INSERT INTO receipt (id, table_id, datetime, payment_method) VALUES (1, 1, '2023-12-01 20:30:00', 'credit card');
```
READ (means selecting rows from a table).
```sql
--all
SELECT * FROM receipt;

--specific column
SELECT table_id, peyment_method FROM receipt;

--specific row
SELECT * FROM receipt WHERE table_id=3;
```
UPDATE (means modifying rows in a table).
```sql
UPDATE receipt SET payment_method='Cash';
```
DELETE (means removing rows from a table).
```sql
DELETE FROM receipt WHERE table_id=4;
```
</details>

### Queries for receipt
1. Procedure to identify customers who have exceeded a certain spending limit:
```sql
CREATE PROCEDURE high_spending_customers()
BEGIN
  DECLARE customer_id INT;
  DECLARE total_spent INT;
  DECLARE spending_limit INT;

  SELECT customer.id AS customer_id,
         SUM(receipt.total_amount) AS total_spent
  FROM receipt
  JOIN reservation ON receipt.reservation_id = reservation.id
  JOIN customer ON reservation.customer_id = customer.id
  GROUP BY customer.id
  HAVING total_spent > spending_limit;

  SET total_spent = total_spent;
END;


SET @spending_limit = 100;
CALL high_spending_customers();

```
2. Procedure to view the average receipt amount per customer type:
```sql
DELIMITER $$
CREATE PROCEDURE calculate_average_receipt_amount_per_customer_type_and_event_type()
BEGIN
  DECLARE customer_type ENUM('Premium','Basic','Gold','Silver');
  DECLARE event_type ENUM('Concert','Party','Comedy Show');
  DECLARE average_amount INT;

  SELECT membership.type AS customer_type,
         event.type AS event_type,
         AVG(receipt.total_amount) AS average_amount
  FROM receipt
  JOIN reservation ON receipt.reservation_id = reservation.id
  JOIN customer ON reservation.customer_id = customer.id
  JOIN membership ON customer.membership_id = membership.id
  JOIN event ON reservation.event_id = event.id
  GROUP BY membership.type, event.type;

  SET average_amount = average_amount;
END; $$
DELIMITER ;

```
3.
```sql
```
4.
```sql
```
5.  Procedure to identify receipts with a high likelihood of fraud:
```sql
CREATE PROCEDURE identify_fraudulent_receipts()
BEGIN
  DECLARE receipt_id INT;
  DECLARE fraud_likelihood DECIMAL(10,2);

  SELECT receipt.id AS receipt_id,
         AVG(receipt.item_quantity) AS average_item_quantity
  FROM receipt
  JOIN consumption ON receipt.id = consumption.receipt_id
  GROUP BY receipt.id
  HAVING average_item_quantity > 5;

  SET fraud_likelihood = fraud_likelihood;
END;

```

### reservation
<details>
<summary>
CRUD QUERIES </summary>

CREATE (means adding or inserting rows into a table).
```sql
INSERT INTO reservation (id, customer_id, event_id, date, table_id, number_of_people, payment_status) VALUES (1, 1, 1, '2023-12-01', 1, 4, 0);
```
READ (means selecting rows from a table).
```sql
--all
SELECT * FROM reservation;

--specific column
SELECT customer_id FROM reservation;

--specific row
SELECT * FROM reservation WHERE customer_id=3;
```
UPDATE (means modifying rows in a table).
```sql
UPDATE reservation SET payment_status=1;
```
DELETE (means removing rows from a table).
```sql
DELETE FROM reservation WHERE customer_id=2;
```
</details>

### Queries for reservation
1. Calculate Total Revenue for an Event:
```sql
```
2. Cancel Reservations with Unpaid Entry Fees:
```sql
```
3.  Procedure to generate a report on the average reservation amount per customer type:
```sql
DELIMITER $$

CREATE PROCEDURE averageReservationPerCustomerType()
BEGIN
  DECLARE customer_type ENUM('Premium','Basic','Gold','Silver');
  DECLARE average_amount INT;

  DECLARE average_reservation_cursor CURSOR FOR
    SELECT customer.type AS customer_type,
           AVG(receipt.total_amount) AS average_amount
    FROM reservation
    JOIN customer ON reservation.customer_id = customer.id
    JOIN receipt ON reservation.id = receipt.reservation_id
    GROUP BY customer.type;

  OPEN average_reservation_cursor;

  average_reservation_loop: LOOP
    FETCH average_reservation_cursor INTO customer_type, average_amount;

    IF NOT FOUND THEN
      LEAVE average_reservation_loop;
    END IF;

    UPDATE customer
    SET average_reservation_amount = average_amount
    WHERE type = customer_type;
  END LOOP;

  CLOSE average_reservation_cursor;
END; $$
DELIMITER ;

```
4.
```sql
```
5.
```sql
DELIMITER $$

CREATE PROCEDURE send_confirmation()
BEGIN
  DECLARE reservation_id INT;
  DECLARE customer_email VARCHAR(255);

  DECLARE new_reservation_cursor CURSOR FOR
    SELECT reservation.id AS reservation_id, customer.email AS customer_email
    FROM reservation
    JOIN customer ON reservation.customer_id = customer.id
    WHERE reservation.payment_status = 0;

  OPEN new_reservation_cursor;

  reservation_loop: LOOP
    FETCH new_reservation_cursor INTO reservation_id, customer_email;

    IF NOT FOUND THEN
      LEAVE reservation_loop;
    END IF;

    SET @email_subject = 'Your Reservation is Confirmed';
    SET @email_body = 'Dear Customer,

    Your reservation for Event has been confirmed.

    Sincerely,

    The Nightclub Team';

    UPDATE reservation
    SET payment_status = 1
    WHERE id = reservation_id;
  END LOOP;

  CLOSE new_reservation_cursor;
END; $$

DELIMITER ;

```