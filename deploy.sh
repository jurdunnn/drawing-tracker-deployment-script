#!/bin/bash

# Cd into Sites Directory
cd ~/sites/

# Clone Repo
git clone https://github.com/jurdunnn/drawing-tracker.git 

# Copy populated .env into repo
cp ~/sites/.drawing-tracker-env ~/sites/drawing-tracker/.env

# Cd into repo
cd ~/sites/drawing-tracker/

# Composer Install
composer install

# npm Install
npm install

# Generate Encryption key
php artisan key:generate

# Migrate any new tables
php artisan migrate

# Run build
npm run build

# Cd into www
cd /var/www

# Remove old Site From /var/www
sudo rm -rf drawing-tracker

# Move repo to /var/www
sudo mv ~/sites/drawing-tracker ./

# Set Ownership
sudo chown -R www-data:www-data drawing-tracker 

# Set permissions
sudo chmod -R 775 drawing-tracker
