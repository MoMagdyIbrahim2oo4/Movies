import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/core/constants/app_avatars.dart';
import 'package:movies/core/constants/app_colors.dart';
import 'package:movies/core/constants/app_icons.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/features/Auth/widgets/language_toggle.dart';

import '../../../../core/routing/app_routes.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  
  final GlobalKey<FormState> formKey  = GlobalKey<FormState>() ;

  final TextEditingController nameController = TextEditingController() ;
  final TextEditingController emailController = TextEditingController() ;
  final TextEditingController passwordController = TextEditingController() ;
  final TextEditingController confirmPasswordController = TextEditingController() ;
  final TextEditingController phoneController = TextEditingController() ;


  final PageController _pageController = PageController( viewportFraction: 0.35 , initialPage: 1 ) ;
  int currentAvatar = 1 ; // initially 

  bool isSecurePassword = true ;
  bool isSecureConfirmPassword = true ;

  final List<String> avatars = [ 
    AppAvatars.avatar1 ,
    AppAvatars.avatar2 ,
    AppAvatars.avatar3 ,
    AppAvatars.avatar4 ,
    AppAvatars.avatar5 ,
    AppAvatars.avatar6 ,
    AppAvatars.avatar7 ,
    AppAvatars.avatar8 ,
    AppAvatars.avatar9 ,
  ];
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_sharp , 
            color: Color(0xffF6BD00) ,
          ),
        ),
        title: Text( "register".tr() ,
          style: GoogleFonts.roboto(
            fontSize: 16.sp ,
            fontWeight: .w400
          ),
        )  ,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric( horizontal: 16.w ),
              child: Column(
                children: [
                  SizedBox(
                  height: 161.h ,
                    child: PageView.builder(
                      controller: _pageController ,
                      onPageChanged: (index) {
                        setState(() {
                          currentAvatar = index ;
                        });
                      },
                      itemCount: avatars.length ,
                      itemBuilder: (context , index ) {
                        bool isSelected = index == currentAvatar ;
                        return AnimatedContainer(
                          duration: Duration(milliseconds: 200) ,
                          margin: .all( isSelected ? 0 : 25.r ), 
                          width:  394.w ,
                          height: 161.h ,
                          child: FittedBox(
                            fit: .contain ,
                            child: Image.asset(avatars[index]) ,
                          ) ,
                        ) ;
                      }
                    ),
                  ) ,
                  Text( "avatar".tr() , 
                    style: GoogleFonts.roboto(
                      color: AppColors.white ,
                      fontSize: 16.sp , 
                      fontWeight: .w400 ,
                    ),
                  ) ,
                  SizedBox( height: 12.h ,) ,
                  Form(
                    key: formKey ,
                    child: Column(
                      crossAxisAlignment: .stretch ,
                      children: [
                        CustomTextFormField( hintText: "name".tr() ,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only( left: 20.w , right: 8 ),
                            child: SvgPicture.asset(AppIcons.nameIcon),
                          ) , 
                          controller: nameController ,
                          validator: (value){
                            if ( value == null || value.isEmpty ) {
                              return "empty_name_hint".tr() ;
                            }
                            else {
                              return null ;
                            }
                          },
                        ) , 
                        SizedBox( height: 24.h ,) ,
                        CustomTextFormField( hintText: "email".tr() ,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only( left: 20.w , right: 8 ),
                            child: SvgPicture.asset(AppIcons.emailIcon),
                          ) , 
                          controller: emailController ,
                          validator: (value){
                            final RegExp emailRegex = RegExp( r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' );
                            if ( value == null || value.isEmpty ) {
                              return "empty_email_hint".tr() ;
                            }
                            else if ( ! emailRegex.hasMatch(value.trim()) ) {
                              return "invalid_email_hint".tr() ;
                            }
                            else {
                              return null ;
                            }
                          },
                        ) , 
                        SizedBox( height: 24.h ,) ,
                        CustomTextFormField( hintText: "password".tr() , 
                          prefixIcon: Padding(
                            padding: EdgeInsets.only( left: 20.w , right: 8 ),
                            child: SvgPicture.asset(AppIcons.passwordIcon),
                          )  ,
                          suffixIcon: InkWell(
                            onTap: (){
                              setState(() {
                                isSecurePassword == true ? isSecurePassword = false : isSecurePassword = true ;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(AppIcons.hidePassword ),
                            ) ,
                          ) , 
                          isObscure : isSecurePassword ,
                          controller: passwordController ,
                          validator: (value){
                            if ( value == null || value.isEmpty ) {
                              return "empty_password_hint".tr() ;
                            }
                            else {
                              return null ;
                            }
                          },
                        ) , 
                        SizedBox( height: 24.h ,) ,
                        CustomTextFormField( hintText: "confirm_password".tr() , 
                          prefixIcon: Padding(
                            padding: EdgeInsets.only( left: 20.w , right: 8 ),
                            child: SvgPicture.asset(AppIcons.passwordIcon),
                          )  ,
                          suffixIcon: InkWell(
                            onTap: (){
                              setState(() {
                                isSecureConfirmPassword == true ? 
                                isSecureConfirmPassword = false : isSecureConfirmPassword = true ;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SvgPicture.asset(AppIcons.hidePassword ),
                            ) ,
                          ) , 
                          isObscure : isSecureConfirmPassword ,
                          controller: confirmPasswordController ,
                          validator: (value){
                            if ( value == null || value.isEmpty ) {
                              return "empty_password_hint".tr() ;
                            }
                            else if ( passwordController.text != confirmPasswordController.text ){
                              return "wrong_confirm_password_hint".tr() ;
                            }
                            else {
                              return null ;
                            }
                          },
                        ) , 
                        SizedBox( height: 24.h ,) ,
                        CustomTextFormField( hintText: "phone_number".tr() ,
                        controller: phoneController , 
                          prefixIcon: Padding(
                            padding: EdgeInsets.only( left: 20.w , right: 8 ),
                            child: SvgPicture.asset(AppIcons.phoneIcon),
                          )  ,
                          validator: (value){
                            if ( value == null || value.isEmpty ) {
                              return "empty_phone_hint".tr() ;
                            }
                            else {
                              return null ;
                            }
                          },
                        ) , 
                        SizedBox( height: 24.h ,) ,
                        CustomElevatedButton( child: Text( "create_account".tr() , 
                            style: GoogleFonts.roboto(
                              fontSize: 20.sp , 
                              fontWeight: .w400 ,
                            ) ,
                          ),
                          onpressed: (){
                            if ( formKey.currentState!.validate() ) {
                              Navigator.of(context).pushReplacementNamed(AppRoutes.updateProfileScreen) ;
                            }
                          } , 
                        ) ,
                        SizedBox( height: 18.h ,) ,
                        Row(
                          mainAxisAlignment: .center ,
                          textDirection: context.locale.languageCode == 'ar' ? .rtl : .ltr ,
                          children: [
                            Text("already_have_account".tr() , 
                              style: GoogleFonts.roboto(
                                color: Colors.white ,
                                fontSize: 14.sp ,
                                fontWeight: .w400
                              ) ,
                            ) ,
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text( "login".tr() ,
                                style: GoogleFonts.roboto(
                                color: Color(0xffF6BD00) ,
                                fontSize: 14.sp ,
                                fontWeight: .w900
                              )  ,
                              ),
                            ),
                          ],
                        ) ,
                        SizedBox( height: 18.h ,) ,
                        LanguageToggle() ,
                      ],
                    )
                  ) ,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}