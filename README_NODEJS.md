# DocuHub - Document Submission & Tracking System

DocuHub is a secure and reliable document submission and tracking system that allows users to securely upload documents, receive unique tracking codes, and query processing status. The system simulates how legal or medical professionals exchange important files with transparency and security.

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

- **Backend**: Node.js + Express.js
- **Database**: SQLite3 (lightweight, no additional installation required)
- **File Upload**: Multer
- **Security**: Helmet, bcryptjs, JWT
- **Frontend**: HTML5, CSS3, JavaScript (ES6+)
- **UI Framework**: Bootstrap 5 + Font Awesome
- **Development Tools**: Nodemon (hot reload)

## 📦 Installation and Setup

### Prerequisites
- Node.js (version 14 or higher)
- npm or yarn

### Installation Steps

1. **Clone the project**
   ```bash
   git clone <repository-url>
   cd DocuHub
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start the server**
   ```bash
   # Production environment
   npm start
   
   # Development environment (hot reload)
   npm run dev
   ```

4. **Access the application**
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
├── server.js              # Main server file
├── package.json           # Project configuration
├── .gitignore            # Git ignore file
├── README.md             # Project documentation
├── public/               # Static files
│   ├── index.html        # Homepage
│   ├── admin.html        # Admin page
│   ├── app.js           # Frontend JavaScript
│   └── admin.js         # Admin JavaScript
├── uploads/              # Upload file storage (auto-created)
└── docuhub.db           # SQLite database (auto-created)
```

## 🔒 Security Features

- **File Type Validation**: Only allows safe file types to be uploaded
- **File Size Limitation**: Maximum 10MB file size limit
- **JWT Authentication**: Admin login uses JWT tokens
- **Password Encryption**: Uses bcrypt to encrypt stored passwords
- **Security Headers**: Uses Helmet to set secure HTTP headers
- **CORS Protection**: Cross-origin request protection

## 📊 Database Structure

### documents table
- `id`: Primary key
- `tracking_code`: Unique tracking code
- `filename`: Server filename
- `original_name`: Original filename
- `file_size`: File size
- `mime_type`: File type
- `status`: Processing status
- `submitted_at`: Submission time
- `updated_at`: Update time
- `notes`: Notes information

### status_history table
- `id`: Primary key
- `document_id`: Document ID (foreign key)
- `status`: Status
- `notes`: Notes
- `updated_at`: Update time

### admins table
- `id`: Primary key
- `username`: Username
- `password_hash`: Encrypted password
- `created_at`: Creation time

## 🚀 Deployment

### Local Deployment
```bash
npm start
```

### Production Environment Deployment
1. Set environment variables
   ```bash
   export PORT=3000
   export NODE_ENV=production
   ```

2. Deploy with PM2
   ```bash
   npm install -g pm2
   pm2 start server.js --name docuhub
   ```

## 🔧 Configuration Options

### File Upload Configuration
- Maximum file size: 10MB
- Supported file types: PDF, Word, Images, Text files
- Storage location: `uploads/` directory

### Database Configuration
- Database type: SQLite3
- Database file: `docuhub.db`
- Automatic table structure creation

### Security Configuration
- JWT secret: `your-secret-key` (change for production environment)
- Default admin account: admin/admin123

## 🐛 Troubleshooting

### Common Issues

1. **Port is occupied**
   ```bash
   # Change port
   PORT=3001 npm start
   ```

2. **File upload failure**
   - Check if file size exceeds 10MB
   - Confirm if file type is supported
   - Check uploads directory permissions

3. **Database error**
   - Delete `docuhub.db` file and restart
   - Check database file permissions

4. **Admin login failure**
   - Confirm username: `admin`
   - Confirm password: `admin123`
   - Check JWT configuration

## 🤝 Contributing

Welcome to submit Issues and Pull Requests to improve this project!

## 📄 License

MIT License

## 📞 Support

If you encounter any issues or have suggestions, please create an Issue or contact the development team.
