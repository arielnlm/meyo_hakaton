import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../data/repositories/user/user_repository.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../personalization/controllers/user_controller.dart';
import '../../../../personalization/screens/profile/profile.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final userController = Get.put(UserController());

    return TAppBar(
      title: GestureDetector(
        onTap: () => Get.to(() => const ProfileScreen()),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() => Text(userController.user.value.fullName,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: TColors.grey))),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  TTexts.homeAppbarTitle,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white),
                ),
                Text(
                  " 76",
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .apply(color: TColors.white),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: const [
        TCartCounterIcon(
          iconColor: TColors.white,
          counterBgColor: TColors.black,
          counterTextColor: TColors.white,
          iconData: Icons.fitness_center,
        ),
        TCartCounterIcon(
          iconColor: TColors.white,
          counterBgColor: TColors.black,
          counterTextColor: TColors.white,
          iconData: Icons.psychology,
        ),
      ],
    );
  }
}
