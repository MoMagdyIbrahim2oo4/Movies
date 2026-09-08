import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies/core/constants/app_colors.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/features/Auth/services/firebase_services.dart';
import 'package:movies/features/Auth/utilities/toast.dart';

class AuthProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isUpdating = false;
  bool isDeleting = false;
  final FirebaseService _firebaseService = FirebaseService();

  Future<void> register({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
    required String avatar,
    required String phoneNumber,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      await _firebaseService.createAccount(
        name: name,
        email: email,
        password: password,
        avatar: avatar,
        phoneNumber: phoneNumber,
      );

      if (context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.mainLayoutScreen,
          (_) => false,
        );
      }
    } catch (e) {
      if (context.mounted) {
        Toast.showToast(title: e.toString().tr(), context: context);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> login({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      isLoading = true;
      notifyListeners();

      await _firebaseService.login(email: email, password: password);

      if (context.mounted) {
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.updateProfileScreen ,
          (_) => false,
);
      }
    } catch (e) {
      if (context.mounted) {
        Toast.showToast(title: e.toString().tr(), context: context);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> forgetPassword({
    required BuildContext context,
    required String email,
  }) async {
    try {
      isLoading = true;
      notifyListeners();
      
      await _firebaseService.forgetPassword(email: email);
      
      if (context.mounted) {
        Toast.showToast(
          title: "check_your_email".tr(), 
          context: context, 
          color: AppColors.green,
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (context.mounted) {
        Toast.showToast(title: e.toString().tr(), context: context);
      }
    }
    isLoading = false;
    notifyListeners();
  }

  Future<void> updateProfile({
    required BuildContext context,
    String? name,
    String? avatar,
    String? phoneNumber,
  }) async {
    try {
      isUpdating = true;
      notifyListeners();
      
      await _firebaseService.updateUser(
        name: name,
        avatar: avatar,
        phoneNumber: phoneNumber,
      );
      
      if (context.mounted) {
        Toast.showToast(
          title: "profile_updated_successfully".tr(), 
          context: context, 
          color: AppColors.green,
        );
      }
    } catch (e) {
      if (context.mounted) {
        Toast.showToast(title: e.toString().tr(), context: context);
      }
    }
    isUpdating = false;
    notifyListeners();
  }

  Future<void> deleteAccount({required BuildContext context}) async {
    try {
      isDeleting = true;
      notifyListeners();
      
      await _firebaseService.deleteAccount();
      
      if (context.mounted) {
        Toast.showToast(
          title: "account_deleted_successfully".tr(), 
          context: context,
          color: AppColors.green,
        );
        Navigator.of(context).pushNamedAndRemoveUntil(
          AppRoutes.loginScreen,
          (_) => false,
        );
      }
    } catch (e) {
      if (context.mounted) {
        Toast.showToast(title: e.toString().tr(), context: context);
      }
    }
    isDeleting = false;
    notifyListeners();
  }
}