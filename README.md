# Introduction
Build a web app for sharing YouTube videos, key features:
* Login
* Sharing YouTube videos
* Real-time notifications for new video shares

# Prerequisites
* Backend: Rails 
* Frontend: React
* Database: Sqlite3 for locally, Postgresql for prod

# Installation & Configuration
Run commands follow step by step
## Rails - Backend
* git clone https://github.com/hongtran/videosharing.git
* cd videosharing
* bundle install

## React - Frontend
* git clone https://github.com/hongtran/videosharingUI.git
* cd videosharingUI
* npm install

# Database Setup
For local we using sqlite3, for prod using Postgresql
* rails db:migrate
* rails db:seed

# Running the Application
## Rails - Backend
rails server
## React - Frontend
Update file env local with API url of backend above, then run
* npm start

# Usage
* Open homepage on browser, then login with user1: `john@example.com/password`
* Open homepage on private mode or other browser, then login with user2: `jane@example.com/password`
* Back to user1, click link `Share a movie` on top menu, then enter any link youtbube and title
* Will display notification popup on user2

# Troubleshooting
