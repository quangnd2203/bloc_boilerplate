# Bloc Boilerplate

A Flutter project template with Clean Architecture, BLoC pattern, and comprehensive dependency injection setup.

## 🏗️ Architecture

This project follows **Clean Architecture** principles with the following structure:

```
lib/
├── application/          # Application Layer (BLoC, Use Cases)
│   ├── bloc/            # BLoC/Cubit state management
│   └── usecase/         # Application use cases
├── domain/              # Domain Layer (Entities, Interfaces)
│   ├── entity/          # Business entities
│   └── interface/       # Repository and service interfaces
├── adapter/             # Adapter Layer (Data, External)
│   ├── client/          # HTTP clients
│   ├── model/           # Data models
│   ├── repository/      # Repository implementations
│   └── service/         # Service implementations
├── presentation/        # Presentation Layer (UI)
│   ├── feature/         # UI features and widgets
│   ├── route/           # App routing
│   └── translations/    # Internationalization
├── shared/              # Shared utilities and constants
│   ├── constants/       # App constants, themes, colors
│   ├── utils/           # Utility functions
│   ├── extensions/      # Dart extensions
│   └── app_fomatter/    # Input formatters
└── injection/           # Dependency Injection
```

## 🎯 Key Features

- **Clean Architecture**: Separation of concerns with clear layer boundaries
- **BLoC Pattern**: State management using flutter_bloc
- **Dependency Injection**: GetX-based DI container
- **Multi-flavor Support**: Dev, Staging, Production environments
- **Firebase Integration**: Messaging, Crashlytics, Remote Config
- **Local Storage**: GetStorage for persistent data
- **Network Layer**: HTTP client with error handling
- **Internationalization**: Multi-language support
- **Theme Management**: Light/Dark theme switching

## 📱 Environment Setup

### Flavors:
- **dev**: Development environment
- **staging**: Staging environment  
- **prod**: Production environment

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.32.0+)
- Dart SDK
- Android Studio / VS Code
- Firebase project setup

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd bloc_boilerplate
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Setup Firebase** (if using Firebase features)
   - **Android**: Add `google-services.json` to respective flavor folders:
     - `android/app/src/dev/google-services.json`
     - `android/app/src/staging/google-services.json`
     - `android/app/src/prod/google-services.json`
   - **iOS**: Add `GoogleService-Info.plist` to respective flavor folders:
     - `ios/Runner/dev/GoogleService-Info.plist`
     - `ios/Runner/staging/GoogleService-Info.plist`
     - `ios/Runner/prod/GoogleService-Info.plist`

4. **Run the app**
   ```bash
   # Development
   flutter run --flavor dev
   
   # Staging
   flutter run --flavor staging
   
   # Production
   flutter run --flavor prod
   ```

### Android Studio Setup
1. Run `flutter pub get`
2. In "Run/Debug Configurations"
3. Add `--flavor [FLAVOR]` in "Additional run args"
4. Run the app

## 🏗️ Build Instructions

### APK Build
```bash
flutter build apk --flavor [FLAVOR]
```

### AAB Build (Google Play)
```bash
flutter build appbundle --flavor [FLAVOR]
```

## 🧩 Use Cases Pattern

This project implements a **Single Responsibility Use Case** pattern:

### Structure
Each use case has:
- **Single method**: `execute()` only
- **Single responsibility**: One specific action
- **Clear naming**: `[Entity][Action]UseCase`

### Examples
```dart
// Language management
class LanguageGetUseCase {
  Future<AppLocale?> execute() { ... }
}

class LanguageUpdateUseCase {
  void execute(AppLocale locale) { ... }
}

// Theme management  
class ThemeModeGetUseCase {
  Future<ThemeMode?> execute() { ... }
}

class ThemeModeUpdateUseCase {
  void execute(ThemeMode mode) { ... }
}
```

### When to Use Use Cases

**✅ Use Use Cases when:**
- Complex business logic
- Multiple data sources
- Business rule validation
- Cross-cutting concerns (logging, analytics)
- Large applications with many features

**❌ Skip Use Cases for:**
- Simple CRUD operations
- Direct repository calls
- Small projects (< 10 screens)
- Prototype/MVP development

### Alternative: Direct Repository Pattern
For smaller projects, you can skip use cases and call repositories directly:

```dart
class LanguageCubit extends Cubit<AppLocale> {
  final ILocalStorageRepository _storage = Get.find();
  
  void changeLanguage(AppLocale locale) {
    emit(locale);
    _storage.saveData(AppPref.LANGUAGE.name, locale);
  }
}
```

## 🔧 Dependency Injection

The project uses GetX for dependency injection with organized registration:

```dart
class Injection {
  static void injectDependencies() {
    _dependencyBloc();      // BLoC/Cubit registration
    _dependencyRepository(); // Repository registration  
    _dependencyService();    // Service registration
    _dependencyUseCase();    // Use case registration
  }
}
```

## 📁 Project Structure Guidelines

### Adding New Features
1. **Entity**: Define in `domain/entity/`
2. **Repository Interface**: Create in `domain/interface/repository/`
3. **Repository Implementation**: Implement in `adapter/repository/`
4. **Use Case**: Create in `application/usecase/[feature]/`
5. **BLoC**: Create in `application/bloc/[feature]/`
6. **UI**: Create in `presentation/feature/[feature]/`
7. **Register**: Add to `injection/injection.dart`

### Naming Conventions
- **Files**: `snake_case.dart`
- **Classes**: `PascalCase`
- **Variables**: `camelCase`
- **Constants**: `UPPER_SNAKE_CASE`
- **Use Cases**: `[Entity][Action]UseCase`

## 🧪 Testing

### Unit Tests
```bash
flutter test
```

### Integration Tests
```bash
flutter test integration_test/
```

### Test Structure
```
test/
├── unit/           # Unit tests
├── widget/         # Widget tests  
├── integration/    # Integration tests
├── helpers/        # Test utilities
└── mocks/          # Mock objects
```

## 📦 Dependencies

### Core
- `flutter_bloc`: State management
- `get`: Dependency injection and routing
- `equatable`: Value equality
- `firebase_core`: Firebase integration

### Network & Storage
- `dio`: HTTP client
- `get_storage`: Local storage
- `connectivity_plus`: Network connectivity

### UI & Utils
- `flutter_localizations`: Internationalization
- `modal_bottom_sheet`: Bottom sheet modals
- `image_picker`: Image selection

### Firebase
- `firebase_messaging`: Push notifications
- `firebase_crashlytics`: Crash reporting
- `firebase_remote_config`: Remote configuration

## 🔒 Security Notes

- Never commit sensitive files (API keys, certificates)
- Use environment variables for configuration
- Implement proper error handling
- Validate all user inputs
- Use HTTPS for network requests

## 📝 Contributing

1. Follow the established architecture patterns
2. Write tests for new features
3. Update documentation
4. Follow naming conventions
5. Use meaningful commit messages

## 📄 License

This project is licensed under the MIT License.
