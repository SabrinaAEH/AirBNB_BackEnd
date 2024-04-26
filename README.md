## Airbnb Backend

# Introduction

This project aims to create the back-end of an application similar to Airbnb. It involves modeling the database and setting up relationships between different entities.

### Technologies Used:

Ruby version: 3.2.2  
Rails version: 7.3.1.2  
PostgreSQL 16.2

### Features:

The application will allow users to:  
Search for accommodations in various cities in France.  
View details of available accommodations, such as the number of beds, price per night, presence of wifi, etc.  
Make reservations with a start date, end date, and duration.  
Prevent reservations on accommodations already booked for the same dates.  
View past and future reservations.

### Gems:

Usage of the Faker gem:  
The Faker gem will be used to generate fake data to populate the database.  
Usage of the table_print gem:  
The table_print gem will be used to display data in a tabular format in the Rails console.

### This README provides guidance on setting up and running the application:

Ruby version:  
Ensure you have Ruby version 3.2.2 installed.

Database creation:  
Run rails db:create to create the application database.

Database initialization:  
Run rails db:migrate to initialize the database schema.

Thanks!
