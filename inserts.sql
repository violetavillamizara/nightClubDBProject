INSERT INTO employee_schedule (id, type, hours, enter_hour, exit_hour) VALUES
(1, 'full-time', 9, '17:00:00', '02:00:00'),
(2, 'part-time', 4, '21:00:00', '01:00:00');

INSERT INTO disco_table (tableId, location) VALUES
(1, 'Main Hall'),
(2, 'Rooftop'),
(3, 'Outdoor'),
(4, 'Rooftop'),
(5, 'Main Hall');

INSERT INTO artist (id, name, description, phone, music_gender) VALUES
(1, 'John Doe Band', 'Rock band', 123456789, 'Rock'),
(2, 'Speaker Name', 'Keynote speaker', 987654321, 'Techno'),
(3, 'Don Peso', 'Popular music Specialist ', 657654328, 'Popular'),
(4, 'Plan B', 'Perreo King', 484754351, 'Regaetton'),
(5, 'Milter Tone', 'Classic Ones', 997694311, 'Vallenato');

INSERT INTO membership (id, type, description, preferences, status) VALUES
(1, 'Premium', 'Premium membership', 'VIP access', 'Active'),
(2, 'Basic', 'Basic membership', 'Standard access', 'Active'),
(3, 'Gold', 'Exclusive membership', 'VIP lounge access', 'Active'),
(4, 'Silver', 'Standard membership', 'Regular discounts', 'Active');

INSERT INTO event (id, name, date, start_time, end_time, description, entry_fee, artist_id) VALUES
(1, 'Concert', '2023-12-01', '19:00:00', '24:00:00', 'Live music event', 20, 1),
(2, 'Techno Night', '2023-12-10', '21:00:00', '01:00:00', 'Special DJ', 15, 2),
(3, 'Hot Party', '2023-12-15', '21:00:00', '01:00:00', 'The best Duo', 5, 4),
(4, 'For Agriculturals', '2023-12-20', '20:00:00', '24:00:00', 'Corridos Night', 10, 3),
(5, 'Vallenato Lovers', '2023-12-29', '19:00:00', '23:00:00', 'Acordeon Music', 7, 5);

INSERT INTO employee (id, name, last_name, role, phone, email, gender, date_of_birth, address, schedule_id) VALUES
(1, 'John', 'Doe', 'Waiter', 555123456, 'john.doe@example.com', 'Male', '1990-01-15', '123 Main St', 1),
(2, 'Jane', 'Smith', 'Manager', 555987654, 'jane.smith@example.com', 'Female', '1985-05-20', '456 Oak St', 2),
(3, 'David', 'Garcia', 'Chef', 555333444, 'david.garcia@example.com', 'Male', '1980-08-25', '789 Oak St', 1),
(4, 'Emily', 'Rodriguez', 'Server', 555666777, 'emily.rodriguez@example.com', 'Female', '1992-02-10', '456 Maple St', 2),
(5, 'Michael', 'Lopez', 'Bartender', 555999888, 'michael.lopez@example.com', 'Male', '1987-06-15', '123 Birch St', 1),
(6, 'Sophia', 'Martinez', 'Hostess', 555222111, 'sophia.martinez@example.com', 'Female', '1993-11-30', '789 Pine St', 2);

INSERT INTO customer (id, name, last_name, gender, date_of_birth, phone, email, address, membership_id) VALUES
(1, 'Alice', 'Johnson', 'Female', '1988-07-10', 555111223, 'alice.johnson@example.com', '789 Pine St', 1),
(2, 'Bob', 'Miller', 'Male', '1995-03-22', 555444556, 'bob.miller@example.com', '101 Elm St', 2),
(3, 'Daniel', 'Taylor', 'Male', '1985-04-15', 555333111, 'daniel.taylor@example.com', '789 Cedar St', 3),
(4, 'Olivia', 'Hernandez', 'Female', '1990-09-20', 555777888, 'olivia.hernandez@example.com', '456 Pine St', 4),
(5, 'Aiden', 'Gonzalez', 'Male', '1993-12-08', 555444555, 'aiden.gonzalez@example.com', '123 Oak St', 3);

INSERT INTO receipt (id, table_id, datetime, payment_method) VALUES
(1, 1, '2023-12-01 20:30:00', 'credit card'),
(2, 2, '2023-12-05 21:15:00', 'cash'),
(3, 1, '2023-12-03 20:30:00', 'credit card'),
(4, 4, '2023-12-10 21:15:00', 'cash'),
(5, 5, '2023-12-01 19:50:00', 'cash');

INSERT INTO event_employee (id, event_id, employee_id) VALUES
(1, 1, 1),
(2, 2, 2),
(3,3,3),
(4,4,4),
(5,5,5);

INSERT INTO inventory (itemId, item_name, item_type, item_code, quantity, price) VALUES
(1, 'Vodka', 'Drinks', 1111, 80, 50),
(2, 'Aguardiente', 'Drinks', 2222, 100, 20),
(3, 'Nachos', 'Food', 3433, 200, 15),
(4, 'Vuse', 'Vapes', 4444, 80, 10),
(5, 'Paradise Coco', 'Cocktails', 5555, 50, 10);

INSERT INTO consumption (id, item_id, quantity, receipt_id) VALUES
(1, 1, 2, 1),
(2, 2, 5, 2),
(3, 1, 3, 3),
(4, 2, 6, 4),
(5, 4, 3, 5);

INSERT INTO reservation (id, customer_id, event_id, date, table_id, number_of_people, payment_status) VALUES
(1, 1, 1, '2023-12-01', 1, 4, 0),
(2, 2, 2, '2023-12-01', 2, 8, 1),
(3, 5, 4, '2023-12-01', 1, 5, 1),
(4, 3, 5, '2023-12-01', 2, 8, 0),
(5, 4, 3, '2023-12-01', 4, 4, 1);