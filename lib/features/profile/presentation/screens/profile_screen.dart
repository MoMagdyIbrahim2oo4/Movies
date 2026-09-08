import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/constants/app_colors.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/models/avater_model.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/core/widgets/movies_grid_view.dart';
import 'package:movies/core/widgets/sliver_tab_bar_delegate.dart';
import 'package:movies/features/Auth/services/firebase_services.dart';
import 'package:movies/features/profile/presentation/widgets/profile_info_section.dart';
import 'package:movies/features/profile/presentation/widgets/profile_tab_bar.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  late List<AvatarModel> avatars;
  late AvatarModel avatar;

  String userName = "";

  String _oldAvatar = '';
  bool _isLoadingData = true;

  Future<void> _fetchUserData() async {
    final fb_auth.User? currentUser = fb_auth.FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      userName = currentUser.displayName ?? '';
      try {
        final data = await FirebaseService().getUserData();
        if (data != null) {
          userName = data['name'] ?? userName;
          _oldAvatar = data['avatar'] ?? '';
        }
      } catch (_) {
        userName = userName;
      }

      avatar = avatars.firstWhere(
        (a) => a.avatarPath == _oldAvatar,
        orElse: () => avatars[0],
      );
    }

    if (mounted) {
      setState(() {
        _isLoadingData = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    avatars = AvatarModel.getAvatars();
    avatar = avatars[0];
    _tabController = TabController(length: 2, vsync: this);
    _fetchUserData();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onEditProfile() async {
    await Navigator.pushNamed(context, AppRoutes.updateProfileScreen);
    _isLoadingData = true;
    if (mounted) setState(() {});
    _fetchUserData();
  }

  void _onExit() async {
    await fb_auth.FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoadingData) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: AppColors.amber),
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: ProfileInfoSection(
                  name: userName,
                  avatarPath: avatar.avatarPath,
                  wishListCount: 12,
                  historyCount: 10,
                  onEditProfile: _onEditProfile,
                  onExit: _onExit,
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: SliverTabBarDelegate(
                  height: 90.h,
                  child: ProfileTabBar(tabController: _tabController),
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _tabController,
            children: [
              Center(child: Image.asset(AppImages.empty)),
              MoviesGridView(movies: Movie.movies, crossAxisCount: 3),
            ],
          ),
        ),
      ),
    );
  }
}
