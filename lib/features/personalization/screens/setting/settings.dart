import 'package:meyo_impact/features/personalization/screens/hakaton_widgets/achievements_screen.dart';
import 'package:meyo_impact/features/shop/screens/hakaton_screens/choose_screen.dart';

import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/controllers/dummy_data.dart';
import '../../../shop/screens/cart/cart.dart';
import '../../../shop/screens/order/order.dart';
import '../../controllers/user_controller.dart';
import '../address/address.dart';
import '../profile/profile.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// AppBar
                  TAppBar(title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),

                  /// User Profile Card
                  TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                  const SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Profile Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Account  Settings
                  const TSectionHeading(title: 'Account Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.safe_home,
                  //   title: 'Choose path',
                  //   subTitle: 'Set shopping delivery address',
                  //   onTap: () => Get.to(() => ChooseWidget()),
                  // ),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.tree,
                  //   title: 'Tree something',
                  //   subTitle: 'Add items test',
                  //   onTap: () => Get.to(() => const CartScreen()),
                  // ),
                  TSettingsMenuTile(
                    icon: Iconsax.medal,
                    title: 'My achievements',
                    subTitle: 'In-progress and Completed achievements',
                    onTap: () => Get.to(() => AchievementsWidget()),
                  ),
                  const TSettingsMenuTile(
                      icon: Iconsax.bank, title: 'Bank Account', subTitle: 'Withdraw balance to registered bank account'),
                  const TSettingsMenuTile(
                      icon: Iconsax.discount_shape, title: 'My Coupons', subTitle: 'List of all the discounted coupons'),
                  TSettingsMenuTile(
                      icon: Iconsax.notification, title: 'Notifications', subTitle: 'Set any kind of notification message', onTap: () {}),
                  const TSettingsMenuTile(
                      icon: Iconsax.security_card, title: 'Account Privacy', subTitle: 'Manage data usage and connected accounts'),

                  /// -- App Settings
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: 'App Settings', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Allow others to see your location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe Mode',
                    subTitle: 'Search result is safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  // TSettingsMenuTile(
                  //   icon: Iconsax.image,
                  //   title: 'HD Image Quality',
                  //   subTitle: 'Set image quality to be seen',
                  //   trailing: Switch(value: false, onChanged: (value) {}),
                  // ),

                  /// -- Logout Button
                  const SizedBox(height: TSizes.spaceBtwSections),
                  SizedBox(width: double.infinity, child: OutlinedButton(onPressed: () => controller.logout(), child: const Text('Logout'))),
                  const SizedBox(height: TSizes.spaceBtwSections * 3.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
