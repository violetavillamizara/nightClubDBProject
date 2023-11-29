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
            Fields: ReservationID, CustomerID, TableNumber, Date.

## Relationships
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

# QUERIES

### artist
> CRUD QUERIES

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
### consumption
> CRUD QUERIES

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
### customer
> CRUD QUERIES

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
### disco_table
> CRUD QUERIES

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
### employee
> CRUD QUERIES

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
### employee_schedule
> CRUD QUERIES

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
### event
> CRUD QUERIES

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
### event_employee
> CRUD QUERIES

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
### inventory
> CRUD QUERIES

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
### membership
> CRUD QUERIES

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
### receipt
> CRUD QUERIES

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
### reservation
> CRUD QUERIES

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