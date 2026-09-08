import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/constants/app_avatars.dart';
import 'package:movies/core/constants/app_images.dart';
import 'package:movies/core/models/movie_model.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/core/widgets/movies_grid_view.dart';
import 'package:movies/core/widgets/sliver_tab_bar_delegate.dart';
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

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _onEditProfile() {
    Navigator.pushNamed(context, AppRoutes.updateProfileScreen);
  }

  void _onExit() {
    // TODO: logout func
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              SliverToBoxAdapter(
                child: ProfileInfoSection(
                  name: "John Safwat",
                  avatarPath: AppAvatars.avatar8,
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
