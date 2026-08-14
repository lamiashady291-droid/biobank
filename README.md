# Biobank and Biospecimen Management System

## Project Overview

This project is a relational database system designed to manage
donors, consent records, biological samples, collection events,
storage locations, researchers, test requests, and sample usage.

## Database Management System

MySQL

## Main Features

- Donor management
- Consent management
- Biological sample management
- Collection event management
- Storage location management
- Researcher management
- Test request management
- Sample usage tracking
- SQL queries and joins
- Aggregation and subqueries
- Views
- Trigger
- Primary and foreign key constraints

## Database Tables

The database contains the following main tables:

1. Donors
2. Consent
3. SampleTypes
4. StorageLocations
5. CollectionEvents
6. Samples
7. Researchers
8. TestRequests
9. TestRequestSamples
10. SampleUsage

## Project Files

### SQL

The SQL folder contains:

- create_tables.sql
- load_data.sql
- queries.sql
- views.sql
- triggers_procedures.sql

### Diagrams

The diagrams folder contains:

- ERD.png

## How to Run the Project

1. Open MySQL Workbench.
2. Execute create_tables.sql.
3. Execute load_data.sql.
4. Execute views.sql.
5. Execute triggers_procedures.sql.
6. Execute queries.sql.
## Bonus: Connected User Interface

The project includes a Python Tkinter graphical user interface connected directly to the MySQL database.

### Technologies Used

- Python
- Tkinter
- MySQL Connector/Python
- MySQL

### How to Run the GUI

1. Make sure MySQL Server is running.
2. Open the project folder in Visual Studio Code.
3. Make sure Python is installed.
4. Install MySQL Connector/Python using:

   ```bash
   python -m pip install mysql-connector-python
## Database Features

The database uses primary keys, foreign keys, unique constraints,
NOT NULL constraints, views, joins, aggregation, subqueries,
and a trigger to maintain data integrity.

## Conclusion

The project provides a structured relational database for managing
biobank and biospecimen information efficiently and securely.