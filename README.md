# Movies

A Flutter movie discovery app with movie browsing, search, details, and account features. The app uses a movie API for its catalog and Firebase Authentication and Cloud Firestore for user accounts and profile data.

## Features

- Onboarding and email/password sign in, registration, and password reset
- Home screen with a featured movie carousel and genre based movie lists
- Browse movies by genre and search the catalog
- Movie details, cast and screenshots, and similar movie suggestions
- Profile editing, saved movies, and watch history
- English and Arabic localization
- Dark theme

The Home genre advances when you return to Home from another bottom navigation tab.

## Requirements

- Flutter SDK compatible with the Dart constraint in `pubspec.yaml` (`^3.12.2`)
- A configured Firebase project with Authentication and Cloud Firestore enabled
- Platform Firebase configuration for the target platform

Firebase initialization uses `lib/firebase_options.dart`. If you use a different Firebase project, regenerate the platform options with the FlutterFire CLI and configure the matching native platform files.

## Run locally

From the project root:

```sh
flutter pub get
flutter run
```

The movie catalog client uses `https://movies-api.accel.li`, configured in `lib/core/constants/api_constants.dart`.

## Project structure

```text
lib/
  core/                 Shared networking, routing, theme, models, and DI
  features/
    Auth/                Authentication and account services
    browse/              Genre selection and category results
    history/             Watch history
    home/                Featured content and movie lists
    main/                Bottom navigation and tab layout
    movie_details/       Movie information and suggestions
    onboarding/          First-run onboarding
    profile/             Profile screen and profile tabs
    search/              Movie search
    updateProfile/       Profile editing and avatar selection
    wishlist/            Saved movie state and repository
assets/
  avatars/               Profile avatars
  icons/                 SVG and animation assets
  images/                App and movie artwork
  lang/                  English and Arabic translations
```

Most features separate data access, repositories, Cubit state, and presentation widgets. `lib/core/di/dependency_injection.dart` registers shared services and feature Cubits; `lib/main.dart` initializes Firebase, localization, and app-wide providers.

## Useful commands

```sh
flutter analyze
flutter test
```
