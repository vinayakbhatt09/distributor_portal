/** @type {import('next').NextConfig} */
const nextConfig = {
  experimental: {
    serverComponentsExternalPackages: ['@prisma/client', 'bcryptjs'],
  },
  images: {
    domains: ['localhost', 'vercel.app'],
  },
  // Ensure proper output for Vercel
  output: 'standalone',
}

module.exports = nextConfig
