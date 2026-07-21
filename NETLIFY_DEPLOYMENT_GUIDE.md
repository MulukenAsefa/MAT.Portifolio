# Deploy Flutter Portfolio to Netlify

## Method 1: Deploy via Netlify CLI (Recommended)

### Step 1: Install Netlify CLI
```bash
npm install -g netlify-cli
```

### Step 2: Build your Flutter app
```bash
flutter build web --release --web-renderer html
```

### Step 3: Login to Netlify
```bash
netlify login
```

### Step 4: Deploy
```bash
netlify deploy --prod --dir=build/web
```

---

## Method 2: Deploy via Netlify Website (Easiest)

### Step 1: Build your Flutter app locally
```bash
flutter build web --release --web-renderer html
```

### Step 2: Go to Netlify
1. Visit https://app.netlify.com/
2. Sign up or log in with GitHub/GitLab/Bitbucket/Email

### Step 3: Deploy
1. Click "Add new site" → "Deploy manually"
2. Drag and drop the `build/web` folder
3. Your site will be live in seconds!

### Step 4: Custom Domain (Optional)
1. Go to Site settings → Domain management
2. Add your custom domain
3. Follow DNS configuration instructions

---

## Method 3: Deploy via GitHub (Continuous Deployment)

### Step 1: Push to GitHub
```bash
git add .
git commit -m "Ready for deployment"
git push origin main
```

### Step 2: Connect to Netlify
1. Go to https://app.netlify.com/
2. Click "Add new site" → "Import an existing project"
3. Choose GitHub and select your repository

### Step 3: Configure Build Settings
- Build command: `flutter build web --release --web-renderer html`
- Publish directory: `build/web`
- Click "Deploy site"

### Step 4: Automatic Deployments
Every time you push to GitHub, Netlify will automatically rebuild and deploy!

---

## Important Notes

✓ The `netlify.toml` file is already configured
✓ Build output is in `build/web` folder
✓ The app uses HTML renderer for better compatibility
✓ All routes redirect to index.html for SPA routing

## Troubleshooting

### Build fails on Netlify?
Add this to your `netlify.toml`:
```toml
[build.environment]
  FLUTTER_VERSION = "3.24.0"
```

### Fonts not loading?
Make sure Google Fonts are properly configured in your pubspec.yaml

### Need help?
Check Netlify docs: https://docs.netlify.com/
