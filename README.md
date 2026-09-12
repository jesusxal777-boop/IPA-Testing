# DreamByte Store

A modern, fully-functional Flutter e-commerce application for DreamByte Studios featuring a beautiful glassmorphism design with an electric blue and cyan neon color scheme.

## 🎯 About

DreamByte Store is a fictional online store showcasing:
- **8 Premium Products**: From software to high-end computing hardware
- **Modern UI**: Glassmorphism design with Material 3
- **Full E-commerce Features**: Browse, search, filter, cart management, and checkout
- **State Management**: Provider pattern for clean architecture
- **Local Persistence**: Cart data saved locally
- **Payment Methods**: Multiple payment options (Mercado Pago, PayPal, Card, Bank Transfer)

## 🛍️ Products

| Product | Category | Price |
|---------|----------|-------|
| DreamBuds | Accesorios | $899 MXN |
| DreamByte One | Tecnología | $4,999 MXN |
| DreamWatch | Tecnología | $1,799 MXN |
| DreamPad | Tecnología | $2,999 MXN |
| DreamBuds Case | Accesorios | $249 MXN |
| DreamByte Coder | Software | $399 MXN |
| DreamByte OS | Software | FREE |
| DreamStation | Tecnología | $6,999 MXN |

## ✨ Features

- ✅ Product browsing with grid/list view toggle
- ✅ Advanced search and category filtering
- ✅ Add/remove products from cart
- ✅ Quantity management
- ✅ Automatic tax calculation (16% IVA)
- ✅ Checkout with payment method selection
- ✅ Local cart persistence
- ✅ Modern glassmorphism UI
- ✅ Responsive design
- ✅ Comprehensive tests

## 🏗️ Project Structure

```
lib/
├── main.dart                    # Entry point
├── models/
│   └── product.dart            # Product model
├── providers/
│   └── store_controller.dart   # State management
├── services/
│   └── local_storage_service.dart
├── screens/
│   ├── home_screen.dart
│   ├── cart_screen.dart
│   └── checkout_screen.dart
├── theme/
│   └── dreambyte_theme.dart
└── widgets/
    └── product_card.dart

test/
└── widget_test.dart            # Tests

ios/                             # iOS native code
android/                         # Android native code
.github/workflows/
└── build-ios.yml              # GitHub Actions for iOS build
```

## 🚀 Getting Started

### Prerequisites

- Flutter SDK 3.13.0+
- macOS for iOS development (for GitHub Actions)
- Xcode 14+ (for local iOS builds)

### Local Development

1. **Clone the repository**
```bash
git clone https://github.com/jesusxal777-boop/IPA-Testing.git
cd IPA-Testing
```

2. **Install dependencies**
```bash
flutter pub get
```

3. **Verify code quality**
```bash
flutter analyze
```

4. **Run tests**
```bash
flutter test
```

5. **Run the app**
```bash
flutter run
```

## 📦 Building iOS (Local)

To build an unsigned iOS IPA locally:

```bash
flutter build ios --release --no-codesign
```

Then package it as IPA:
```bash
cd build/ios/Release-iphoneos
mkdir -p Payload
cp -r Runner.app Payload/
zip -r DreamByte-Store-unsigned.ipa Payload
```

## 🤖 GitHub Actions CI/CD

This repository includes an automated GitHub Actions workflow that:

1. **Triggers on**: 
   - Manual dispatch (workflow_dispatch)
   - Push to `main` branch

2. **Executes on**: macOS latest runner

3. **Steps**:
   - Checkout code
   - Setup Flutter stable channel
   - Run `flutter pub get`
   - Run `flutter analyze`
   - Run `flutter test`
   - Build unsigned iOS release
   - Package as `.ipa`
   - Upload as artifact

### 📥 Downloading the IPA

1. Go to **Actions** tab in GitHub
2. Select the latest **Build iOS** workflow run
3. Download **DreamByte-Store-iOS-Unsigned** artifact
4. Extract the ZIP to get `DreamByte-Store-unsigned.ipa`

### ⚠️ Important Notes

- The generated IPA is **UNSIGNED** and cannot be installed directly on physical devices
- For testing on physical devices, you need to:
  - Sign the IPA with a valid Apple developer certificate
  - Use an Apple provisioning profile
  - Enroll in the Apple Developer Program
- For simulator testing, the unsigned IPA works fine

## 🎨 Design System

### Colors
- **Navy Dark**: `#0A1428` - Primary background
- **Navy Medium**: `#1A2F4F` - Cards and surfaces
- **Electric Blue**: `#0066FF` - Primary accent
- **Cyan Neon**: `#00D9FF` - Secondary accent
- **Cyber Gray**: `#2D3E50` - Tertiary
- **White**: `#FFFFFF` - Text and highlights

### Design Approach
- **Glassmorphism**: Semi-transparent panels with gradient backgrounds
- **Rounded Corners**: 12-16px border radius
- **Smooth Gradients**: Blue-to-cyan gradients
- **Premium Feel**: Modern, tech-forward aesthetic

## 🧪 Testing

Run all tests:
```bash
flutter test
```

Tests include:
- Widget tests for UI components
- Unit tests for StoreController
- Cart operations (add, remove, update quantity)
- Price calculations (subtotal, tax, total)
- Search and filter functionality

## 📋 Architecture

### State Management
Uses **Provider** pattern with `ChangeNotifier`:
- `StoreController`: Manages products, cart, filtering, and checkout state
- No circular imports
- Decoupled screen and provider logic

### Models
- `Product`: Represents store items with pricing and metadata
- `BadgeType`: Enum for product badges (Nuevo, Popular, Oferta, Gratis)

### Services
- `LocalStorageService`: Mock local storage for cart persistence

## ⚙️ Configuration

### pubspec.yaml
- Flutter SDK: `>=3.13.0`
- Provider: `^6.4.0` (state management)
- Intl: `^0.19.0` (internationalization)

### iOS Configuration
- Minimum deployment target: iOS 12.0
- No custom signing required for unsigned builds
- CocoaPods integration automatic

## 🔧 Troubleshooting

### Build fails on `flutter pub get`
```bash
flutter clean
flutter pub get
```

### Analysis warnings
```bash
flutter analyze --no-pub
```

### Tests fail
```bash
flutter test --verbose
```

### iOS build issues
```bash
cd ios
rm -rf Pods Podfile.lock
cd ..
flutter clean
flutter pub get
flutter build ios --release --no-codesign
```

## 📱 Platform Support

- ✅ iOS (unsigned IPA via GitHub Actions)
- ✅ Android (ready for implementation)
- ✅ macOS (ready for implementation)
- ✅ Web (ready for implementation)

## 📝 License

This project is created for educational and demonstration purposes.

## 👤 Author

**Jesusxal777**
- GitHub: [@jesusxal777-boop](https://github.com/jesusxal777-boop)

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📞 Support

For issues, questions, or suggestions, please open a GitHub Issue.

---

**Made with ❤️ for DreamByte Studios**
