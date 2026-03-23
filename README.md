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

1. Clone the repository:

   ```bash
git clone <git@git.us.qwasar.io:my_basecamp_1_206352_crkt8z/my_basecamp_1.git>
cd my_basecamp_1
```

2. Install dependencies:

   ```bash
bundle install
```

3. Create and migrate the database and seed sample data:

   ```bash
bin/rails db:setup
bin/rails db:seed
```

4. Start the Rails server:

   ```bash
bin/rails server
```

5. Open in browser: http://localhost:3000

## MyBaseCamp2 Features
- User authentication and authorization (`User`, `Session`).
- Project management with membership + admin roles.
- Attachments for projects (file upload + delete). 
- Threaded discussions inside a project (`ProjectThread`).
- Messaging within threads (`Message`), edit/delete permissions for authors/admin.

## Deployment
This Rails app is compatible with Heroku/Render/AWS.

1. Set environment variables for production secrets.
2. Run migrations:

```bash
bin/rails db:migrate
bin/rails db:seed
```

3. Deploy through your provider.

## Live URL
- Deployed app URL (example placeholder): `https://mybasecamp2.example.com`

## Default users (seeded)
- admin@example.com / password
- member@example.com / password



### The Core Team
Abednego Bulus (bulus_a)
<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>
