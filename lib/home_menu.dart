import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:meyo_impact/features/personalization/screens/hakaton_widgets/achievements_screen.dart';
import 'package:meyo_impact/features/personalization/screens/hakaton_widgets/leaderboard.dart';
import 'package:meyo_impact/features/personalization/screens/hakaton_widgets/roadmap.dart';
import 'package:meyo_impact/features/shop/screens/hakaton_screens/achievement_screen/achievement_screen_h.dart';
import 'package:meyo_impact/features/shop/screens/hakaton_screens/choose_screen.dart';
import 'package:meyo_impact/features/shop/screens/hakaton_screens/community_screen.dart';
import 'package:meyo_impact/features/shop/screens/hakaton_screens/emotions_screen.dart';
import 'package:meyo_impact/features/shop/screens/hakaton_screens/home_screen/home_screen_h.dart';
import 'package:meyo_impact/features/shop/screens/hakaton_screens/study_screen/study_screen.dart';

import 'features/personalization/screens/setting/settings.dart';
import 'features/shop/screens/favourites/favourite.dart';
import 'features/shop/screens/home/home.dart';
import 'features/shop/screens/store/store.dart';
import 'utils/constants/colors.dart';
import 'utils/helpers/helper_functions.dart';

class HomeMenu extends StatelessWidget {
  const HomeMenu({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AppScreenController());
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          animationDuration: const Duration(seconds: 3),
          selectedIndex: controller.selectedMenu.value,
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.black
              : Colors.white,
          elevation: 0,
          indicatorColor: THelperFunctions.isDarkMode(context)
              ? TColors.white.withOpacity(0.1)
              : TColors.black.withOpacity(0.1),
          onDestinationSelected: (index) =>
              controller.selectedMenu.value = index,
          destinations: const [
            NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
            NavigationDestination(
                icon: Icon(Iconsax.calendar), label: 'Emotions'),
            NavigationDestination(
                icon: Icon(Iconsax.people), label: 'Community'),
            NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedMenu.value]),
    );
  }
}

class AppScreenController extends GetxController {
  static AppScreenController get instance => Get.find();

  final Rx<int> selectedMenu = 0.obs;

  final screens = [
    const HomeScreenH(),
    const CalendarWidget(),
    EmotionsScreen(),
    const SettingsScreen()
  ];
}
