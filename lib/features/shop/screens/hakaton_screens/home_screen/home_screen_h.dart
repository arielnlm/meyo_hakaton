import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meyo_impact/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:meyo_impact/features/personalization/screens/hakaton_widgets/challenge_card.dart';
import 'package:meyo_impact/features/personalization/screens/hakaton_widgets/leaderboard.dart';
import 'package:meyo_impact/features/personalization/screens/hakaton_widgets/roadmap.dart';
import 'package:meyo_impact/features/shop/controllers/home_controller.dart';
import 'package:meyo_impact/features/shop/screens/home/widgets/header_categories.dart';
import 'package:meyo_impact/features/shop/screens/home/widgets/header_search_container.dart';
import 'package:meyo_impact/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:meyo_impact/utils/constants/sizes.dart';

class HomeScreenH extends StatelessWidget {
  const HomeScreenH({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
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
                ],
              ),
            ),
            Text(
              'Todays challange',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            CustomCardWidget(
              accessible: true,
              challenge_name: 'Clean The Park',
              challenge_subtitle: 'Join us to clean the Central Park and make it a pleasant place for everyone. Bring your friends, family, and enthusiasm!',
              creator: "Eco Warriors",
              imagePath: 'assets/images/banners/banner10.jpg',
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            WeeklyRoadmap(
              completionRates: [
                1.0,
                0.8,
                0.5,
                0.2,
                0,
                0,
                0
              ], // Example completion rates
              taskNames: [
                'Monday',
                'Tuesday',
                'Wednesday',
                'Thrusday',
                'Friday',
                'Saturday',
                'Sunday'
              ], // Example task names
            ),
            const SizedBox(height: TSizes.spaceBtwSections),

            /// Leaderboard
            LeaderboardWidget(
              leaderboardItems: List.generate(
                5,
                (index) => LeaderBoardItem(
                    name: 'User ${index + 1}', score: (5 - index + 1) * 100),
              ),
            ),
            SizedBox(height: TSizes.spaceBtwSections * 4),
          ],
        ),
      ),
    );
  }
}
