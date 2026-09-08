import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/constants/app_colors.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/core/models/avater_model.dart';
import 'package:movies/core/widgets/custom_elevated_button.dart';
import 'package:movies/core/widgets/custom_text_form_field.dart';
import 'package:movies/features/Auth/manager/auth_provider.dart';
import 'package:movies/features/Auth/services/firebase_services.dart';
import 'package:movies/features/updateProfile/presentation/view/avatars_sheet.dart';
import 'package:provider/provider.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  late List<AvatarModel> avatars;
  late AvatarModel avatar;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  String _oldName = '';
  String _oldPhone = '';
  String _oldAvatar = '';
  bool _isLoadingData = true;

  @override
  void initState() {
    super.initState();
    avatars = AvatarModel.getAvatars();
    avatar = avatars[0];
    _fetchUserData();
  }

  Future<void> _fetchUserData() async {
    final fb_auth.User? currentUser = fb_auth.FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      _oldName = currentUser.displayName ?? '';
      try {
        final data = await FirebaseService().getUserData();
        if (data != null) {
          _oldName = data['name'] ?? '';
          _oldPhone = data['phoneNumber'] ?? '';
          _oldAvatar = data['avatar'] ?? '';
        }
      } catch (e) {
        _oldName = _oldName;
      }

      nameController.text = _oldName;
      phoneController.text = _oldPhone;

      avatar = avatars.firstWhere(
        (a) => a.avatarPath == _oldAvatar,
        orElse: () => avatars.isNotEmpty
            ? avatars[0]
            : AvatarModel(avatarId: '', avatarPath: ''),
      );
    }

    if (mounted) {
      setState(() {
        _isLoadingData = false;
      });
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
        title: Text(
          "pickAvatar".tr(),
          style: Theme.of(context).textTheme.labelSmall,
        ),
      ),
      body: _isLoadingData
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.amber),
            )
          : Padding(
              padding: EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                    child: InkWell(
                      onTap: () {
                        showAvatarsSheet(
                          context,
                          onAvatarClicked,
                          avatars,
                          avatar,
                        );
                      },
                      child: Image.asset(avatar.avatarPath),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    controller: nameController,
                    prefixIcon: const Icon(Icons.person),
                  ),
                  SizedBox(height: 20.h),
                  CustomTextFormField(
                    controller: phoneController,
                    prefixIcon: const Icon(Icons.phone),
                  ),
                  SizedBox(height: 20.h),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.forgetPasswordScreen,
                      );
                    },
                    child: Text(
                      "resetPassword".tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                  const Spacer(),
                  CustomElevatedButton(
                    onpressed: authProvider.isDeleting
                        ? null
                        : () async {
                            await authProvider.deleteAccount(context: context);
                          },
                    backGroundColor: AppColors.crimson,
                    child: authProvider.isDeleting
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "deleteAccount".tr(),
                            style: Theme.of(context).textTheme.labelMedium!,
                          ),
                  ),
                  SizedBox(height: 20.h),
                  CustomElevatedButton(
                    onpressed: authProvider.isUpdating
                        ? null
                        : () {
                            final String? newName =
                                nameController.text.trim() != _oldName
                                ? nameController.text.trim()
                                : null;

                            final String? newPhone =
                                phoneController.text.trim() != _oldPhone
                                ? phoneController.text.trim()
                                : null;

                            final String? newAvatar =
                                avatar.avatarPath != _oldAvatar
                                ? avatar.avatarPath
                                : null;

                            if (newName == null && newPhone == null && newAvatar == null) {
                              return;
                            }

                            authProvider.updateProfile(
                              context: context,
                              name: newName,
                              phoneNumber: newPhone,
                              avatar: newAvatar,
                            );
                          },
                    child: authProvider.isUpdating
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                            "updateData".tr(),
                            style: Theme.of(context).textTheme.labelLarge!,
                          ),
                  ),
                ],
              ),
            ),
    );
  }

  void onAvatarClicked(AvatarModel avatarModel) {
    setState(() {
      avatar = avatarModel;
    });
  }
}
