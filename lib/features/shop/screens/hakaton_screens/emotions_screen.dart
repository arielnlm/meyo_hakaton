import 'package:flutter/material.dart';
import 'package:meyo_impact/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:meyo_impact/features/shop/screens/hakaton_screens/create_challenge.dart';
import 'package:meyo_impact/features/shop/screens/home/widgets/header_search_container.dart';
import 'package:meyo_impact/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:meyo_impact/utils/constants/sizes.dart';

class EmotionsScreen extends StatelessWidget {
  const EmotionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// Header
            const TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Searchbar
                  TSearchContainer(
                      text: 'Search for event', showBorder: false),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// -- Categories
                  // THeaderCategories(),
                  // SizedBox(height: TSizes.spaceBtwSections * 2),
                ],
              ),
            ),
            
            CreateChallengeWidget(),
            SizedBox(height: TSizes.spaceBtwSections * 4),
          ],
        ),
      ),
    );
  }
}
