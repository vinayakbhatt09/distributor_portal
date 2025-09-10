# 🚀 Distributor Portal Deployment Setup Script
# This script helps you set up automatic deployment with your GoDaddy domain

Write-Host "🚀 Setting up Distributor Portal Deployment..." -ForegroundColor Green

# Check if git is initialized
if (-not (Test-Path ".git")) {
    Write-Host "📦 Initializing Git repository..." -ForegroundColor Yellow
    git init
    git add .
    git commit -m "Initial commit - Distributor Portal"
} else {
    Write-Host "✅ Git repository already initialized" -ForegroundColor Green
}

# Check if Vercel CLI is installed
Write-Host "🔍 Checking for Vercel CLI..." -ForegroundColor Yellow
try {
    vercel --version | Out-Null
    Write-Host "✅ Vercel CLI is installed" -ForegroundColor Green
} catch {
    Write-Host "📦 Installing Vercel CLI..." -ForegroundColor Yellow
    npm install -g vercel
}

# Generate secure JWT secrets
Write-Host "🔐 Generating secure JWT secrets..." -ForegroundColor Yellow
$jwtSecret = -join ((1..32) | ForEach {Get-Random -InputObject @('a'..'z','A'..'Z','0'..'9')})
$jwtRefreshSecret = -join ((1..32) | ForEach {Get-Random -InputObject @('a'..'z','A'..'Z','0'..'9')})

Write-Host "Generated JWT_SECRET: $jwtSecret" -ForegroundColor Cyan
Write-Host "Generated JWT_REFRESH_SECRET: $jwtRefreshSecret" -ForegroundColor Cyan

# Create .env.local if it doesn't exist
if (-not (Test-Path ".env.local")) {
    Write-Host "Creating .env.local file..." -ForegroundColor Yellow
    $envContent = "JWT_SECRET=$jwtSecret`nJWT_REFRESH_SECRET=$jwtRefreshSecret"
    $envContent | Out-File -FilePath ".env.local" -Encoding UTF8
    Write-Host "✅ .env.local created with secure secrets" -ForegroundColor Green
}

# Test the build
Write-Host "🔨 Testing build process..." -ForegroundColor Yellow
try {
    npm run build
    Write-Host "✅ Build successful!" -ForegroundColor Green
} catch {
    Write-Host "❌ Build failed. Please fix errors before deploying." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🎉 Setup Complete! Next Steps:" -ForegroundColor Green
Write-Host "1. Create a GitHub repository" -ForegroundColor White
Write-Host "2. Push your code: git remote add origin <your-repo-url>" -ForegroundColor White
Write-Host "3. Push: git push -u origin main" -ForegroundColor White
Write-Host "4. Deploy to Vercel: vercel login && vercel" -ForegroundColor White
Write-Host "5. Connect your GoDaddy domain in Vercel dashboard" -ForegroundColor White
Write-Host ""
Write-Host "📖 See DEPLOYMENT_WITH_GODADDY.md for detailed instructions" -ForegroundColor Cyan
Write-Host ""
Write-Host "🔑 Your JWT secrets are saved in .env.local" -ForegroundColor Yellow
Write-Host "   Add these to Vercel environment variables:" -ForegroundColor Yellow
Write-Host "   JWT_SECRET=$jwtSecret" -ForegroundColor Gray
Write-Host "   JWT_REFRESH_SECRET=$jwtRefreshSecret" -ForegroundColor Gray
