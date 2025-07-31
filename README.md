# DocuHub - Document Submission & Tracking System (Rails Version)

DocuHub is a secure and reliable document submission and tracking system built with Ruby on Rails. It allows users to securely upload documents, receive unique tracking codes, and query processing status. The system simulates how legal or medical professionals exchange important files with transparency and security.

## 🚀 Features

### User Features
- **Document Upload**: Supports drag and drop upload, PDF, Word, images, text files
- **Tracking Code Generation**: Each document automatically generates a unique tracking code
- **Status Query**: Real-time query of document processing status via tracking code
- **Status History**: View complete processing history of documents
- **Responsive Design**: Modern user interface, supports mobile devices

### Admin Features
- **Secure Login**: JWT authenticated admin login system
- **Document Management**: View all submitted document lists
- **Status Updates**: Update document processing status and add notes
- **Statistics Panel**: Real-time display of document processing statistics
- **Status History**: Record detailed information for each status update

## 🔧 Technology Stack

- **Backend**: Ruby on Rails 7.1
- **Database**: PostgreSQL
- **File Upload**: CarrierWave
- **Authentication**: JWT + bcrypt
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **UI Framework**: Bootstrap 5 + Font Awesome
- **Development Tools**: Hot reload with Rails

## 📦 Installation and Setup

### Prerequisites
- Ruby 3.4.5 or higher
- PostgreSQL
- Node.js (for asset compilation)

### Installation Steps

1. **Clone the project**
   ```bash
   git clone <repository-url>
   cd DocuHub
   ```

2. **Install dependencies**
   ```bash
   bundle install
   ```

3. **Setup database**
   ```bash
   rails db:create
   rails db:migrate
   rails db:seed
   ```

4. **Start the server**
   ```bash
   rails server
   ```

5. **Access the application**
   - Homepage: http://localhost:3000
   - Admin Panel: http://localhost:3000/admin

## 🎯 Usage Guide

### User Workflow

1. **Submit Document**
   - Visit http://localhost:3000
   - Click "Submit Document" tab
   - Drag and drop files to upload area or click to select file
   - Add optional notes
   - Click "Submit Document" button
   - Save the generated tracking code

2. **Check Status**
   - Click "Check Status" tab
   - Enter your tracking code
   - Click "Search" button
   - View document information and processing history

### Admin Workflow

1. **Login to Admin Panel**
   - Visit http://localhost:3000/admin
   - Login with default account:
     - Username: `admin`
     - Password: `admin123`

2. **Manage Documents**
   - View all submitted documents
   - Click "Update Status" button
   - Select new status and add notes
   - Save updates

## 📁 Project Structure

```
DocuHub/
├── app/
│   ├── controllers/
│   │   ├── api/
│   │   │   ├── documents_controller.rb
│   │   │   └── admin/
│   │   │       ├── sessions_controller.rb
│   │   │       └── documents_controller.rb
│   │   ├── pages_controller.rb
│   │   ├── admin_controller.rb
│   │   └── documents_controller.rb
│   ├── models/
│   │   ├── document.rb
│   │   ├── status_history.rb
│   │   └── admin.rb
│   ├── uploaders/
│   │   └── document_uploader.rb
│   └── views/
│       └── pages/
│           └── home.html.erb
├── config/
│   ├── application.rb
│   ├── routes.rb
│   ├── database.yml
│   └── environments/
├── db/
│   ├── migrate/
│   └── seeds.rb
├── Gemfile
└── README_RAILS.md
```

## 🔒 Security Features

- **File Type Validation**: Only allows safe file types to be uploaded
- **File Size Limitation**: Maximum 10MB file size limit
- **JWT Authentication**: Admin login uses JWT tokens
- **Password Encryption**: Uses bcrypt to encrypt stored passwords
- **Security Headers**: Uses Rails security features
- **CORS Protection**: Cross-origin request protection

## 📊 Database Structure

### documents table
- `id`: Primary key
- `tracking_code`: Unique tracking code
- `original_filename`: Original filename
- `file`: Uploaded file path
- `file_size`: File size
- `mime_type`: File type
- `status`: Processing status
- `notes`: Notes information
- `created_at`: Creation time
- `updated_at`: Update time

### status_histories table
- `id`: Primary key
- `document_id`: Document ID (foreign key)
- `status`: Status
- `notes`: Notes
- `updated_at`: Update time

### admins table
- `id`: Primary key
- `username`: Username
- `email`: Email address
- `password_digest`: Encrypted password
- `role`: User role
- `created_at`: Creation time
- `updated_at`: Update time

## 🚀 Deployment

### Local Development
```bash
rails server
```

### Production Environment
1. Set environment variables
   ```bash
   export RAILS_ENV=production
   export DATABASE_URL=postgresql://user:password@localhost/docuhub_production
   ```

2. Deploy with Capistrano or similar
   ```bash
   cap production deploy
   ```

## 🔧 Configuration Options

### File Upload Configuration
- Maximum file size: 10MB
- Supported file types: PDF, Word, Images, Text files
- Storage location: `public/uploads/` directory

### Database Configuration
- Database type: PostgreSQL
- Automatic table structure creation via migrations

### Security Configuration
- JWT secret: Uses Rails credentials
- Default admin account: admin/admin123

## 🐛 Troubleshooting

### Common Issues

1. **Port is occupied**
   ```bash
   # Change port
   rails server -p 3001
   ```

2. **File upload failure**
   - Check if file size exceeds 10MB
   - Confirm if file type is supported
   - Check uploads directory permissions

3. **Database error**
   - Run `rails db:reset` to reset database
   - Check database connection settings

4. **Admin login failure**
   - Confirm username: `admin`
   - Confirm password: `admin123`
   - Check JWT configuration

## 🤝 Contributing

Welcome to submit Issues and Pull Requests to improve this project!
