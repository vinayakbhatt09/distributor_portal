# PowerShell script to start the development server with environment variables
$env:JWT_SECRET="your-super-secret-jwt-key-here-make-it-very-long-and-secure-12345"
$env:JWT_REFRESH_SECRET="your-super-secret-refresh-jwt-key-here-make-it-very-long-and-secure-67890"
$env:DATABASE_URL="postgresql://username:password@localhost:5432/distributor_portal"

Write-Host "Starting development server with environment variables..."
npm run dev

