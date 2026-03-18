# Welcome to My Basecamp 1
This project is to recreate the core DNA of Basecamp, the legendary project management tool. 

## Task
The problem was to build a secure, relational web application from scratch and the challenge is using Ruby on Rails that handles:
Authentication: Secure registration and session management (Login/Logout).
Authorization: Multi-level permissions (Standard User vs. Admin).
Resource Management: Full CRUD (Create, Read, Update, Delete) operations for Projects.

## Description
I solved this by leveraging the MVC (Model-View-Controller) architecture of Ruby on Rails.
Backend: Used ActiveRecord to map User and Project entities. Users have a has_many relationship with Projects.
Security: Implemented has_secure_password using the bcrypt gem to ensure passwords are never stored in plain text.
Roles: Added a boolean is_admin flag to the User model with custom methods to promote or demote users.
Database: Structured with SQLite (development) to handle relational data integrity.

## Installation
To get this project running locally, follow these steps:
Clone the repository:
Bash
git clone <git@git.us.qwasar.io:my_basecamp_1_206352_crkt8z/my_basecamp_1.git>
cd MyBasecamp1
Install dependencies:
Bash
bundle install
Setup the database:
Bash
bin/rails db:prepare

## Usage
To start the local development server:
Bash
bin/rails server

### The Core Team
Abednego Bulus (bulus_a)
<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>
