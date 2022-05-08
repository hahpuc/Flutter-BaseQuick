# Core libraries

**[intl](https://pub.dev/packages/intl), [intl_utils](https://pub.dev/packages/intl_utils)**: Localization, date/time formatting, parsing.  
**[flutter_bloc](https://pub.dev/packages/flutter_bloc)**: BLOC.  
**[get_it](https://pub.dev/packages/get_it)**: Inversion of control (IoC).  
**[dio](https://pub.dev/packages/dio), [connectivity_plus](https://pub.dev/packages/connectivity_plus)**: Network calls, network check.  
**[flutter_easyloading](https://pub.dev/packages/flutter_easyloading)**: Simple loading, toast.  
**[shared_preferences](https://pub.dev/packages/shared_preferences)**: Local persistence.  


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