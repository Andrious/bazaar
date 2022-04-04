
## 1.6.0+01
 April 03, 2022
- Removed Auth package and firebase
- Replaced dart.io.Platform with universal_platform

## 1.5.0+01
 April 01, 2022
- Overall upgrade
- sdk: ">=2.16.2 <3.0.0"

## 1.4.0+3
 March 03, 2021
- analysis_options.yaml
- mvc_application: ^6.0.0
- minifyEnabled true

## 1.3.0
 September 18, 2020
- Update plugins:
-                cloud_firestore: ^0.13.0 to ^0.14.0
-                firebase_auth: ^0.14.0 to ^0.18.0
-                firebase_database: ^3.0.0 to ^4.0.0
-                firebase_storage: ^3.0.0 to ^4.0.0
- Update SDK to ">=2.9.0 <3.0.0"

## 1.2.0
 June 08, 2020
- Updated to mvc_application: ^5.0.0
- Removed all Controllers.of<>();
- state.controllerByType<>(state.context);
- sdk: ">=2.7.0 <3.0.0"
- Exclude android, iOS and google-services.json from .gitignore

## 1.1.6
 September 28, 2019
- Updated README.md

## 1.1.5
 September 28, 2019
- Contacts page

## 1.1.4
 September 25, 2019
- deactivate() calls Prefs.setBool()

## 1.1.3
 September 25, 2019
- const keyword for 'unchanging' parameters
- factory constructor for Controllers
- Refresh UI when logging out
- Icons.visibility_off for password field

## 1.1.2
 September 23, 2019
- Removed FirebaseAuth, FirebaseUser from view, homepage.dart. 
- Using controller, homeDrawer.dart

## 1.1.1
 September 23, 2019
- Formatting and created directory, showSearch

## 1.1.0
 September 20, 2019
- Adjusted Contact page

## 1.0.0
 September 20, 2019
- Incorporate MVC pattern
- MVC directory structure

## 0.1.0
 2019-09-11
- Initial Commit