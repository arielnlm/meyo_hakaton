import 'package:flutter/material.dart';
import 'package:meyo_impact/common/widgets/appbar/appbar.dart';
import 'package:meyo_impact/common/widgets/login_signup/add_challanges_form.dart';
import 'package:meyo_impact/features/shop/screens/hakaton_screens/achievement_screen/location_search_delegate.dart';
import 'package:meyo_impact/utils/constants/sizes.dart';

class AddChallengeScreen extends StatelessWidget {
  const AddChallengeScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///  Title
              Text("Make your event", style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: TSizes.spaceBtwSections),
              /// Form
              AddChallengeForm(),
              const SizedBox(height: TSizes.spaceBtwSections),
              MapSample(),
            ],
          ),
        ),
      ),
    );;
  }
}