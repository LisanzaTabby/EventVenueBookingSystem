-- Creating the database
CREATE DATABASE EventManagementDB;

-- Select Database to use
Use EventManagementDB;

-- Creating Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    phone VARCHAR(20),
    role ENUM('organizer', 'attendee') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Creating Event Categories
CREATE TABLE Event_Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL UNIQUE
);

-- Creating Venues Table
CREATE TABLE Venues (
    venue_id INT AUTO_INCREMENT PRIMARY KEY,
    venue_name VARCHAR(100) NOT NULL,
    address TEXT NOT NULL,
    capacity INT NOT NULL,
    contact_email VARCHAR(100),
    contact_phone VARCHAR(20)
);

-- Creating Events Table
CREATE TABLE Events (
    event_id INT AUTO_INCREMENT PRIMARY KEY,
    event_name VARCHAR(100) NOT NULL,
    description TEXT,
    event_date DATE NOT NULL,
    start_time TIME,
    end_time TIME,
    organizer_id INT NOT NULL,
    venue_id INT NOT NULL,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (organizer_id) REFERENCES Users(user_id),
    FOREIGN KEY (venue_id) REFERENCES Venues(venue_id),
    FOREIGN KEY (category_id) REFERENCES Event_Categories(category_id)
);

-- Creating Bookings Table
CREATE TABLE Bookings (
    booking_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    event_id INT NOT NULL,
    booking_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    number_of_seats INT DEFAULT 1,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (event_id) REFERENCES Events(event_id),
    UNIQUE(user_id, event_id)
);

-- Creating Payments Table
CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    booking_id INT NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('Credit Card', 'Mobile Money', 'Cash') NOT NULL,
    payment_status ENUM('Pending', 'Completed', 'Failed') DEFAULT 'Pending',
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES Bookings(booking_id)
);

-- Inserting Sample Data to the tables
-- Users (5 organizers, 5 attendees)
INSERT INTO Users (full_name, email, phone, role) VALUES
('Alice Wanjiku', 'alice@eventhub.com', '0710000001', 'organizer'),
('Brian Otieno', 'brian@live.com', '0710000002', 'attendee'),
('Caroline Kimani', 'caroline@events.org', '0710000003', 'organizer'),
('Daniel Kiptoo', 'daniel@mail.com', '0710000004', 'attendee'),
('Emily Njeri', 'emily@host.com', '0710000005', 'organizer'),
('Felix Owino', 'felix@demo.com', '0710000006', 'attendee'),
('Grace Chebet', 'grace@events.com', '0710000007', 'organizer'),
('Henry Mwaura', 'henry@attendee.com', '0710000008', 'attendee'),
('Irene Mutua', 'irene@organize.com', '0710000009', 'organizer'),
('John Mwangi', 'john@guest.com', '0710000010', 'attendee');

-- inserting the Event Categories values
INSERT INTO Event_Categories (category_name) VALUES
('Conference'), ('Wedding'), ('Concert'), ('Seminar'),
('Workshop'), ('Exhibition'), ('Fundraiser'), ('Meetup'),
('Festival'), ('Networking');

-- inserting the Venues values
INSERT INTO Venues (venue_name, address, capacity, contact_email, contact_phone) VALUES
('Nairobi Conference Center', 'Haile Selassie Avenue, Nairobi', 500, 'ncc@venues.com', '0701000001'),
('Mombasa Beach Hotel', 'Beach Road, Mombasa', 300, 'mbh@venues.com', '0701000002'),
('KICC Rooftop', 'City Square, Nairobi', 250, 'kicc@venues.com', '0701000003'),
('Garden Estate Grounds', 'Thika Road, Nairobi', 800, 'geg@venues.com', '0701000004'),
('Eldoret Hall', 'Market Street, Eldoret', 200, 'eld@venues.com', '0701000005'),
('Kisumu Pavilion', 'Lake Road, Kisumu', 350, 'kp@venues.com', '0701000006'),
('Thika Plaza', 'Main Road, Thika', 150, 'tp@venues.com', '0701000007'),
('Machakos Park', 'Town Center, Machakos', 600, 'mp@venues.com', '0701000008'),
('Kitale Square', 'CBD, Kitale', 100, 'ks@venues.com', '0701000009'),
('Malindi Convention Center', 'Beachside, Malindi', 450, 'mcc@venues.com', '0701000010');

-- inserting the Events values
INSERT INTO Events (event_name, description, event_date, start_time, end_time, organizer_id, venue_id, category_id) VALUES
('Tech Summit Kenya', 'Technology & innovation event', '2025-06-01', '09:00:00', '17:00:00', 1, 1, 1),
('Coastal Wedding Expo', 'Wedding planners showcase', '2025-08-12', '12:00:00', '18:00:00', 3, 2, 2),
('Jazz in the City', 'Live jazz concert', '2025-07-25', '18:00:00', '22:00:00', 5, 3, 3),
('Healthcare Forum', 'Medical networking seminar', '2025-09-10', '10:00:00', '16:00:00', 7, 4, 4),
('Startup Bootcamp', 'Entrepreneurship training', '2025-10-05', '08:00:00', '17:00:00', 9, 5, 5),
('Food Fest Kenya', 'Culinary event & festival', '2025-11-15', '11:00:00', '19:00:00', 1, 6, 9),
('Charity Gala', 'Fundraising dinner for orphans', '2025-12-20', '18:30:00', '22:00:00', 3, 7, 7),
('Youth Empowerment', 'Motivational talks and music', '2025-06-18', '13:00:00', '18:00:00', 5, 8, 6),
('Women in Tech', 'Networking for women in IT', '2025-07-01', '09:30:00', '14:00:00', 7, 9, 10),
('Art & Culture Fair', 'Art exhibition with cultural shows', '2025-08-28', '10:00:00', '17:00:00', 9, 10, 6);

-- inserting the Bookings values
INSERT INTO Bookings (user_id, event_id, number_of_seats) VALUES
(2, 1, 2),
(4, 2, 1),
(6, 3, 3),
(8, 4, 1),
(10, 5, 2),
(2, 6, 1),
(4, 7, 4),
(6, 8, 2),
(8, 9, 1),
(10, 10, 2);

-- inserting the Payments values
INSERT INTO Payments (booking_id, amount, payment_method, payment_status) VALUES
(1, 1000.00, 'Mobile Money', 'Completed'),
(2, 1500.00, 'Credit Card', 'Completed'),
(3, 3000.00, 'Cash', 'Completed'),
(4, 1200.00, 'Mobile Money', 'Pending'),
(5, 1800.00, 'Credit Card', 'Completed'),
(6, 950.00, 'Cash', 'Completed'),
(7, 4000.00, 'Mobile Money', 'Completed'),
(8, 2100.00, 'Credit Card', 'Pending'),
(9, 1150.00, 'Mobile Money', 'Completed'),
(10, 2300.00, 'Credit Card', 'Completed');
-- Sample queries to test the database

-- Get All events organized by each organizer
SELECT u.full_name AS organizer, e.event_name, e.event_date
FROM Events e
JOIN Users u ON e.organizer_id = u.user_id
WHERE u.role = 'organizer';

-- Get total payments received per event
SELECT e.event_name, SUM(p.amount) AS total_paid
FROM Payments p
JOIN Bookings b ON p.booking_id = b.booking_id
JOIN Events e ON b.event_id = e.event_id
GROUP BY e.event_name;

-- Get all bookings with user and event names, and number of seats booked
SELECT b.booking_id, u.full_name AS attendee, e.event_name, b.number_of_seats
FROM Bookings b
JOIN Users u ON b.user_id = u.user_id
JOIN Events e ON b.event_id = e.event_id;