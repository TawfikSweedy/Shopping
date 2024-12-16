import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
import 'package:shopping/Utilities/helper.dart';
import 'package:shopping/Utilities/loading_screen.dart';
import 'package:shopping/generated/assets.dart';
import '../../../Utilities/theme_helper.dart';
import '../../../Utilities/toast_helper.dart';
import '../../../Utilities/validator.dart';
import '../../../Widgets/InternetCheckerWidget.dart';
import '../../../Widgets/app_bar_widget.dart';
import '../../../Widgets/button_widget.dart';
import '../../../Widgets/textfield_widget.dart';
import '../../../Widgets/title_textfield_widget.dart';
import 'login_controller.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = "/LoginScreen";
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends StateMVC<LoginScreen> {
  _LoginScreenState() : super(LoginController()) {
    con = LoginController();
  }

  late LoginController con;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return LoadingScreen(
        loading: con.loading,
        child: Scaffold(
          appBar: AppBarWidget(
            title: 'sign_in'.tr,
            onShowBack: false,
          ),
          body: Padding(
            padding: EdgeInsets.all(20),
            child: InternetCheckerWidget(
              child: Form(
                  key: formKey,
                  autovalidateMode: con.autoValidate
                      ? AutovalidateMode.always
                      : AutovalidateMode.disabled,
                  child: ListView(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 16.w),
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Center(
                        child: Text(
                          "welcome_back".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 25.sp,
                              color: ThemeClass.primaryColor),
                        ),
                      ),
                      Center(
                          child: Image.asset(
                            Assets.logo,
                            width: 100.w,
                          )),
                      Gap(24.h),
                      TitleTextFiledWidget(title: 'email'.tr),
                      Gap(5.h),
                      TextFieldWidget(controller: con.emailController,
                        isDense: true,
                        insidePadding: EdgeInsets.symmetric(vertical: 20.h),
                        hint: "${"enter".tr} ${"email".tr}",
                        prefixIcon: Icon(
                          Icons.phone_android,
                          color: ThemeClass.color8898AA,
                          size: 17.sp,
                        ),
                        validator: (v)=>Validator.validateEmpty(v??"","email".tr),
                      ),
                      Gap(15.h),
                      TitleTextFiledWidget(title: 'password'.tr),
                      Gap(5.h),
                      TextFieldWidget(
                        controller: con.passwordController,
                        isDense: true,
                        insidePadding: EdgeInsets.symmetric(vertical: 20.h),
                        hint: "${"enter".tr} ${"password".tr}",
                        obscure: con.showPassword ,
                        suffixIcon: GestureDetector(
                            onTap: ()=>setState(() {con.showPassword= !con.showPassword;}),
                            child:!con.showPassword?
                            Icon(CupertinoIcons.eye,color: ThemeClass.primaryColor,size: 20.sp,) :
                            Icon(CupertinoIcons.eye_slash,color: ThemeClass.color8898AA,size: 20.sp,)
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color: ThemeClass.color8898AA,
                          size: 17.sp,
                        ),
                        validator: (v)=>Validator.validateEmpty(v??"","password".tr),
                      ),
                      Gap(30.h),
                      ButtonWidget(
                        onTap: () {
                          if (formKey.currentState?.validate() ?? false) {
                              con.logIn(context);
                          } else {
                            setState(() {
                              con.autoValidate = true;
                            });
                          }
                        },
                        title: 'login'.tr,
                      ),
                      Gap(15.h),
                    ],
                  )),
            ),
          ),
        ));
  }
}
