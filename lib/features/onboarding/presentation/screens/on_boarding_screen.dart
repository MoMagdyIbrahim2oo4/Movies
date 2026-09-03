import 'package:flutter/material.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/features/onboarding/data/services/onboarding_prefs.dart';
import 'package:movies/features/onboarding/presentation/widgets/onboarding_card_page.dart';
import 'package:movies/features/onboarding/presentation/widgets/onboarding_first_page.dart';
import '../../data/models/onboarding_item_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  final List<OnboardingItem> _items = OnboardingItem.getOnboarding();
  int _currentPage = 0;

  bool get _isFirstPage => _currentPage == 0;
  bool get _isSecondPage => _currentPage == 1;
  bool get _isLastPage => _currentPage == _items.length - 1;

  void _goNext() {
    if (_isLastPage) {
      OnboardingPrefs.setHasSeenOnboarding();
      Navigator.pushReplacementNamed(context, AppRoutes.loginScreen);
    } else {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutQuad,
      );
    }
  }

  void _goBack() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: _items.length,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) => setState(() => _currentPage = index),
        itemBuilder: (context, index) {
          final item = _items[index];
          return Stack(
            fit: StackFit.expand,
            children: [
              //  image
              Image.asset(item.imagePath, fit: BoxFit.cover),
              // Bottom card
              _isFirstPage
                  ? OnboardingFirstPage(item: item, onNext: _goNext)
                  : OnboardingCardPage(
                      item: item,
                      isSecondPage: _isSecondPage,
                      onNext: _goNext,
                      onBack: _goBack,
                    ),
            ],
          );
        },
      ),
    );
  }
}
