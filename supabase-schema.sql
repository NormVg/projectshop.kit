-- =============================================
-- ProjectShop Database Schema
-- Run this in your Supabase SQL Editor
-- =============================================

-- IMPORTANT: Also create a storage bucket in Supabase Dashboard:
-- 1. Go to Storage > Create new bucket
-- 2. Name: "project-thumbnails"
-- 3. Set to Public bucket
-- 4. Allow file types: image/*

-- Create projects table
CREATE TABLE IF NOT EXISTS projects (
  id UUID DEFAULT gen_random_uuid() PRIMARY KEY,
  name TEXT NOT NULL,
  slug TEXT UNIQUE NOT NULL,
  description TEXT,
  content TEXT,
  price INTEGER DEFAULT 0,
  category TEXT,
  badge TEXT,
  thumbnail_url TEXT,
  file_url TEXT,
  is_active BOOLEAN DEFAULT true,
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- Enable Row Level Security
ALTER TABLE projects ENABLE ROW LEVEL SECURITY;

-- Allow public read access (no auth required)
CREATE POLICY "Public read access" ON projects
  FOR SELECT
  USING (true);

-- Allow public insert (for admin panel - no auth)
CREATE POLICY "Public insert access" ON projects
  FOR INSERT
  WITH CHECK (true);

-- Allow public update (for admin panel - no auth)
CREATE POLICY "Public update access" ON projects
  FOR UPDATE
  USING (true);

-- Allow public delete (for admin panel - no auth)
CREATE POLICY "Public delete access" ON projects
  FOR DELETE
  USING (true);

-- =============================================
-- STORAGE POLICIES (Required for file uploads)
-- Run this to fix "400" upload errors
-- =============================================

-- =============================================
-- STORAGE SETUP (Run this if you get "Bucket not found")
-- =============================================

-- 1. Create the bucket (Safe to run multiple times)
INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES ('project-thumbnails', 'project-thumbnails', true, 5242880, ARRAY['image/*'])
ON CONFLICT (id) DO NOTHING;

-- 2. Allow public uploads to 'project-thumbnails' bucket
CREATE POLICY "Public upload access" ON storage.objects
  FOR INSERT
  WITH CHECK (bucket_id = 'project-thumbnails');

-- 3. Allow public updates
CREATE POLICY "Public update access" ON storage.objects
  FOR UPDATE
  USING (bucket_id = 'project-thumbnails');

-- 4. Allow public reads (if not already public)
CREATE POLICY "Public read access" ON storage.objects
  FOR SELECT
  USING (bucket_id = 'project-thumbnails');

-- =============================================
-- Seed Data - Sample Projects
-- =============================================

INSERT INTO projects (name, slug, description, content, price, category, badge, is_active) VALUES
('Portfolio Boomer', 'portfolio-boomer', 'One of the best selling prog type. Perfect for students looking to showcase their web development skills.',
'# Portfolio Boomer

A stunning portfolio template designed for developers and designers.

## Features

- Modern, responsive design
- Dark/Light theme support
- Easy customization
- Projects showcase
- Contact form integration

## Tech Stack

- Vue 3
- Nuxt 3
- CSS3 Animations
- Responsive Design

## What You Get

- Complete source code
- Documentation
- Free updates
- Email support',
1900, 'Web', 'Bestseller', true),

('Growth Rocket', 'growth-rocket', 'High growth potential mobile app starter kit with modern architecture.',
'# Growth Rocket

A powerful mobile app starter kit for ambitious developers.

## Features

- Cross-platform support
- Push notifications
- User authentication
- Analytics integration

## Tech Stack

- React Native
- Expo
- Firebase',
2500, 'Mobile', 'Popular', true),

('Steady Stream', 'steady-stream', 'Consistent and reliable API backend template for any project.',
'# Steady Stream

A robust API template that just works.

## Features

- RESTful API design
- Authentication & Authorization
- Database integration
- Rate limiting',
1500, 'API', '', true),

('Tech Titan', 'tech-titan', 'Tech-focused full-stack portfolio with impressive animations.',
'# Tech Titan

Stand out with this impressive full-stack showcase.

## Features

- Full-stack architecture
- Real-time features
- Cloud deployment ready
- CI/CD pipeline included',
2200, 'Full Stack', 'New', true),

('Value Vault', 'value-vault', 'Value investing picks with solid backend architecture.',
'# Value Vault

A solid backend template with great value.

## Features

- Secure authentication
- Database optimization
- Caching layer
- API documentation',
1800, 'Backend', '', true),

('AI Advantage', 'ai-advantage', 'AI-focused project showcasing machine learning integration.',
'# AI Advantage

Showcase your AI/ML skills with this project.

## Features

- ML model integration
- Data visualization
- Real-time predictions
- Model training pipeline',
2700, 'AI/ML', 'Hot', true),

('Crypto Craze', 'crypto-craze', 'Blockchain and crypto project with Web3 integration.',
'# Crypto Craze

Enter the world of Web3 with this blockchain project.

## Features

- Smart contract integration
- Wallet connection
- Token management
- NFT support',
3000, 'Blockchain', 'New', true),

('Innovation Index', 'innovation-index', 'Innovative companies tracker with modern UI.',
'# Innovation Index

Track and showcase innovative companies.

## Features

- Real-time data
- Beautiful charts
- API integration
- Responsive design',
2600, 'AI/ML', 'Hot', true),

('Global Explorer', 'global-explorer', 'International exposure mobile app with maps integration.',
'# Global Explorer

A mobile app showcasing global data.

## Features

- Maps integration
- Location services
- Multi-language support
- Offline mode',
2400, 'Mobile', 'Popular', true),

('Green Future', 'green-future', 'Sustainable investments tracker with eco-friendly design.',
'# Green Future

A sustainability-focused full-stack app.

## Features

- ESG scoring
- Investment tracking
- Carbon footprint calculator
- Green recommendations',
2100, 'Full Stack', 'New', true);

-- Verify the data was inserted
SELECT name, slug, price, category, badge FROM projects ORDER BY created_at;
