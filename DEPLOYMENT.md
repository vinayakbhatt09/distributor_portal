# 🚀 Distributor Portal Deployment Guide

## Quick Deploy to Vercel (Recommended)

### Prerequisites
- GitHub account
- Vercel account (free at vercel.com)

### Step 1: Push to GitHub
1. Create a new repository on GitHub
2. Push your code:
```bash
git init
git add .
git commit -m "Initial commit - Distributor Portal"
git branch -M main
git remote add origin https://github.com/yourusername/distributor-portal.git
git push -u origin main
```

### Step 2: Deploy to Vercel
1. Go to [vercel.com](https://vercel.com)
2. Sign in with GitHub
3. Click "New Project"
4. Import your repository
5. Configure environment variables:
   - `JWT_SECRET`: Generate a random string (32+ characters)
   - `JWT_REFRESH_SECRET`: Generate another random string (32+ characters)
6. Click "Deploy"

### Step 3: Configure Environment Variables
In Vercel dashboard:
1. Go to your project settings
2. Navigate to "Environment Variables"
3. Add:
   - `JWT_SECRET`: `your-super-secret-jwt-key-here-32-chars-min`
   - `JWT_REFRESH_SECRET`: `your-super-secret-refresh-key-here-32-chars-min`

## Alternative: Deploy to Netlify

### Step 1: Build the Project
```bash
npm run build
```

### Step 2: Deploy
1. Go to [netlify.com](https://netlify.com)
2. Drag and drop your `.next` folder
3. Or connect your GitHub repository

## Alternative: Deploy to Railway

### Step 1: Install Railway CLI
```bash
npm install -g @railway/cli
```

### Step 2: Deploy
```bash
railway login
railway init
railway up
```

## Environment Variables Required

```env
JWT_SECRET=your-super-secret-jwt-key-here
JWT_REFRESH_SECRET=your-super-secret-refresh-key-here
```

## Features Included
- ✅ Admin Dashboard
- ✅ Distributor Dashboard  
- ✅ Product Management
- ✅ Order Management
- ✅ Announcement System
- ✅ Credit Management
- ✅ User Authentication
- ✅ Mock Database (no external database required)

## Notes
- The application uses a mock database by default
- No external database setup required
- All features work out of the box
- Responsive design for mobile and desktop

