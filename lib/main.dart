import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'navigator/route_parser.dart';
import 'navigator/router_delegate.dart';
import 'theme/theme.dart';

Future<void> main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // await FirebaseAppCheck.instance
  //     .activate(webRecaptchaSiteKey: app_check_public_key);
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TheAppRouterDelegate _routerDelegate = TheAppRouterDelegate();
  final TheAppRouteInformationParser _routeInformationParser =
      TheAppRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (context, ref, child) {
      final appTheme = ref.watch(appThemeProvider);
      return MaterialApp.router(
        title: 'Smart Chess Academy',
        theme: appTheme.getTheme(),
        darkTheme: AppDynamicTheme.darkTheme,
        themeMode: AppDynamicTheme.isDark ? ThemeMode.dark : ThemeMode.light,
        debugShowCheckedModeBanner: false,
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
      );
    });
  }
}
