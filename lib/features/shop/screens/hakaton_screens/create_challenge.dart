import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meyo_impact/common/widgets/login_signup/add_challanges_form.dart';
import 'package:meyo_impact/features/personalization/screens/hakaton_widgets/add_challange_screen.dart';
import 'package:meyo_impact/features/personalization/screens/hakaton_widgets/event_detailed_view.dart';
import 'package:meyo_impact/utils/constants/colors.dart';
import 'package:meyo_impact/utils/constants/sizes.dart';

class CreateChallengeWidget extends StatelessWidget {
  const CreateChallengeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample data for the switch and the list
    // List of challenge names
final List<String> challenges = [
  'Clean our waters',
  'Stray dogs <3',
  'Plant one for the team',
];

// List of challenge states
final List<String> states = ['Active', 'Pending', 'Active'];

// List of challenge descriptions
final List<String> descriptions = [
  'Join us to clean the local waters and protect marine life.',
  'Help us provide care and shelter for stray dogs.',
  'Participate in a community tree planting initiative.',
];

// List of challenge locations
final List<String> locations = [
  'Crystal Lake, Springfield',
  'Downtown Animal Shelter',
  'Green Park, Newtown',
];

// List of challenge image URLs
final List<String> imageUrls = [
  'assets/images/banners/clean_water.jpg',
  'assets/images/banners/stray_dogs.jpg',
  'assets/images/banners/plant_trees.jpg',
];

// List of accessibility information
final List<bool> isAccessible = [true, false, true];

// List of causes
final List<String> causes = ['Environment', 'Animal Welfare', 'Community'];

// List of minimum people required
final List<int> minPeople = [20, 10, 30];

    return Column(
      children: [
        // Switch and its labels
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('All events',
                  style: Theme.of(context).textTheme.headlineSmall),
              FloatingActionButton(
                onPressed: () {
                  Get.to(() => AddChallengeScreen());
                },
                child: const Icon(
                  Icons.add,
                  color: TColors.white,
                ),
                backgroundColor: TColors.primary,
              ),
            ],
          ),
        ),
        // Challenges list
        for (var i = 0; i < challenges.length; i++)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ChallengeListItem(
              challengeName: challenges[i],
              challengeState: states[i],
              location: locations[i],
              isAccessible: isAccessible[i],
              imageUrl: imageUrls[i],
              eventDescription: descriptions[i],
              cause: causes[i],
              minPeople: minPeople[i],
            ),
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Events near me',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(
                height: TSizes.defaultSpace,
              ),
              Image.asset(
                'assets/images/content/googlemap.png', // Use the image path provided
                width: 400,
                height: 400, // Adjust the height as needed
                fit: BoxFit.cover, // Cover the card's width
              ),
            ],
          ),
        )
      ],
    );
  }
}

class ChallengeListItem extends StatelessWidget {
  final String challengeName;
  final String challengeState;
  final String eventDescription;
  final String location;
  final int minPeople;
  final bool isAccessible;
  final String cause;
  final String imageUrl;

  const ChallengeListItem({
    Key? key,
    required this.challengeName,
    required this.challengeState, required this.eventDescription, required this.location, required this.minPeople, required this.isAccessible, required this.cause, required this.imageUrl,
  }) : super(key: key);

  void changeScreen() {
    Get.to(() => EventScreen(
          eventName: challengeName,
          eventDescription: eventDescription,
          location: location,
          minPeople: minPeople,
          isAccessible: isAccessible,
          cause: cause,
          imageUrl: imageUrl,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: changeScreen,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        margin: const EdgeInsets.only(bottom: 10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 6,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                challengeName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              decoration: BoxDecoration(
                color: challengeState == 'Active'
                    ? Colors.green[100]
                    : Colors.red[100],
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Text(
                challengeState,
                style: TextStyle(
                  fontSize: 14,
                  color: challengeState == 'Active'
                      ? TColors.success
                      : TColors.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.share),
              color: TColors.primary,
              onPressed: () {
                // Handle share action
              },
            ),
          ],
        ),
      ),
    );
  }
}
