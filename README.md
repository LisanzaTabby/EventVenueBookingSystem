# 📅 Event & Venue Booking System (MySQL Project)

## 📝 Project Description

This project is a **relational database system** built using **MySQL**, designed to manage event organization and venue bookings. It includes user roles (organizers and attendees), event categories, venues, event details, attendee bookings, and payments.

It simulates a real-world scenario such as an event management platform (e.g., Eventbrite or Peatix), with full support for:
- Creating and managing events
- Venue management
- Attendee bookings
- Payment tracking

The system uses **normalized relational tables** and demonstrates various SQL constraints and relationships including:
- 1-to-Many: Organizers to Events, Venues to Events
- Many-to-Many (through Bookings): Attendees to Events
- 1-to-1: Bookings to Payments

---

## 💻 How to Set Up and Run the Project

### Prerequisites
- MySQL Server (e.g., MySQL 8.0+)
- MySQL Workbench or any SQL client of your choice

### Setup Instructions
1. **Clone the Repository**
   ```bash
   git clone https://github.com/LisanzaTabby/EventVenueBookingSystem.git
   cd event-booking-system
2. **Open MySQL Workbench**
3. **Files>Open SQL Scripts**
4. **Then Execute it using the ⚡symbol on the mySQLBench**