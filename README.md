# flutter_riverpod

Skeleton Flutter with Getx

## Stack
  - getx
  - get_storage


## Flutter Flavor
https://www.youtube.com/watch?v=4Y7WaeU3P60&ab_channel=FlutterExplained
https://dwirandyh.medium.com/create-build-flavor-in-flutter-application-ios-android-fb35a81a9fac


## Change package name
`flutter pub run change_app_package_name:main com.example.getx`

Old Package Name: com.example.flutter_riverpod
https://stackoverflow.com/questions/51534616/how-to-change-package-name-in-flutter


## flutter flavor setup firebase
https://medium.com/@animeshjain/build-flavors-in-flutter-android-and-ios-with-different-firebase-projects-per-flavor-27c5c5dac10b

## Deploy
ios:
flutter build xcarchive --flavor dev -t lib/main_dev.dart

aab:
flutter build appbundle --flavor prod -t lib/main_prod.dart