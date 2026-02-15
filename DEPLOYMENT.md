# 🚀 Deployment Guide - Cyber Man Portfolio

Complete guide for deploying your cybersecurity portfolio to various platforms.

## 📱 Mobile Deployment

### Android (Google Play Store)

1. **Prepare App for Release**
```bash
flutter build appbundle --release
```

2. **Sign the App**
- Create a keystore file
- Configure `android/key.properties`
- Update `android/app/build.gradle`

3. **Upload to Play Console**
- Go to [Google Play Console](https://play.google.com/console)
- Create new app
- Upload the `.aab` file from `build/app/outputs/bundle/release/`
- Fill in store listing details
- Submit for review

### iOS (Apple App Store)

1. **Build for iOS**
```bash
flutter build ios --release
```

2. **Open in Xcode**
```bash
open ios/Runner.xcworkspace
```

3. **Archive and Upload**
- Product → Archive
- Upload to App Store Connect
- Fill in app information
- Submit for review

## 🌐 Web Deployment

### Firebase Hosting (Recommended)

1. **Install Firebase CLI**
```bash
npm install -g firebase-tools
```

2. **Login to Firebase**
```bash
firebase login
```

3. **Initialize Firebase**
```bash
firebase init hosting
```

4. **Build Web Version**
```bash
flutter build web --release
```

5. **Deploy**
```bash
firebase deploy --only hosting
```

Your app will be live at: `https://your-project.web.app`

### Netlify

1. **Build Web Version**
```bash
flutter build web --release
```

2. **Deploy via Netlify CLI**
```bash
npm install -g netlify-cli
netlify deploy --dir=build/web --prod
```

Or drag and drop the `build/web` folder to [Netlify Drop](https://app.netlify.com/drop)

### Vercel

1. **Install Vercel CLI**
```bash
npm install -g vercel
```

2. **Build and Deploy**
```bash
flutter build web --release
cd build/web
vercel --prod
```

### GitHub Pages

1. **Build Web Version**
```bash
flutter build web --release --base-href "/repository-name/"
```

2. **Deploy to gh-pages**
```bash
cd build/web
git init
git add .
git commit -m "Deploy to GitHub Pages"
git branch -M gh-pages
git remote add origin https://github.com/username/repository-name.git
git push -u origin gh-pages --force
```

## 🖥️ Desktop Deployment

### Windows

```bash
flutter build windows --release
```

Output: `build/windows/runner/Release/`

Create installer using:
- Inno Setup
- NSIS
- Advanced Installer

### macOS

```bash
flutter build macos --release
```

Output: `build/macos/Build/Products/Release/`

Sign and notarize for distribution.

### Linux

```bash
flutter build linux --release
```

Output: `build/linux/x64/release/bundle/`

Create `.deb` or `.rpm` package for distribution.

## 🔧 Pre-Deployment Checklist

### General
- [ ] Update version number in `pubspec.yaml`
- [ ] Test on all target platforms
- [ ] Remove debug code and console logs
- [ ] Optimize images and assets
- [ ] Test offline functionality
- [ ] Verify all links work
- [ ] Check responsive design on all screen sizes

### Mobile
- [ ] Update app icons
- [ ] Configure splash screens
- [ ] Set up deep linking (if needed)
- [ ] Configure permissions properly
- [ ] Test on real devices
- [ ] Prepare store screenshots
- [ ] Write app description
- [ ] Set up privacy policy

### Web
- [ ] Configure SEO meta tags
- [ ] Set up analytics
- [ ] Test on multiple browsers
- [ ] Optimize for Core Web Vitals
- [ ] Set up custom domain (optional)
- [ ] Configure SSL certificate
- [ ] Test PWA features (if enabled)

## 🔐 Security Considerations

### Before Deployment
1. **Remove sensitive data**
   - No API keys in code
   - Use environment variables
   - Configure Firebase security rules

2. **Enable HTTPS**
   - Always use HTTPS in production
   - Configure SSL certificates
   - Set up HSTS headers

3. **Implement CSP**
   - Content Security Policy headers
   - Prevent XSS attacks
   - Restrict resource loading

## 📊 Post-Deployment

### Monitoring
- Set up Firebase Analytics
- Configure error tracking (Sentry, Crashlytics)
- Monitor performance metrics
- Track user engagement

### Updates
- Plan regular updates
- Monitor user feedback
- Fix bugs promptly
- Add new features based on feedback

## 🌍 Custom Domain Setup

### Firebase Hosting
1. Go to Firebase Console → Hosting
2. Click "Add custom domain"
3. Follow DNS configuration steps
4. Wait for SSL certificate provisioning

### Netlify
1. Go to Site Settings → Domain Management
2. Add custom domain
3. Configure DNS records
4. SSL automatically provisioned

## 💡 Performance Optimization

### Web
```bash
# Build with optimizations
flutter build web --release --web-renderer canvaskit

# Or use HTML renderer for better performance
flutter build web --release --web-renderer html
```

### Mobile
```bash
# Enable code shrinking
flutter build apk --release --shrink

# Split APKs by ABI
flutter build apk --release --split-per-abi
```

## 🎯 Platform-Specific URLs

After deployment, your portfolio will be accessible at:

- **Web**: `https://your-domain.com`
- **Android**: Google Play Store link
- **iOS**: Apple App Store link
- **Desktop**: Download link on your website

## 📞 Support

For deployment issues:
1. Check Flutter documentation
2. Review platform-specific guides
3. Check deployment platform docs
4. Search Stack Overflow
5. Ask in Flutter community

---

**Ready to deploy your elite cybersecurity portfolio to the world! 🚀**
