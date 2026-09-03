import 'package:movies/core/constants/app_images.dart';

class OnboardingItem {
  final String imagePath;
  final String titleKey;
  final String? descriptionKey;
  final String buttonTextKey;

  const OnboardingItem({
    required this.imagePath,
    required this.titleKey,
    this.descriptionKey,
    required this.buttonTextKey,
  });
  static List<OnboardingItem> getOnboarding() {
    return [
      OnboardingItem(
        imagePath: AppImages.moviesPosters,
        titleKey: 'title_1',
        descriptionKey: 'desc_1',
        buttonTextKey: 'explore_now',
      ),
      OnboardingItem(
        imagePath: AppImages.avengers,
        titleKey: 'title_2',
        descriptionKey: 'desc_2',
        buttonTextKey: 'next',
      ),
      OnboardingItem(
        imagePath: AppImages.openheimer,
        titleKey: 'title_3',
        descriptionKey: 'desc_3',
        buttonTextKey: 'next',
      ),
      OnboardingItem(
        imagePath: AppImages.badBoys,
        titleKey: 'title_4',
        descriptionKey: 'desc_4',
        buttonTextKey: 'next',
      ),
      OnboardingItem(
        imagePath: AppImages.doctorStrange,
        titleKey: 'title_5',
        descriptionKey: 'desc_5',
        buttonTextKey: 'next',
      ),
      OnboardingItem(
        imagePath: AppImages.movie1917,
        titleKey: 'title_6',
        buttonTextKey: 'finish',
      ),
    ];
  }
}
