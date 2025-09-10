# Distributor Portal

A full-stack distributor portal built with Next.js, React, TypeScript, Prisma, and PostgreSQL. Features include user authentication, product management, order processing, credit management, and admin controls.

## Features

### Distributor Features
- **Authentication**: Secure login/register with JWT tokens
- **Dashboard**: Credit summary, recent orders, notices
- **Product Catalog**: Browse products with filters and search
- **Order Management**: Place orders with credit validation
- **Credit Tracking**: Monitor credit limits and outstanding amounts
- **Returns/Refunds**: Submit and track return requests
- **Support System**: Submit support requests and get help

### Admin Features
- **User Management**: Manage distributors and set credit limits
- **Product CRUD**: Create, update, and manage products
- **Order Management**: View and update order statuses
- **Notice Management**: Post "Scheme of the Day" notices
- **Credit Management**: Set credit limits and payment terms
- **Returns Processing**: Approve/reject return requests
- **Marketing Assets**: Upload and distribute marketing materials

## Tech Stack

- **Frontend**: Next.js 14, React 18, TypeScript, Tailwind CSS
- **Backend**: Next.js API Routes, Prisma ORM
- **Database**: PostgreSQL
- **Authentication**: JWT with refresh tokens
- **Background Jobs**: BullMQ with Redis
- **File Storage**: AWS S3 (configurable)
- **Notifications**: Twilio WhatsApp, SendGrid Email

## Prerequisites

- Node.js 18+ 
- PostgreSQL 15+
- Redis 7+
- Docker & Docker Compose (optional)

## Quick Start

### 1. Clone and Install

```bash
git clone <repository-url>
cd distributor-portal
npm install
```

### 2. Environment Setup

Copy the environment file and configure your variables:

```bash
cp env.example .env.local
```

Update `.env.local` with your configuration:

```env
# Database
DATABASE_URL="postgresql://postgres:password@localhost:5432/distributor_portal"

# Redis
REDIS_URL="redis://localhost:6379"

# JWT Secrets (generate secure random strings)
JWT_SECRET="your-super-secret-jwt-key-here"
JWT_REFRESH_SECRET="your-super-secret-refresh-key-here"

# Other services (optional for development)
TWILIO_ACCOUNT_SID="your-twilio-account-sid"
TWILIO_AUTH_TOKEN="your-twilio-auth-token"
SENDGRID_API_KEY="your-sendgrid-api-key"
```

### 3. Start Services

Using Docker Compose (recommended):

```bash
npm run docker:up
```

Or manually start PostgreSQL and Redis.

### 4. Database Setup

```bash
# Generate Prisma client
npm run db:generate

# Run migrations
npm run db:migrate

# Seed database with sample data
npm run db:seed
```

### 5. Start Development Server

```bash
npm run dev
```

Visit [http://localhost:3000](http://localhost:3000) to see the application.

## Demo Credentials

After seeding the database, you can use these credentials:

### Admin User
- **Email**: admin@example.com
- **Password**: password123

### Distributor Users
- **Email**: dist1@example.com
- **Password**: password123
- **Email**: dist2@example.com
- **Password**: password123

## Project Structure

```
src/
├── app/                    # Next.js app directory
│   ├── api/               # API routes
│   │   ├── auth/          # Authentication endpoints
│   │   ├── products/      # Product management
│   │   ├── orders/        # Order processing
│   │   └── ...            # Other API endpoints
│   ├── dashboard/         # Distributor dashboard
│   ├── admin/             # Admin interface
│   └── globals.css        # Global styles
├── components/             # Reusable React components
├── lib/                    # Utility functions and configurations
│   ├── auth.ts            # Authentication utilities
│   ├── db.ts              # Database connection
│   ├── middleware.ts      # API middleware
│   └── validation.ts      # Zod validation schemas
└── types/                  # TypeScript type definitions

prisma/
├── schema.prisma          # Database schema
└── seed.ts               # Database seeding script
```

## API Endpoints

### Authentication
- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User login
- `POST /api/auth/refresh` - Refresh access token

### Products
- `GET /api/products` - List products (public)
- `POST /api/products` - Create product (admin only)
- `GET /api/products/:id` - Get product details
- `PUT /api/products/:id` - Update product (admin only)

### Orders
- `GET /api/orders` - List orders (authenticated)
- `POST /api/orders` - Create order (distributors only)
- `GET /api/orders/:id` - Get order details
- `PUT /api/orders/:id/status` - Update order status (admin only)

### Credit Management
- `GET /api/credit-account` - Get credit information
- `PUT /api/users/:id/credit` - Update credit limits (admin only)

### Notices
- `GET /api/notices/active` - Get active notices
- `POST /api/notices` - Create notice (admin only)

### Returns
- `POST /api/returns` - Submit return request
- `PUT /api/returns/:id` - Update return status (admin only)

## Development

### Available Scripts

```bash
# Development
npm run dev              # Start development server
npm run build            # Build for production
npm run start            # Start production server

# Database
npm run db:generate      # Generate Prisma client
npm run db:push          # Push schema to database
npm run db:migrate       # Run database migrations
npm run db:seed          # Seed database with sample data
npm run db:studio        # Open Prisma Studio

# Testing
npm run test             # Run tests
npm run test:watch       # Run tests in watch mode
npm run test:coverage    # Generate test coverage

# Docker
npm run docker:up        # Start services
npm run docker:down      # Stop services
```

### Code Quality

```bash
npm run lint             # Run ESLint
npm run format           # Format code with Prettier
```

## Testing

The project includes unit and integration tests:

```bash
# Run all tests
npm run test

# Run tests in watch mode
npm run test:watch

# Generate coverage report
npm run test:coverage
```

## Deployment

### Vercel (Frontend)

1. Connect your GitHub repository to Vercel
2. Set environment variables in Vercel dashboard
3. Deploy automatically on push to main branch

### Railway/Heroku (Backend & Database)

1. Create new project on Railway/Heroku
2. Add PostgreSQL addon
3. Set environment variables
4. Deploy from GitHub

### Environment Variables for Production

```env
NODE_ENV=production
DATABASE_URL="your-production-postgres-url"
REDIS_URL="your-production-redis-url"
JWT_SECRET="your-production-jwt-secret"
JWT_REFRESH_SECRET="your-production-refresh-secret"
```

## Background Jobs

The system uses BullMQ with Redis for background processing:

- **Auto-reorders**: Process scheduled reorders
- **Payment reminders**: Send automated payment notifications
- **Notice expiration**: Deactivate expired notices

Start the worker process:

```bash
npm run worker
```

## File Uploads

Marketing assets and product images can be stored in:

- **Development**: Local file system
- **Production**: AWS S3 or compatible storage

Configure in environment variables:

```env
AWS_ACCESS_KEY_ID="your-access-key"
AWS_SECRET_ACCESS_KEY="your-secret-key"
AWS_REGION="us-east-1"
AWS_S3_BUCKET="your-bucket-name"
```

## Security Features

- **Password Hashing**: bcrypt with salt rounds
- **JWT Authentication**: Secure token-based auth
- **Rate Limiting**: API endpoint protection
- **Input Validation**: Zod schema validation
- **CORS Protection**: Cross-origin request handling
- **SQL Injection Prevention**: Prisma ORM protection

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## License

This project is licensed under the MIT License.

## Support

For support and questions:

- Create an issue in the GitHub repository
- Check the documentation
- Review the API specifications

## Roadmap

- [ ] Mobile app (React Native)
- [ ] Advanced analytics dashboard
- [ ] Multi-language support
- [ ] Advanced reporting
- [ ] Integration with accounting software
- [ ] Real-time notifications
- [ ] Advanced inventory management
