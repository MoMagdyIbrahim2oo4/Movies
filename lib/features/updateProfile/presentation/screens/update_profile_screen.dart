import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/constants/app_colors.dart';
import 'package:movies/core/models/avater_model.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/features/updateProfile/presentation/view/avatars_sheet.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late List<AvatarModel> avatars;
  late AvatarModel avatar;

  @override
  void initState() {
    super.initState();
    avatars = AvatarModel.getAvatars();
    avatar = avatars[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
        title: Text(
          "pickAvatar".tr(),
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: .stretch,
            spacing: 20.h,
            children: [
              Center(child: InkWell(
                onTap: (){
                  showAvatarsSheet(context,onAvatarClicked,avatars,avatar);
                },
                  child: Image.asset(avatar.avatarPath))),
              CustomTextFormField(prefixIcon: Icon(Icons.person)),
              CustomTextFormField(prefixIcon: Icon(Icons.phone)),
              Text(
                "resetPassword".tr(),
                style: Theme.of(context).textTheme.labelMedium,
              ),
              Spacer(),
              CustomElevatedButton(
                onpressed: () {},
                backGroundColor: AppColors.crimson,
                child: Text( "deleteAccount".tr(),
                  style: Theme.of(context).textTheme.labelMedium!,
                ),
              ),
              CustomElevatedButton(
                onpressed: () {},
                child: Text( "updateData".tr(),
                  style: Theme.of(context).textTheme.labelLarge!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onAvatarClicked(AvatarModel avatarModel){
    setState(() {
      avatar=avatarModel;
    });
  }
}
