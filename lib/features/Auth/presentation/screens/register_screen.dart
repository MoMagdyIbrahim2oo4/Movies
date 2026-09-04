import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/app_icons.dart';
import 'package:movies/core/constants/app_text_styles.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/features/Auth/utilities/form_validation.dart';
import 'package:movies/features/Auth/widgets/avatar_pageview.dart';
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

  bool isSecurePassword = true ;
  bool isSecureConfirmPassword = true ;

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
        title: Text( "register".tr() , style: AppTextStyles.regular16Amber , )  ,
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
                    child: AvatarPageview() ,
                  ) ,
                  Text( "avatar".tr() , style: AppTextStyles.regular16White ) ,
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
                          validator: (value) => FormValidation.nameValidation(value) ,
                        ) , 
                        SizedBox( height: 24.h ,) ,
                        CustomTextFormField( hintText: "email".tr() ,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only( left: 20.w , right: 8 ),
                            child: SvgPicture.asset(AppIcons.emailIcon),
                          ) , 
                          controller: emailController ,
                          validator: (value) => FormValidation.emailValidation(value) ,
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
                          validator: (value) => FormValidation.passwordValidation(value) ,
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
                          validator: (value) => FormValidation.confirmPasswordValidation(value, passwordController, confirmPasswordController),
                        ) , 
                        SizedBox( height: 24.h ,) ,
                        CustomTextFormField( hintText: "phone_number".tr() ,
                        controller: phoneController , 
                          prefixIcon: Padding(
                            padding: EdgeInsets.only( left: 20.w , right: 8 ),
                            child: SvgPicture.asset(AppIcons.phoneIcon),
                          )  ,
                          validator: (value) => FormValidation.phoneValidation(value) ,
                        ) , 
                        SizedBox( height: 24.h ,) ,
                        CustomElevatedButton( 
                          child: Text(
                            "create_account".tr() , 
                            style: AppTextStyles.regular20DarkGray ,
                          ) ,
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
                            Text( "already_have_account".tr() , style: AppTextStyles.regular14White , ) ,
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text( "login".tr() , style: AppTextStyles.regular14Amber , ),
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