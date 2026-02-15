# Firebase Hosting Deployment Guide

## Step 1: Install Node.js (if not installed)
1. Download from: https://nodejs.org/
2. Install the LTS version
3. Verify installation:
```bash
node --version
npm --version
```

## Step 2: Install Firebase CLI
Open Command Prompt or PowerShell and run:
```bash
npm install -g firebase-tools
```

## Step 3: Login to Firebase
```bash
firebase login
```
This will open your browser - sign in with your Google account.

## Step 4: Create Firebase Project
1. Go to: https://console.firebase.google.com/
2. Click "Add project"
3. Enter project name: `muluken-portfolio` (or any name you want)
4. Disable Google Analytics (not needed for hosting)
5. Click "Create project"

## Step 5: Initialize Firebase in Your Project
Navigate to your project folder:
```bash
cd C:\portifolio\cybersecurity_portfolio
```

Initialize Firebase:
```bash
firebase init hosting
```

Answer the questions:
- **Use an existing project?** → Yes
- **Select your project** → Choose the project you created
- **What do you want to use as your public directory?** → `build/web`
- **Configure as a single-page app?** → Yes
- **Set up automatic builds with GitHub?** → No
- **Overwrite index.html?** → No

## Step 6: Build Your Flutter Web App
```bash
flutter build web --release
```

## Step 7: Deploy to Firebase
```bash
firebase deploy
```

## Step 8: Access Your Live Website
After deployment completes, you'll see:
```
✔  Deploy complete!

Hosting URL: https://muluken-portfolio.web.app
```

Your portfolio is now LIVE on the internet! 🎉

## Update Your Portfolio Later
When you make changes:
```bash
# 1. Build the updated version
flutter build web --release

# 2. Deploy
firebase deploy
```

## Add Custom Domain (Optional)
1. Go to Firebase Console → Hosting
2. Click "Add custom domain"
3. Follow instructions to connect your domain (like mulukenassefa.com)

## Useful Commands
```bash
# View your site locally before deploying
firebase serve

# View deployment history
firebase hosting:channel:list

# Rollback to previous version
firebase hosting:clone SOURCE_SITE_ID:SOURCE_CHANNEL_ID TARGET_SITE_ID:live
```

## Troubleshooting

### Error: "Firebase command not found"
- Restart your terminal after installing Firebase CLI
- Or add to PATH: `C:\Users\YourName\AppData\Roaming\npm`

### Error: "Not authorized"
```bash
firebase logout
firebase login
```

### Error: "Project not found"
- Make sure you created the project in Firebase Console
- Run `firebase projects:list` to see available projects

## Your Portfolio Features
✓ Free hosting forever
✓ Free SSL certificate (HTTPS)
✓ Fast global CDN
✓ Automatic scaling
✓ 10 GB storage
✓ 360 MB/day bandwidth (free tier)

## Cost
**FREE** - Firebase Spark Plan includes:
- Hosting: 10 GB storage, 360 MB/day bandwidth
- Perfect for portfolio websites
- No credit card required

---

**Need Help?**
- Firebase Docs: https://firebase.google.com/docs/hosting
- Flutter Web Docs: https://docs.flutter.dev/deployment/web
