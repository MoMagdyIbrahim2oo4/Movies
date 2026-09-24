import 'package:flutter/material.dart';

import '../widgets/category_bloc_builder.dart';

class BrowseScreen extends StatelessWidget {
  const BrowseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CategoryBlocBuilder();
  }
}
