# flutterwalkthrough

A new Flutter package for both android and iOS which helps developers in creating animated walkthrough of their app.

## Screenshots

<img src="ss1.PNG" height="300em" /> <img src="ss2.PNG" height="300em" /> <img src="ss3.png" height="300em" /> <img src="ss4.png" height="300em" />

## Usage
[Example](https://github.com/siraiwaqarali/Flutter-Walkthrough/blob/master/example/example_app.dart)

To use this package:

* add the dependency to your [pubspec.yaml](https://github.com/siraiwaqarali/Flutter-Walkthrough/blob/master/pubspec.yaml) file.

```yaml
    dependencies:
      flutter:
        sdk: flutter
      walkthrough:
```

### How to use

```dart
    class TestScreen extends StatelessWidget {

      /*here we have a list of walkthroughs which we want to have,
      each walkthrough has a title, content and an icon
      */
      final List<Walkthrough> list = [
        Walkthrough(
          title: "Title 1",
          content: "Content 1",
          imageIcon: Icons.restaurant_menu,
        ),
        Walkthrough(
          title: "Title 2",
          content: "Content 2",
          imageIcon: Icons.search,
        ),
        Walkthrough(
          title: "Title 3",
          content: "Content 3",
          imageIcon: Icons.shopping_cart,
        ),
        Walkthrough(
          title: "Title 4",
          content: "Content 4",
          imageIcon: Icons.verified_user,
        ),
      ];

      @override
      Widget build(BuildContext context) {
        //here we need to pass the list and route for the next page to be opened after this
        return IntroScreen(
          list,
          MaterialPageRoute(builder: (context) => TestScreen()),
        );
      }
    }
```

## Getting Started


This project is a starting point for a Dart
[package](https://flutter.dev/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
