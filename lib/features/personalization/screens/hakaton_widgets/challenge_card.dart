import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meyo_impact/features/shop/screens/hakaton_screens/challange_screen_card.dart';
import 'package:meyo_impact/utils/constants/colors.dart';
import 'package:meyo_impact/utils/constants/sizes.dart';
import 'package:meyo_impact/utils/device/device_utility.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    Key? key,
    this.accessible = false,
    required this.challenge_name,
    required this.challenge_subtitle,
    required this.creator,
    required this.imagePath, // Add this line
  }) : super(key: key);

  final String challenge_name, challenge_subtitle, creator, imagePath; // Add this line
  final bool accessible;

  void goToPage() {
    Get.to(() => ChallengeCard(
      imagePath: 'assets/images/banners/banner10.jpg',
        challengeName: challenge_name,
        creatorName: creator,
        description: challenge_subtitle,
        challengeIcon: Icons.nature_people,
        participants: 150,
        totalFundsRaised: 752));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: goToPage,
      child: Stack(
        children: [
          Card(
            color: TColors.light,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Container(
              width: TDeviceUtils.getScreenWidth(context) * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image on top of the card
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
                    child: Image.asset(
                      imagePath, // Use the image path provided
                      width: double.infinity, // Make the image take the full width of the card
                      height: 150, // Adjust the height as needed
                      fit: BoxFit.cover, // Cover the card's width
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(TSizes.defaultSpace),
                    child: Row(
                      children: [
                        // Left side icon (if you want to keep the icon alongside the image)
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: TColors.primary,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(Icons.nature_people, size: 60, color: TColors.white),
                        ),
                        SizedBox(width: 16),
                        // Right side text details
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                challenge_name,
                                style: Theme.of(context).textTheme.headlineSmall!.apply(color: TColors.black),
                              ),
                              Text(
                                creator,
                                style: Theme.of(context).textTheme.labelSmall!.apply(color: TColors.darkGrey),
                              ),
                              const SizedBox(height: TSizes.spaceBtwItems),
                              Text(
                                challenge_subtitle,
                                style: Theme.of(context).textTheme.bodySmall!.apply(color: TColors.black),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Conditional rendering of the accessibility icon (same as before)
          if (accessible)
            Positioned(
              top: 12,
              right: 12,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: TColors.primary,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  Icons.accessible,
                  color: TColors.white,
                  size: 24,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
