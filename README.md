Inventory Management System

*******************************************
## Introduction
*******************************************
The Inventory Management System (IMS) is a comprehensive tool designed to help businesses and inventory managers maintain and track their inventory, manage customer orders, and streamline their product management processes. Built with efficiency and usability in mind, our IMS offers a robust solution for optimizing stock levels and enhancing operational workflows.

*******************************************
## APP STATMENT
*******************************************
An app that helps businesses and inventory managers who want to streamline inventory operations and optimize stock levels by tracking products and managing orders effortlessly.


*******************************************
## FEATURES
*******************************************
- **Product Management:** Add, view, update, and delete products in the inventory.
- **Order Processing:** Create, view, update, and delete orders placed by customers.
- **Customer Management:** Manage customer information and track their orders.


*******************************************
## DATABASE SCHEME
*******************************************
The following schema represents the structure of the database used in the Inventory Management System:

### Customers Table
| Column          | Data Type        | Constraints      |
|-----------------|------------------|------------------|
| customer_id     | UUID             | Primary Key      |
| name            | String           |                  |
| email           | String           |                  |
| address         | String           |                  |
| phone_number    | String           |                  |

### Products Table
| Column               | Data Type        | Constraints      |
|----------------------|------------------|------------------|
| product_id           | UUID             | Primary Key      |
| name                 | String           |                  |
| description          | String           |                  |
| price                | Decimal          |                  |
| quantity_in_stock    | Integer          |                  |

### Orders Table
| Column            | Data Type        | Constraints      |
|-------------------|------------------|------------------|
| order_id          | UUID             | Primary Key      |
| customer_id       | UUID             | Foreign Key      |
| product_id        | UUID             | Foreign Key      |
| order_date        | Date             |                  |
| status            | String           |                  |
  
*******************************************
## SCREAN SHOOT
*******************************************
**Create New Customer**
<table role="presentation">
  <tr>
    <td align="center">
      <img width="600" alt="Screenshot 2024-02-25 at 11 23 10 AM" src="https://github.com/Afrah-saleh/IMS_project/assets/147046034/49c829fb-7a94-4ed8-9457-706354160461">
      <br>Add New Customer
    </td>
    <td align="center">
      <img width="600" alt="Screenshot 2024-02-25 at 11 23 32 AM" src="https://github.com/Afrah-saleh/IMS_project/assets/147046034/73e9cffc-ef92-4a0a-aaa8-c89a13d30039">
      <br>** new Customer in postgress
    </td>
  </tr>
</table>

**Delelt Producte**
<table role="presentation">
  <tr>
    <td align="center">
    <img width="924" alt="Screenshot 2024-02-25 at 11 42 49 AM" src="https://github.com/Afrah-saleh/IMS_project/assets/147046034/ff0f73fa-908c-4b66-8b3f-2714a21bc036">
      <br>** Preducts before delete
    </td>
    <td align="center">
      <img width="1277" alt="Screenshot 2024-02-25 at 11 43 37 AM" src="https://github.com/Afrah-saleh/IMS_project/assets/147046034/73a116b8-12e0-41be-ae68-5a0be2f45be1">
      <br>** Delete product
    </td>
        <td align="center">
      <img width="926" alt="Screenshot 2024-02-25 at 11 43 59 AM" src="https://github.com/Afrah-saleh/IMS_project/assets/147046034/88dc3c6f-2462-47b1-9404-eae14914c965">
      <br>** Products after delete
    </td>
  </tr>
</table>

- **Get All Orders**
  <img width="1292" alt="Screenshot 2024-02-25 at 11 45 02 AM" src="https://github.com/Afrah-saleh/IMS_project/assets/147046034/493359e3-eff1-42a2-bbcc-915baaa4c97e">
  <img width="1227" alt="Screenshot 2024-02-25 at 11 45 28 AM" src="https://github.com/Afrah-saleh/IMS_project/assets/147046034/e63cece3-21ad-4b74-ab82-04f09526b93f">

- **Update Order**
 <img width="1227" alt="Screenshot 2024-02-25 at 11 45 28 AM" src="https://github.com/Afrah-saleh/IMS_project/assets/147046034/e63cece3-21ad-4b74-ab82-04f09526b93f">
 <img width="1288" alt="Screenshot 2024-02-25 at 11 47 55 AM" src="https://github.com/Afrah-saleh/IMS_project/assets/147046034/5e655073-7ca9-427b-991f-7106da5e4d4d">
<img width="1232" alt="Screenshot 2024-02-25 at 11 48 23 AM" src="https://github.com/Afrah-saleh/IMS_project/assets/147046034/d9ce0672-cdc0-4d19-8d32-c616feddfc4d">

*******************************************
## TECHNOLOGY USED
*******************************************
- **Backend**: Swift with the Vapor framework to create a reliable and scalable server-side application.
- **Database**: PostgreSQL for robust, enterprise-grade database management.

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



