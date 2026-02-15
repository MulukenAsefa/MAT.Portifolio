# ⚡ Quick Start Guide - Get Running in 5 Minutes

## 🎯 Goal
Get your modern cybersecurity portfolio running on your phone and browser in under 5 minutes.

## 📋 Prerequisites Check

Run these commands to verify you're ready:

```bash
flutter --version    # Should show Flutter 3.35.7+
dart --version       # Should show Dart 3.9.2+
```

If not installed, visit: https://flutter.dev/docs/get-started/install

## 🚀 3-Step Launch

### Step 1: Get Dependencies (30 seconds)
```bash
cd cybersecurity_portfolio
flutter pub get
```

### Step 2: Run on Web (1 minute)
```bash
flutter run -d web-server --web-port=8080
```

✅ **Open browser**: http://localhost:8080

### Step 3: Run on Phone (2 minutes)

#### Android:
1. Enable **Developer Options** on phone:
   - Settings → About Phone → Tap "Build Number" 7 times
2. Enable **USB Debugging**:
   - Settings → Developer Options → USB Debugging ON
3. Connect phone via USB
4. Run:
```bash
flutter run
```

#### iOS:
1. Connect iPhone via USB
2. Trust computer on device
3. Run:
```bash
flutter run
```

## 🎨 What You'll See

Your portfolio features:
- ✨ **Animated background** with moving grid
- 💚 **Matrix green** and cyber blue theme
- 🖥️ **Terminal-style** interface
- 📱 **6 interactive sections**:
  - HOME - Your identity with typewriter effect
  - ABOUT - Professional background
  - SKILLS - Technical arsenal
  - PROJECTS - Mission archive
  - CERTS - Security clearances
  - CONTACT - Secure channels

## 🔧 Quick Customization

### Change Your Name (1 minute)
Edit `lib/main.dart`, find line ~150:
```dart
const Text(
  'CYBER_MAN.EXE',  // ← Change this
```

### Update Contact Info (2 minutes)
Scroll to `ContactScreen` class, update:
```dart
_buildContactMethod('ENCRYPTED_EMAIL', 'your@email.com', Icons.email),
_buildContactMethod('GITHUB_REPO', 'github.com/yourname', Icons.code),
```

### Add Your Projects (3 minutes)
Find `ProjectsScreen` class, add:
```dart
_buildProject(
  'YOUR_PROJECT_NAME',
  'Project Title',
  'Description of what you did',
  ['Tech1', 'Tech2', 'Tech3'],
),
```

## 📱 Test on Your Phone

### Via USB (Recommended)
```bash
flutter run
```

### Via Network (Alternative)
1. Get your computer's IP address:
   - Windows: `ipconfig`
   - Mac/Linux: `ifconfig`
2. On phone browser, visit: `http://YOUR_IP:8080`

## 🎯 Hot Reload Magic

While app is running:
- Press `r` - Hot reload (instant updates)
- Press `R` - Hot restart (full restart)
- Press `q` - Quit

Make changes in code, press `r`, see updates instantly!

## 🐛 Troubleshooting

### "No devices found"
```bash
flutter devices  # Check connected devices
adb devices      # Check Android connection
```

### "Build failed"
```bash
flutter clean
flutter pub get
flutter run
```

### "Port already in use"
```bash
flutter run -d web-server --web-port=8081  # Use different port
```

### Phone not detected
- Try different USB cable
- Enable "File Transfer" mode on phone
- Restart ADB: `adb kill-server && adb start-server`

## 🚀 Next Steps

1. **Customize content** - Add your real projects and skills
2. **Add Firebase** - For dynamic content management
3. **Deploy to web** - Share with the world
4. **Publish to stores** - Get on Play Store / App Store

## 📚 Learn More

- **Flutter Docs**: https://flutter.dev/docs
- **Dart Docs**: https://dart.dev/guides
- **Firebase Setup**: https://firebase.google.com/docs/flutter/setup

## 💡 Pro Tips

1. **Keep it running**: Leave `flutter run` active for hot reload
2. **Test on real devices**: Emulators don't show true performance
3. **Use Chrome DevTools**: Press `p` while running for performance profiling
4. **Check logs**: Press `l` to see detailed logs

## ✅ Success Checklist

- [ ] App running on web browser
- [ ] App running on phone
- [ ] All 6 sections navigating smoothly
- [ ] Animations working (background grid, typewriter)
- [ ] Bottom navigation responding to taps
- [ ] Content displaying correctly

## 🎉 You're Done!

Your modern cybersecurity portfolio is now running!

**Current Status**: ✅ OPERATIONAL

**Access Points**:
- 🌐 Web: http://localhost:8080
- 📱 Mobile: Connected via USB
- 🖥️ Desktop: Native app ready

---

**Time to showcase your cybersecurity expertise to the world! 🛡️**

Need help? Check DEPLOYMENT.md for publishing to production.
