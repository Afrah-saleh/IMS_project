# Inventory Management System

## Introduction
The Inventory Management System (IMS) is a comprehensive tool designed to help businesses and inventory managers maintain and track their inventory, manage customer orders, and streamline their product management processes. Built with efficiency and usability in mind, our IMS offers a robust solution for optimizing stock levels and enhancing operational workflows.

## App statement
An app that helps businesses and inventory managers who want to streamline inventory operations and optimize stock levels by tracking products and managing orders effortlessly.

## Features
- **Product Management**: Efficiently manage your product lifecycle by adding, viewing, updating, and deleting inventory items.
- **Order Processing**: Seamlessly create and manage orders, ensuring customer satisfaction.
- **Customer Management**: Maintain a central repository of customer information and track their orders.

## Database Schema
The following schema represents the structure of the database used in the Inventory Management System:


### Customers Table
- customer_id (Primary Key, UUID)
- name (String)
- email (String)
- address (String)
- phone_number (String)

### Products Table
- product_id (Primary Key, UUID)
- name (String)
- description (String)
- price (Decimal)
- quantity_in_stock (Integer)

### Orders Table
- order_id (Primary Key, UUID)
- customer_id (Foreign Key to Customers table, UUID)
- order_date (Date)
- status (String)
  
## Technologies Used
- **Backend**: Swift with the Vapor framework to create a reliable and scalable server-side application.
- **Database**: PostgreSQL for robust, enterprise-grade database management.
- **Frontend:** (If applicable)

*******************************************
## HOW TO USE IT 
*******************************************
### Prerequisites

Ensure you have the following installed:
- Xcode (for macOS)
- Swift
- PostgreSQL
- Postman (for API testing)

## Installation
1. Clone the repository: `git clone https://github.com/yourusername/inventory-management-system.git`
2. Navigate to the project directory: `cd inventory-management-system`
3. Install dependencies: `swift package resolve`

## Configuration
1. Initialize a PostgreSQL database according to the provided schema.
2. Update the database configuration settings in the `Config` directory.
   
## Running Migrations
1- Apply database migrations to prepare your database: `swift run App migrate`

## Usage
1. Start the server: `swift run`
2. Access the application in your web browser: `http://localhost:8080`



