

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Utilities/theme_helper.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Color? backGroundColor;
  final bool onShowBack,centerTitle;
  final List<Widget>? actions;
  final Function()? backOnTab;
  const AppBarWidget({Key?key,  this.title, this.backGroundColor, this.actions, this.backOnTab,  this.onShowBack=true,this.centerTitle=true}):super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      elevation: 0,
      backgroundColor:backGroundColor?? ThemeClass.backGroundColor,

      leading: onShowBack?Center(
        child: GestureDetector(
          onTap:backOnTab?? ()=>Modular.to.pop(),
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 16.w),
            child: Icon(Icons.arrow_back_outlined,color: ThemeClass.textBlackColor,),
          ),
        ),
      ):const SizedBox(),
      title: Text(title??"",style: TextStyle(
          fontSize:20.sp ,
          fontWeight: FontWeight.w600,
          color: ThemeClass.textBlackColor
      ),),
      centerTitle:centerTitle,
      actions: actions,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
