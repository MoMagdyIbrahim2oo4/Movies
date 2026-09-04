import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movies/core/constants/app_icons.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/constants/app_text_styles.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/features/Auth/utilities/form_validation.dart';
import 'package:movies/features/Auth/widgets/language_toggle.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  
  final GlobalKey<FormState> formKey  = GlobalKey<FormState>() ;

  final TextEditingController emailController = TextEditingController() ;
  final TextEditingController passwordController = TextEditingController() ;

  bool isSecure = true ;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric( horizontal: 16.w ),
              child: Column(
                children: [
                  SizedBox(
                    width: 121.w ,
                    height: 118.h ,
                    child: Image( image: AssetImage(AppImages.appLogo ) , ) ,
                  ),
                  SizedBox( height: 69.h , ) ,
                  Form(
                    key: formKey ,
                    child: Column(
                      crossAxisAlignment: .stretch ,
                      children: [
                        CustomTextFormField( hintText: "email".tr() ,
                          prefixIcon: Padding(
                            padding: EdgeInsets.only( left: 20.w , right: 8 ),
                            child: SvgPicture.asset(AppIcons.emailIcon),
                          ) , 
                          controller: emailController ,
                          validator: (value) => FormValidation.emailValidation(value) ,
                        ) , 
                        SizedBox( height: 16.h ,) ,
                        CustomTextFormField( hintText: "password".tr() , 
                          prefixIcon: Padding(
                            padding: EdgeInsets.only( left: 20.w , right: 8 ),
                            child: SvgPicture.asset(AppIcons.passwordIcon),
                          )  ,
                          suffixIcon: InkWell(
                            onTap: (){
                              setState(() {
                                isSecure=!isSecure;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: isSecure?Icon(Icons.visibility_off_outlined):Icon(Icons.visibility_outlined),
                            ) ,
                          ) , 
                          isObscure : isSecure ,
                          controller: passwordController ,
                          validator: (value) => FormValidation.passwordValidation(value) ,
                        ) , 
                        SizedBox( height: 8.h ,) ,
                        Align(
                          alignment: .centerEnd ,
                          child: InkWell(
                            onTap: () {
                              Navigator.pushNamed( 
                                context , 
                                AppRoutes.forgetPasswordScreen , 
                              ) ;
                            },
                            child: Text( "forget_password_hint".tr() , style: AppTextStyles.regular14Amber , ),
                          ),
                        ),
                        SizedBox( height: 33.h ,) ,
                        CustomElevatedButton( 
                          child: 
                          Text( "login".tr() , style: AppTextStyles.regular20DarkGray , ),
                          onpressed: (){
                            if ( formKey.currentState!.validate() ) {
                                Navigator.of(context).pushReplacementNamed(AppRoutes.updateProfileScreen) ;
                            }
                          } , 
                        ) ,
                        SizedBox( height: 23.h ,) ,
                        Row(
                          mainAxisAlignment: .center ,
                          textDirection: context.locale.languageCode == 'ar' ? .rtl : .ltr ,
                          children: [
                            Text("don't_have_account".tr() , style: AppTextStyles.regular14White , ) ,
                            InkWell(
                              onTap: () => Navigator.pushNamed(context, AppRoutes.registerScreen ) ,
                              child: Text( "create_one".tr() , style: AppTextStyles.regular14Amber , ),
                            ),
                          ],
                        ) ,
                        SizedBox( height: 28.h ,) , 
                        Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              indent: 80 ,
                              color: Color(0xffF6BD00),
                              thickness: 1,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text( 'or'.tr() , style: AppTextStyles.regular14Amber , ),
                          ),
                          const Expanded(
                            child: Divider(
                              endIndent: 80 ,
                              color: Color(0xffF6BD00) ,
                              thickness: 1,
                            ),
                          ),
                        ],
                      ) ,
                        SizedBox( height: 28.h ,) , 
                        CustomElevatedButton( 
                          onpressed: (){

                          } , 
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              SvgPicture.asset( AppIcons.googleIcon ) ,
                              SizedBox( width: 11.w ,) ,
                              Text( "login_with_google".tr() , style: AppTextStyles.regular16DarkGray , ) ,
                            ],
                          ),
                        ) ,
                        SizedBox( height: 34.h ,) ,
                        const LanguageToggle() ,
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
