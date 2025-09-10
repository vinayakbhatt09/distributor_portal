# 🚀 Complete Deployment Guide with GoDaddy Domain & Auto-Updates

## Overview
This guide will help you deploy your Distributor Portal online using your GoDaddy domain with automatic updates whenever you make changes in Cursor.

## 🎯 Recommended Setup: Vercel + GoDaddy + GitHub

### Why This Setup?
- ✅ **Vercel**: Best for Next.js apps, free tier, automatic deployments
- ✅ **GitHub**: Version control + automatic deployments
- ✅ **GoDaddy**: Your custom domain
- ✅ **Auto-Updates**: Every change in Cursor automatically deploys

---

## Step 1: Set Up GitHub Repository

### 1.1 Create GitHub Repository
1. Go to [github.com](https://github.com) and sign in
2. Click "New repository"
3. Name: `distributor-portal`
4. Description: `Distributor Portal - Admin & Distributor Dashboard`
5. Set to **Public** (required for free Vercel)
6. Check "Add a README file"
7. Click "Create repository"

### 1.2 Push Your Code to GitHub
```bash
# Initialize git (if not already done)
git init

# Add all files
git add .

# Commit changes
git commit -m "Initial commit - Distributor Portal"

# Add your GitHub repository as origin
git remote add origin https://github.com/YOUR_USERNAME/distributor-portal.git

# Push to GitHub
git branch -M main
git push -u origin main
```

---

## Step 2: Deploy to Vercel

### 2.1 Connect Vercel to GitHub
1. Go to [vercel.com](https://vercel.com)
2. Sign up with GitHub account
3. Click "New Project"
4. Import your `distributor-portal` repository
5. Click "Import"

### 2.2 Configure Vercel Settings
1. **Project Name**: `distributor-portal` (or your preferred name)
2. **Framework Preset**: Next.js (auto-detected)
3. **Root Directory**: `./` (default)
4. **Build Command**: `npm run build` (default)
5. **Output Directory**: `.next` (default)

### 2.3 Set Environment Variables
In Vercel dashboard:
1. Go to your project → Settings → Environment Variables
2. Add these variables:

```
JWT_SECRET = your-super-secret-jwt-key-here-32-characters-minimum
JWT_REFRESH_SECRET = your-super-secret-refresh-key-here-32-characters-minimum
```

**Generate secure keys:**
```bash
# Use this command to generate secure keys
node -e "console.log('JWT_SECRET=' + require('crypto').randomBytes(32).toString('hex'))"
node -e "console.log('JWT_REFRESH_SECRET=' + require('crypto').randomBytes(32).toString('hex'))"
```

### 2.4 Deploy
1. Click "Deploy"
2. Wait for deployment to complete
3. You'll get a URL like: `https://distributor-portal-xyz.vercel.app`

---

## Step 3: Connect Your GoDaddy Domain

### 3.1 Get Your Domain Ready
1. Log into your GoDaddy account
2. Go to "My Products" → "All Products and Services"
3. Find your domain and click "DNS" or "Manage DNS"

### 3.2 Configure DNS in Vercel
1. In Vercel dashboard, go to your project
2. Click "Settings" → "Domains"
3. Add your domain: `yourdomain.com`
4. Add www subdomain: `www.yourdomain.com`

### 3.3 Update GoDaddy DNS Records
In GoDaddy DNS management, add these records:

```
Type: A
Name: @
Value: 76.76.19.61
TTL: 600

Type: CNAME
Name: www
Value: cname.vercel-dns.com
TTL: 600
```

**Alternative (if A record doesn't work):**
```
Type: CNAME
Name: @
Value: cname.vercel-dns.com
TTL: 600

Type: CNAME
Name: www
Value: cname.vercel-dns.com
TTL: 600
```

### 3.4 SSL Certificate
Vercel automatically provides SSL certificates. Wait 24-48 hours for DNS propagation and SSL setup.

---

## Step 4: Set Up Automatic Updates (CI/CD)

### 4.1 Configure Vercel for Auto-Deploy
1. In Vercel dashboard → Settings → Git
2. Ensure "Auto Deploy" is enabled
3. Set branch to `main` (or `master`)

### 4.2 Workflow for Updates
Every time you make changes in Cursor:

```bash
# 1. Make your changes in Cursor
# 2. Stage changes
git add .

# 3. Commit changes
git commit -m "Description of changes"

# 4. Push to GitHub
git push origin main

# 5. Vercel automatically deploys! 🚀
```

### 4.3 Vercel CLI (Optional)
For advanced users:
```bash
# Install Vercel CLI
npm i -g vercel

# Login to Vercel
vercel login

# Link to your project
vercel link

# Deploy from command line
vercel --prod
```

---

## Step 5: Production Configuration

### 5.1 Update Environment Variables
Create `.env.production` file:
```env
JWT_SECRET=your-production-jwt-secret
JWT_REFRESH_SECRET=your-production-refresh-secret
NODE_ENV=production
```

### 5.2 Optimize for Production
Update `next.config.js`:
```javascript
/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',
  images: {
    domains: ['yourdomain.com'],
  },
  env: {
    CUSTOM_KEY: process.env.CUSTOM_KEY,
  },
}

module.exports = nextConfig
```

---

## Step 6: Monitoring & Maintenance

### 6.1 Vercel Analytics
1. Enable Vercel Analytics in dashboard
2. Monitor performance and errors
3. Set up alerts for failures

### 6.2 Custom Domain Management
- **Primary Domain**: `yourdomain.com`
- **Redirects**: `www.yourdomain.com` → `yourdomain.com`
- **SSL**: Automatic HTTPS

### 6.3 Backup Strategy
- Code is backed up in GitHub
- Database uses mock data (no external backup needed)
- Vercel handles infrastructure backups

---

## 🎉 You're Live!

### Your Live URLs:
- **Main Site**: `https://yourdomain.com`
- **Admin Dashboard**: `https://yourdomain.com/admin/dashboard`
- **Distributor Portal**: `https://yourdomain.com/dashboard`

### Default Login Credentials:
- **Admin**: `admin@example.com` / `Admin@123`
- **Distributor**: `distributor1@example.com` / `distributor123`

---

## 🔄 Daily Workflow

1. **Make changes in Cursor**
2. **Test locally**: `npm run dev`
3. **Commit changes**: `git add . && git commit -m "Update description"`
4. **Push to GitHub**: `git push origin main`
5. **Vercel auto-deploys** (takes 1-2 minutes)
6. **Changes are live!** 🚀

---

## 🆘 Troubleshooting

### Common Issues:

**1. Domain not working:**
- Wait 24-48 hours for DNS propagation
- Check DNS records in GoDaddy
- Verify domain in Vercel dashboard

**2. Build failures:**
- Check Vercel build logs
- Ensure all environment variables are set
- Test locally with `npm run build`

**3. SSL issues:**
- Wait for SSL certificate generation
- Check domain configuration in Vercel

**4. Auto-deploy not working:**
- Check GitHub webhook settings
- Verify Vercel project settings
- Check branch configuration

---

## 📞 Support

- **Vercel Support**: [vercel.com/support](https://vercel.com/support)
- **GoDaddy Support**: [support.godaddy.com](https://support.godaddy.com)
- **GitHub Support**: [support.github.com](https://support.github.com)

---

## 🎯 Next Steps After Deployment

1. **Update DNS records** in GoDaddy
2. **Test all features** on live site
3. **Set up monitoring** and alerts
4. **Create user accounts** for your team
5. **Customize branding** and content
6. **Set up backup procedures**

Your Distributor Portal will be live and automatically update with every change you make! 🚀

