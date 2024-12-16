import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Provider/cart_provider.dart';
import 'package:shopping/Provider/product_provider.dart';
import 'Control/AppLanguages.dart';
import 'Locale/locales.dart';
import 'Modules/Main_Pages/main_screen.dart';
import 'Utilities/routing.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider<AppLanguage>(create: (_) => AppLanguage()),
      ChangeNotifierProvider<ProductProvider>(create: (_) => ProductProvider()),
      ChangeNotifierProvider<CartProvider>(create: (_) => CartProvider()),
    ],
    child: ModularApp(
      module: AppModule(),
      child: const EntryPoint(),
    ),

    // MainApp(),
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen() ,
    );
  }
}


class EntryPoint extends StatelessWidget {
  const EntryPoint({Key? key}) : super(key: key);
  static Size largeSize = const Size(1920,1080);
  static Size mediumSize = const Size(1000,780);
  static Size smallSize = const Size(375,812);
  @override
  Widget build(BuildContext context) {
    final appLan = Provider.of<AppLanguage>(context,listen: true);
    appLan.fetchLocale();
    return LayoutBuilder(
        builder: (context, constraints) {
          return ScreenUtilInit(
            designSize: smallSize,
            splitScreenMode: true,
            minTextAdapt: true,
            builder: (_, __) =>
                MaterialApp.router(
                  scrollBehavior: MyCustomScrollBehavior(),
                  theme: ThemeData(
                    textTheme: Theme.of(context).textTheme.apply(
                      fontFamily: 'Poppins',
                    ),
                    pageTransitionsTheme: const PageTransitionsTheme(builders: {
                      TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),

                    }),
                    fontFamily: 'Poppins',
                    brightness: Brightness.light,
                  ),
                  debugShowCheckedModeBanner: false,
                  title: 'template',
                  locale: Locale(appLan.appLang.name),
                  supportedLocales: Languages.values.map((e) => Locale(e.name)).toList(),
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    DefaultCupertinoLocalizations.delegate
                  ],
                  routeInformationParser: Modular.routeInformationParser,
                  routerDelegate: Modular.routerDelegate,
                  showPerformanceOverlay: false,
                ),
          );
        }
    );
  }
}
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}
