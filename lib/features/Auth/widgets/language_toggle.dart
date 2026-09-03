import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies/core/constants/app_icons.dart';

import '../utilities/shared_preferences.dart';

class LanguageToggle extends StatefulWidget {
  const LanguageToggle({super.key});

  @override
  State<LanguageToggle> createState() => _LanguageToggleState();
}

class _LanguageToggleState extends State<LanguageToggle> {

  @override
  Widget build(BuildContext context) {
    bool isArabic = context.locale.languageCode == "ar"  ;
    return FittedBox(
      fit: .scaleDown,
      child: Container(
        width: 95.w ,
        height: 40.h ,
        decoration: BoxDecoration(
          color: Colors.transparent ,
          border: BoxBorder.all(
            color: Color(0xffF6BD00) ,
            width: 3.w ,
          ) ,
          borderRadius: BorderRadius.circular(30.r) ,
        ),
        child: Row(
          textDirection: .ltr,
          mainAxisAlignment: .spaceBetween ,
          children: [
            GestureDetector(
              onTap: () => setState(() {
                isArabic = false ;
                SharedPreference.setLanguage("en") ;
                context.setLocale(Locale("en")) ;
              }),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 150 ) ,
                width:  35.w ,
                height: 35.h,
                decoration: BoxDecoration(
                  color: Colors.transparent ,
                  border: BoxBorder.all(
                    color: isArabic ? Colors.transparent : Color(0xffF6BD00)  ,
                    width: 4.w ,
                  ) ,
                  borderRadius: BorderRadius.circular(30.r) ,
                ),
                child: SvgPicture.asset(AppIcons.usa),
              ),
            ) ,
            GestureDetector(
              onTap: () => setState(() {
                  isArabic = true ;
                  SharedPreference.setLanguage("ar") ;
                  context.setLocale(Locale("ar")) ;
              }) ,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 150 ) ,
                width:  35.w ,
                height: 35.h,
                decoration: BoxDecoration(
                  color: Colors.transparent ,
                  border: BoxBorder.all(
                    color: isArabic ? Color(0xffF6BD00) : Colors.transparent ,
                    width: 3.w ,
                  ) ,
                  borderRadius: BorderRadius.circular(30.r) ,
                ),
                child: SvgPicture.asset(AppIcons.eg),
              ),
            ) ,
          ],
        ),
      ),
    );
  }
}