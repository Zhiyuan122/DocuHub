# DocuHub Rails Setup Guide

## 🚀 Quick Start

This project has been converted from Node.js to Ruby on Rails. Follow these steps to set up the Rails version:

### 1. Clean up Node.js files (if needed)
```bash
# Run the cleanup script
cleanup.bat
```

### 2. Install Ruby dependencies
```bash
# Install gems
bundle install
```

### 3. Setup database
```bash
# Create database
rails db:create

# Run migrations
rails db:migrate

# Seed initial data
rails db:seed
```

### 4. Start the Rails server
```bash
# Start development server
rails server
```

### 5. Access the application
- Homepage: http://localhost:3000
- Admin Panel: http://localhost:3000/admin

## 🔧 Default Admin Account
- Username: `admin`
- Password: `admin123`

## 📁 Project Structure
```
DocuHub/
├── app/
│   ├── controllers/     # Rails controllers
│   ├── models/         # ActiveRecord models
│   ├── uploaders/      # CarrierWave uploaders
│   └── views/          # Rails views
├── config/             # Rails configuration
├── db/                 # Database migrations & seeds
├── Gemfile            # Ruby dependencies
└── README.md          # Project documentation
```

## 🗑️ Files to Remove (Node.js leftovers)
- `node_modules/` - Node.js dependencies
- `docuhub.db` - SQLite database (Node.js version)
- `uploads/` - Upload directory (Node.js version)
- `public/` - Static files (Node.js version)

## ✅ What's New (Rails Version)
- ✅ Ruby on Rails 7.1 backend
- ✅ PostgreSQL database
- ✅ CarrierWave file uploads
- ✅ JWT authentication
- ✅ RESTful API design
- ✅ ActiveRecord models
- ✅ Database migrations
- ✅ Rails conventions

## 🆚 Version Comparison

| Feature | Node.js Version | Rails Version |
|---------|----------------|---------------|
| Backend | Express.js | Ruby on Rails |
| Database | SQLite | PostgreSQL |
| File Upload | Multer | CarrierWave |
| Authentication | JWT + bcrypt | JWT + bcrypt |
| API Design | Custom | RESTful |
| Code Organization | Custom | Rails conventions |

The Rails version provides better structure, conventions, and maintainability while maintaining all the same functionality. 