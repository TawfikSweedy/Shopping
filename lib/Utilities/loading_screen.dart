
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shopping/Utilities/theme_helper.dart';

class LoadingScreen extends StatelessWidget {
  final Widget child;
  final bool loading;
  const LoadingScreen({Key? key, required this.child,this.loading = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=>FocusManager.instance.primaryFocus?.unfocus(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          child,
          loading?Positioned.fill(
            child: Container(
              color: ThemeClass.colorBlack.withOpacity(0.3),
            ),
          ):const SizedBox(),
          loading?Positioned(
            child: Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.9),
                borderRadius: BorderRadius.circular(10.r),
              ),
              alignment: Alignment.center,
              child:  CupertinoActivityIndicator(
                radius: 25.r,
                color: ThemeClass.whiteColor,
              ),
            ),
          ):const SizedBox(),
        ],
      ),
    );
  }
}
