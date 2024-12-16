import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shopping/Modules/Main_Pages/main_screen.dart';
import '../Modules/Auth/login/login_screen.dart';
import '../Modules/Splash/splash_screen.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (context, args) => const SplashScreen()),
    defaultRoute(routeName: LoginScreen.routeName, screen: const LoginScreen()),
    // defaultRoute(routeName: MainScreen.routeName, screen: const MainScreen()),
    ChildRoute(
      MainScreen.routeName,
      child: (_, args) => MainScreen(),
      transition: TransitionType.noTransition,
      duration: const Duration(milliseconds: 300),
    )
    // defaultRoute(
    //     routeName: ForgotPasswordScreen.routeName,
    //     screen: const ForgotPasswordScreen()),
    // defaultRoute(
    //     routeName: RegisterScreen.routeName, screen: const RegisterScreen()),
  ];

  static ChildRoute defaultRoute(
      {required String routeName, required Widget screen}) {
    return ChildRoute(
      routeName,
      child: (_, args) => screen,
      transition: TransitionType.fadeIn,
      duration: const Duration(milliseconds: 300),
    );
  }
}
