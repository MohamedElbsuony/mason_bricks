# 🧱 Mason Bricks Ecosystem

A production-ready, clean-architecture Flutter scaffolding ecosystem powered by [Mason CLI](https://pub.dev/packages/mason_cli). Designed to standardize Flutter development across teams with strict architectural boundaries, modular feature scaffolding, and robust core tooling.

---

## 📦 Included Bricks

| Brick | Description | Usage |
| :--- | :--- | :--- |
| 🚀 **`app_scaffold`** | Scaffolds a complete clean-architecture Flutter project root (`lib/core/`, tech stack, l10n, responsive UI, storage, networking & sample feature demo). | Initializing new projects |
| ⚡ **`mobile_feature_template`** | Generates 1:1 complementary feature modules (`app/`, `data/`, `domain/`, `presentation/`). | Adding features to an existing project |

---

## 🛠️ Tech Stack & Dependencies

`app_scaffold` comes pre-configured with 12 essential production packages:

- **State Management & DI**: `bloc`, `flutter_bloc`, `get_it`
- **Routing & Responsive UI**: `go_router`, `flutter_screenutil`, `flutter_svg`
- **Functional Programming & Data**: `dartz` (`Either<Failure, T>`), `equatable`
- **Networking**: `dio` (with `BaseApiService` & `ErrorHandler`)
- **Storage & Config**: `shared_preferences`, `flutter_secure_storage`, `flutter_dotenv`

---

## 🚀 Quick Start Guide

### 1. Prerequisites
Install `mason_cli` globally if you haven't already:

```bash
dart pub global activate mason_cli
```

---

### 2. Installation & Setup

#### Option A: Local Installation (Development)
Inside your target Flutter project root directory:

```bash
# Initialize mason (creates mason.yaml)
mason init

# Add app_scaffold brick from local path
mason add app_scaffold --path /path/to/mason_bricks/app_scaffold

# Add mobile_feature_template brick from local path
mason add mobile_feature_template --path /path/to/mason_bricks/mobile_feature_template

# Fetch registered bricks
mason get
```

#### Option B: GitHub Repository Installation (Team & CI/CD)
Add the bricks to your project's `mason.yaml`:

```yaml
bricks:
  app_scaffold:
    git:
      url: git@github.com:MohamedElbsuony/mason_bricks.git
      path: app_scaffold
  mobile_feature_template:
    git:
      url: git@github.com:MohamedElbsuony/mason_bricks.git
      path: mobile_feature_template
```

Then run:
```bash
mason get
```

---

## 🏗️ Workflow & Usage

### Step 1: Initialize a New Application (`app_scaffold`)

Run the following command to generate the root project structure:

```bash
mason make app_scaffold
```

**Prompts:**
- `project_name`: Name of your Flutter application (e.g. `my_app`)
- `project_description`: Description of your application

**Generated Directory Layout:**
```
lib/
├── app.dart                        # MaterialApp.router with ScreenUtilInit & Theme
├── main.dart                       # Entrypoint initializing dotenv, DI & StorageService
├── core/
│   ├── app_injection/              # Service locator (GetIt) registrations
│   ├── assets/                     # AppAssets constants
│   ├── common/extensions/          # BuildContext & Storage extensions
│   ├── design_system/              # Typography, theme, colors & fonts
│   ├── localization/               # L10n Cubit & configuration
│   ├── network/                    # BaseApiService, ConstantsNetwork & ErrorHandler
│   ├── router/                     # GoRouter configuration (AppRoutes)
│   ├── storage/                    # StorageService (SharedPrefsStorage & SecureStorage)
│   ├── utils/                      # ControllerProviderSetup
│   └── validation/                 # AppValidators
└── features/
    └── sample/                     # Educational sample feature (1:1 feature reference)
```

After generation, fetch Flutter packages:
```bash
flutter pub get
```

---

### Step 2: Generate New Features (`mobile_feature_template`)

To create a new clean-architecture feature module (e.g. `auth`, `profile`, `cart`):

```bash
mason make mobile_feature_template
```

**Prompts:**
- `feature_name`: Name of your feature (e.g. `auth`)

**Generated 1:1 Complementary Feature Layout:**
```
lib/features/auth/
├── app/
│   ├── di/auth_di.dart             # Feature DI registration function (initAuthDI)
│   └── routes/auth_routes.dart     # Feature GoRoute list (AuthRoutes.routes)
├── data/
│   ├── datasource/
│   │   ├── base/auth_base_datasource.dart
│   │   └── implementation/auth_impl_datasource.dart
│   ├── mappers/
│   ├── models/auth_model.dart
│   └── repository_implementation/auth_repo_impl.dart
├── domain/
│   ├── entities/auth_entity.dart
│   ├── enums/
│   ├── inputs/auth_inputs.dart
│   ├── repository/auth_base_repo.dart
│   └── use_cases/
│       ├── base/auth_base_use_cases.dart
│       └── implementation/auth_impl_use_cases.dart
└── presentation/
    ├── blocs/auth_cubit.dart & auth_state.dart
    └── ui/
        ├── screens/auth_screen.dart
        └── widgets/
```

---

### Step 3: Connect New Feature in 2 Quick Lines

After generating a new feature (e.g. `auth`):

1. **Register Dependency Injection** in [`lib/core/app_injection/app_injection.dart`](file:///Users/user/StudioProjects/mason_bricks/app_scaffold/__brick__/lib/core/app_injection/app_injection.dart):
   ```dart
   initAuthDI(getIt);
   ```

2. **Register Routes** in [`lib/core/router/app_routes.dart`](file:///Users/user/StudioProjects/mason_bricks/app_scaffold/__brick__/lib/core/router/app_routes.dart):
   ```dart
   static final GoRouter router = GoRouter(
     initialLocation: initialRoute,
     routes: [
       ...SampleRoutes.routes,
       ...AuthRoutes.routes, // <-- Add your new feature routes here
     ],
   );
   ```

---

## 🏛️ Architectural Best Practices

1. **Functional Error Handling (`dartz`)**:
   Repositories and UseCases return `Future<Either<Failure, T>>`. Cubits consume results using `.fold(...)`:
   ```dart
   final result = await getSampleData(inputs);
   result.fold(
     (failure) => emit(SampleError(failure.message)),
     (data) => emit(SampleLoaded(data)),
   );
   ```

2. **Decoupled Local Storage**:
   Access local storage directly via `BuildContext` or `StorageService`:
   ```dart
   context.shared.saveString(StorageKeys.userName, 'John');
   context.secure.saveString(StorageKeys.accessToken, 'token');
   ```

3. **Responsive UI & SVG**:
   Use `flutter_screenutil` extensions (`.w`, `.h`, `.sp`) and `flutter_svg` (`SvgPicture`) for crisp vector icons.

---

## 📄 License
This repository is licensed under the MIT License.
