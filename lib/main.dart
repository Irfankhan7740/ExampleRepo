import 'package:flutter/material.dart';
import 'package:sentry/sentry.dart';
import 'package:todoapp/addSomeNewData.dart';
import 'package:todoapp/bottomNavigationBar.dart';
import 'package:todoapp/tabScreen.dart';

import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'homePage.dart';
import 'package:get/get.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://7409e22c98a248da396676702b8c33f1@o4507101851156480.ingest.us.sentry.io/4507101898211328';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.

      options.tracesSampleRate = 0.5;

      options.attachScreenshot = true;
      options.beforeScreenshot = (event, {hint}) {
        // Return false if you don't want to attach the screenshot based on some condition.
        return true;
      };

      options.debug = false;

      options.screenshotQuality = SentryScreenshotQuality.low;

      options.considerInAppFramesByDefault = false;

      options.attachThreads = true;

      options.enableWindowMetricBreadcrumbs = true;

      options.sendDefaultPii = true;

      options.attachStacktrace = true;

      options.captureFailedRequests = true;

      options.reportSilentFlutterErrors = true;
    },
    appRunner: () => runApp(MyApp()),
  );
  // try {
  //   int? i;
  //   print(i!);
  // } catch (error,stackTrace) {
  //   await Sentry.captureException(error,stackTrace: stackTrace,withScope: (scope){
  //     scope.setTag("error reason", "Manual error");
  //   });
  //   print(error);
  // }

  // or define SENTRY_DSN via Dart environment variable (--dart-define)
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      // home:  MyHomePage(title: 'Mine project'),
      home: BottomScreen(),
      // home :  TabScreen(),
    );
  }
}
