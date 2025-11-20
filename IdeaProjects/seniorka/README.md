# seniorka
A Flutter-based mobile application for campus navigation, providing interactive maps, event listings, discounts, and location-based services for students and visitors.

## Features

- 🗺️ **Interactive Campus Map** - Navigate through campus with Google Maps integration
- 📍 **Location Services** - Find your current location and get directions to campus buildings
- 🎉 **Events** - Browse and discover campus events
- 💰 **Discounts** - View available student discounts and offers
- 👤 **User Authentication** - Secure login and registration system
- 🎨 **Modern UI** - Built with Material Design 3

## Prerequisites

Before you begin, ensure you have the following installed:

- **Flutter SDK** (>=3.9.0) - [Install Flutter](https://docs.flutter.dev/get-started/install)
- **Dart SDK** (>=3.9.0) - Included with Flutter
- **Android Studio** or **Xcode** (for iOS development)
- **Android SDK** (API 21 or higher)
- **Google Maps API Key** - Required for map functionality

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/aiymabay/seniorka.git
   cd seniorka
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Configure Google Maps API Key:**
   
   - Get your Google Maps API key from [Google Cloud Console](https://console.cloud.google.com/)
   - Open `android/app/src/main/AndroidManifest.xml`
   - Replace `YOUR_API_KEY` with your actual API key:
     ```xml
     <meta-data
         android:name="com.google.android.geo.API_KEY"
         android:value="YOUR_ACTUAL_API_KEY_HERE"/>
     ```
   
   For iOS, add the API key to `ios/Runner/AppDelegate.swift`:
   ```swift
   GMSServices.provideAPIKey("YOUR_ACTUAL_API_KEY_HERE")
   ```

## Running the App

### Android

1. **Start an Android emulator or connect a device:**
   ```bash
   flutter emulators --launch <emulator_name>
   # Or check available devices
   flutter devices
   ```

2. **Run the app:**
   ```bash
   flutter run -d <device_id>
   ```

### iOS

1. **Open the project in Xcode:**
   ```bash
   open ios/Runner.xcworkspace
   ```

2. **Configure signing in Xcode, then run:**
   ```bash
   flutter run
   ```

### Build APK (Android)

```bash
# Debug build
flutter build apk --debug

# Release build
flutter build apk --release
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── app.dart                  # App configuration
├── data/                     # Mock data
│   ├── mock_discounts.dart
│   ├── mock_events.dart
│   └── mock_places.dart
├── features/                 # Feature modules
│   ├── auth/
│   ├── discounts/
│   ├── events/
│   ├── map/
│   └── reviews/
├── screens/                   # UI screens
│   ├── auth/
│   │   ├── login_screen.dart
│   │   └── register_screen.dart
│   ├── map/
│   │   ├── map_screen.dart
│   │   └── place_details_sheet.dart
│   ├── events/
│   ├── discounts/
│   └── profile/
├── services/                  # Business logic
│   └── auth_service.dart
└── widgets/                   # Reusable widgets
    ├── app_bottom_nav.dart
    ├── discount_tile.dart
    └── event_tile.dart
```

## Dependencies

### Core Dependencies

- **flutter_riverpod** (^2.5.1) - State management
- **go_router** (^14.2.0) - Navigation and routing
- **dio** (^5.7.0) - HTTP client for API requests

### Maps & Location

- **google_maps_flutter** (^2.6.1) - Google Maps integration
- **geolocator** (^13.0.2) - Location services
- **flutter_polyline_points** (^2.0.0) - Route drawing

### Storage

- **shared_preferences** (^2.3.3) - Local data persistence

### Development Dependencies

- **flutter_lints** (^5.0.0) - Linting rules
- **build_runner** (^2.4.9) - Code generation
- **freezed** (^2.5.7) - Immutable classes
- **json_serializable** (^6.9.0) - JSON serialization

## Android Configuration

### Minimum SDK Version

The app requires **Android API 21 (Lollipop)** or higher for Google Maps support.

### Permissions

The following permissions are configured in `AndroidManifest.xml`:

- `INTERNET` - For network requests and Google Maps
- `ACCESS_FINE_LOCATION` - For precise location services
- `ACCESS_COARSE_LOCATION` - For approximate location services

## Troubleshooting

### Build Issues

1. **Gradle build fails:**
   ```bash
   flutter clean
   flutter pub get
   cd android && ./gradlew clean
   ```

2. **NDK issues:**
   - Delete corrupted NDK: `rm -rf ~/Library/Android/sdk/ndk/<version>`
   - Let Gradle re-download it automatically

3. **Google Maps not displaying:**
   - Verify API key is correctly set in `AndroidManifest.xml`
   - Ensure Maps SDK for Android is enabled in Google Cloud Console
   - Check that billing is enabled for your Google Cloud project

### Emulator Issues

- **Emulator not starting:** Ensure Android SDK and emulator images are installed
- **App not appearing:** Wait for the build to complete (first build may take 5-10 minutes)

## Development

### Code Generation

If using code generation (freezed, json_serializable):

```bash
flutter pub run build_runner build --delete-conflicting-outputs
```

### Running Tests

```bash
flutter test
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For questions or support, please open an issue on GitHub.

---

**Note:** This app is currently in development. Some features may be incomplete or use mock data.
