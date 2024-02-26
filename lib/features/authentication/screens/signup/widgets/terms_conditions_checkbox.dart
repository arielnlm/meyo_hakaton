import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helper_functions.dart';
import '../../../controllers/signup_controller.dart';


class TTermsAndConditionCheckbox extends StatelessWidget {
  const TTermsAndConditionCheckbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    return Row(
      children: [
        // Wrap in a Sized box to remove extra padding
        SizedBox(width: 24, height: 24, child: Obx(() => Checkbox(value: controller.privacyPolicy.value, onChanged: (value){controller.privacyPolicy.value = value!;}))),
        const SizedBox(width: TSizes.md),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: '${TTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: TTexts.privacyPolicy,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.primary,
                ),
              ),
              TextSpan(text: ' ${TTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
              TextSpan(
                text: TTexts.termsOfUse,
                style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: THelperFunctions.isDarkMode(context) ? TColors.white : TColors.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}