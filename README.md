# Clean Architecture 

Architecture is very important in developing an application. Architecture can be likened to a floor plan that describes how the flow in an application project. The main purpose of implementing the architecture is the separation of concern (SoC). So, it will be easier if we can work by focusing on one thing at a time.

# Core libraries

**[intl](https://pub.dev/packages/intl), [intl_utils](https://pub.dev/packages/intl_utils)**: Localization, date/time formatting, parsing.  
**[flutter_bloc](https://pub.dev/packages/flutter_bloc)**: BLOC.  
**[get_it](https://pub.dev/packages/get_it)**: Inversion of control (IoC).  
**[dio](https://pub.dev/packages/dio), [connectivity_plus](https://pub.dev/packages/connectivity_plus)**: Network calls, network check.  
**[flutter_easyloading](https://pub.dev/packages/flutter_easyloading)**: Simple loading, toast.  
**[shared_preferences](https://pub.dev/packages/shared_preferences)**: Local persistence.  

### Folder Structure
Let's use files and folders to structure our application. Doing this allows us to communicate architecture intent:

```
lib
├── main.dart
├── main-prod.dart
├── app.dart
└── src
    ├── common        
    │
    ├── core
    │   ├── exception
    │   ├── mixins
    │   ├── resource
    │   ├── routes
    │   ├── theme
    │   ├── usecase
    │   └── utils
    │
    ├── data
    │   ├── datasources
    │   │   ├── locale
    │   │   └── remote
    │   │       ├── interceptors
    │   │       └── services
    │   ├── models
    │   │   ├── params
    │   │   └── response
    │   └── repositories
    │
    ├── domain
    │   ├── repositories
    │   └── usecases    
    │
    ├── presentation
    │   ├── blocs
    │   ├── screens
    │   └── widgets
    │
    └── injector.dart
```
* Data: - This layer consists of data source code such as consume Rest API, access to the local database, Firebase, or other sources. 
* Domain: - The domain layer is the deepest in the clean architecture. This layer contains the code for business logic applications such as entities and use cases.
* Presentation: - The presentation layer consists of the code to access the data of the app from a repository. Also, there is the code for state management such as providers, BLoC, and so on.


# Common commands
***Generating files***
```  
flutter packages pub run build_runner build --delete-conflicting-outputs REM generate images, icons, fonts, colors
```  

```  
flutter pub run flutter_launcher_icons:main REM genetate launcher icons
```  

```  
flutter pub run intl_utils:generate REM generate localizations if needed
```  

***Run & Build dev flavor***
```
flutter run --flavor dev -t lib/main.dart REM run debug
```
```
flutter run --release --flavor dev -t lib/main.dart REM run release
```
```
flutter build <apk/ipa/...> --flavor dev -t lib/main.dart REM build debug
```
```
flutter build <apk/ipa/...> --release --flavor dev -t lib/main.dart REM build release
```
***Run & Build prod flavor***
```
flutter run --flavor prod -t lib/main-prod.dart REM run debug
```
```
flutter run --release --flavor prod -t lib/main-prod.dart REM run release
```
```
flutter build <apk/ipa/...> --flavor prod -t lib/main-prod.dart REM build debug
```
```
flutter build <apk/ipa/...> --release --flavor prod -t lib/main-prod.dart REM build release
```
