# CIS 344 - Freelance Writer Portfolio

## Project Description

This project is a database system designed to manage a freelance
writer's clients, projects, articles, and writing services.

The project was developed for CIS 344 during Fall 2026.

## Entities

The database contains the following entities/tables:

- CLIENT
- PROJECT
- ARTICLE
- SERVICE
- PROJECT_SERVICE

## Relationships

- CLIENT 1:N PROJECT
- PROJECT 1:N ARTICLE
- PROJECT 1:N PROJECT_SERVICE
- SERVICE 1:N PROJECT_SERVICE

The PROJECT_SERVICE table resolves the many-to-many relationship
between PROJECT and SERVICE.

## Database

The database was developed using:

- MySQL
- MySQL Workbench
- SQL

## Project Contents

### ER-Diagrams

Contains the Chen ER diagram and UML-style ER diagram.

### SQL

Contains the SQL scripts used to work with the database.

### MySQL-Workbench

Contains the MySQL Workbench model file (.mwb).

### Documentation

Contains the system design and requirements research.

### Report

Contains the final project report.

## Database Tables

### CLIENT

Stores information about clients.

### PROJECT

Stores freelance writing projects associated with clients.

### ARTICLE

Stores articles associated with projects.

### SERVICE

Stores writing services offered by the freelancer.

### PROJECT_SERVICE

Associates projects with the services used for those projects.

## Author

Eshwar Basdeo

## Course

CIS 344 - Fall 2026
