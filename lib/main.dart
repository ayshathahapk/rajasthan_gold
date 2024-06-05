// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//
// import 'features/splash.dart';
//
//
// var height;
// var width;
// final localhostServer = InAppLocalhostServer(documentRoot: 'assets');
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
//     await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
//   }
//
//   if (!kIsWeb) {
//     await localhostServer.start();
//   }
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     height = MediaQuery.of(context).size.height;
//     width = MediaQuery.of(context).size.width;
//     return MaterialApp(
//      debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: Splash(),
//     );
//   }
// }
//

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'features/splash.dart';

var height;
var width;
final localhostServer = InAppLocalhostServer(documentRoot: 'assets');

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
      await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
    }

    if (!kIsWeb) {
      await localhostServer.start();
    }
  } catch (e, stackTrace) {
    if (kDebugMode) {
      print('Error during initialization: $e');
      print(stackTrace);
    }
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    try {
      height = MediaQuery.of(context).size.height;
      width = MediaQuery.of(context).size.width;

      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: Splash(),
      );
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print('Error in build method: $e');
        print(stackTrace);
      }
      // Optionally, you can return a fallback UI here
      return MaterialApp(
        home: Scaffold(
          body: Center(
            child: Text('An error occurred'),
          ),
        ),
      );
    }
  }
}

