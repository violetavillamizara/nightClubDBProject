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

```
READ (means selecting rows from a table).
```sql

```
UPDATE (means modifying rows in a table).
```sql

```
DELETE (means removing rows from a table).
```sql

```
### consumption
> CRUD QUERIES

CREATE (means adding or inserting rows into a table).
```sql

```
READ (means selecting rows from a table).
```sql

```
UPDATE (means modifying rows in a table).
```sql

```
DELETE (means removing rows from a table).
```sql

```
### customer
> CRUD QUERIES

CREATE (means adding or inserting rows into a table).
```sql

```
READ (means selecting rows from a table).
```sql

```
UPDATE (means modifying rows in a table).
```sql

```
DELETE (means removing rows from a table).
```sql

```
### disco_table
> CRUD QUERIES

CREATE (means adding or inserting rows into a table).
```sql

```
READ (means selecting rows from a table).
```sql

```
UPDATE (means modifying rows in a table).
```sql

```
DELETE (means removing rows from a table).
```sql

```
### employee
> CRUD QUERIES

CREATE (means adding or inserting rows into a table).
```sql

```
READ (means selecting rows from a table).
```sql

```
UPDATE (means modifying rows in a table).
```sql

```
DELETE (means removing rows from a table).
```sql

```
### employee_schedule
> CRUD QUERIES

CREATE (means adding or inserting rows into a table).
```sql

```
READ (means selecting rows from a table).
```sql

```
UPDATE (means modifying rows in a table).
```sql

```
DELETE (means removing rows from a table).
```sql

```
### event
> CRUD QUERIES

CREATE (means adding or inserting rows into a table).
```sql

```
READ (means selecting rows from a table).
```sql

```
UPDATE (means modifying rows in a table).
```sql

```
DELETE (means removing rows from a table).
```sql

```
### event_employee
> CRUD QUERIES

CREATE (means adding or inserting rows into a table).
```sql

```
READ (means selecting rows from a table).
```sql

```
UPDATE (means modifying rows in a table).
```sql

```
DELETE (means removing rows from a table).
```sql

```
### inventory
> CRUD QUERIES

CREATE (means adding or inserting rows into a table).
```sql

```
READ (means selecting rows from a table).
```sql

```
UPDATE (means modifying rows in a table).
```sql

```
DELETE (means removing rows from a table).
```sql

```
### membership
> CRUD QUERIES

CREATE (means adding or inserting rows into a table).
```sql

```
READ (means selecting rows from a table).
```sql

```
UPDATE (means modifying rows in a table).
```sql

```
DELETE (means removing rows from a table).
```sql

```
### receipt
> CRUD QUERIES

CREATE (means adding or inserting rows into a table).
```sql

```
READ (means selecting rows from a table).
```sql

```
UPDATE (means modifying rows in a table).
```sql

```
DELETE (means removing rows from a table).
```sql

```
### reservation
> CRUD QUERIES

CREATE (means adding or inserting rows into a table).
```sql

```
READ (means selecting rows from a table).
```sql

```
UPDATE (means modifying rows in a table).
```sql

```
DELETE (means removing rows from a table).
```sql

```