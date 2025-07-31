# DocuHub
A Secure Document Submission and Tracking System

# DocuHub – Document Submission & Tracking App

DocuHub is a full-stack web application that allows users to securely upload documents, receive a unique tracking number, and check the processing status. It simulates how legal or medical professionals exchange important files with transparency and security.

## 🚀 Features

- User-friendly document upload form
- RESTful API to store and track document submissions
- Admin panel to update processing status
- Status page with live updates via tracking code
- Clean and responsive UI (optional React frontend)
- PostgreSQL database integration

## 🔧 Technologies Used

- **Ruby** and **Ruby on Rails** for backend/API
- **PostgreSQL** for data storage
- **HTML/CSS/JavaScript** for frontend UI
- Optional: **React** for SPA experience
- **Git** for version control
- Optional: **Docker** for local development setup

## 🧪 How to Run

```bash
# Install dependencies
bundle install
yarn install   # if using webpacker + React

# Set up database
rails db:create
rails db:migrate

# Start server
rails server
