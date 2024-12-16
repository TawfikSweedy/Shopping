
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Modules/Auth/login/login_screen.dart';
import '../../Utilities/theme_helper.dart';
import '../../generated/assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    init();
    super.initState();
  }


  init() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).pushNamedAndRemoveUntil(LoginScreen.routeName, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.backGroundColor,
      body: Center(child: Image.asset(Assets.logo, width: 250.w)),
    );
  }
}
