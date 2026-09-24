import 'package:easy_localization/easy_localization.dart';

class CategoryModel {
  final String genrsId;
  final String categoryName;

  CategoryModel({required this.genrsId, required this.categoryName});

  static List<CategoryModel> get categories => [
        CategoryModel(genrsId: 'Action', categoryName: 'Action'.tr()),
        CategoryModel(genrsId: 'Adventure', categoryName: 'Adventure'.tr()),
        CategoryModel(genrsId: 'Animation', categoryName: 'Animation'.tr()),
        CategoryModel(genrsId: 'Biography', categoryName: 'Biography'.tr()),
        CategoryModel(genrsId: 'Comedy', categoryName: 'Comedy'.tr()),
        CategoryModel(genrsId: 'Crime', categoryName: 'Crime'.tr()),
        CategoryModel(genrsId: 'Documentary', categoryName: 'Documentary'.tr()),
        CategoryModel(genrsId: 'Drama', categoryName: 'Drama'.tr()),
        CategoryModel(genrsId: 'Family', categoryName: 'Family'.tr()),
        CategoryModel(genrsId: 'Fantasy', categoryName: 'Fantasy'.tr()),
        CategoryModel(genrsId: 'History', categoryName: 'History'.tr()),
        CategoryModel(genrsId: 'Horror', categoryName: 'Horror'.tr()),
        CategoryModel(genrsId: 'Music', categoryName: 'Music'.tr()),
        CategoryModel(genrsId: 'Mystery', categoryName: 'Mystery'.tr()),
        CategoryModel(genrsId: 'Romance', categoryName: 'Romance'.tr()),
        CategoryModel(genrsId: 'Sci-Fi', categoryName: 'Sci-Fi'.tr()),
        CategoryModel(genrsId: 'Sport', categoryName: 'Sport'.tr()),
        CategoryModel(genrsId: 'Thriller', categoryName: 'Thriller'.tr()),
        CategoryModel(genrsId: 'War', categoryName: 'War'.tr()),
        CategoryModel(genrsId: 'Western', categoryName: 'Western'.tr()),
      ];
}