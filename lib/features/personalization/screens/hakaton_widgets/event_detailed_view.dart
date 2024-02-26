import 'package:flutter/material.dart';
import 'package:meyo_impact/common/widgets/appbar/appbar.dart';
import 'package:meyo_impact/features/shop/screens/hakaton_screens/challange_screen_card.dart';
import 'package:meyo_impact/utils/constants/sizes.dart';

class EventScreen extends StatelessWidget {
  // Dummy data for illustration. Replace with actual event data
  final String eventName;
  final String eventDescription;
  final String location;
  final int minPeople;
  final bool isAccessible;
  final String cause;
  final String imageUrl;

  EventScreen(
      {Key? key,
      required this.eventName,
      required this.eventDescription,
      required this.location,
      required this.minPeople,
      required this.isAccessible,
      required this.cause,
      required this.imageUrl})
      : super(key: key);

  final List<Donator> topDonators = [
    Donator(
        name: 'Alex Smith',
        profilePicture: 'assets/images/reviews/review_profile_image_1.jpg',
        donationAmount: 150.0),
    Donator(
        name: 'Linda Johnson',
        profilePicture: 'assets/images/reviews/review_profile_image_2.jpeg',
        donationAmount: 120.0),
    Donator(
        name: 'Michael Brown',
        profilePicture: 'assets/images/reviews/review_profile_image_3.jpeg',
        donationAmount: 100.0),
    // Add more donators as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(eventName),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    eventName,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    eventDescription,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      Icon(Icons.location_on),
                      SizedBox(width: 8),
                      Text(location),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.group),
                      SizedBox(width: 8),
                      Text("Minimum People: $minPeople"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(isAccessible
                          ? Icons.accessible
                          : Icons.accessible_forward),
                      SizedBox(width: 8),
                      Text(isAccessible
                          ? "Accessible for Everyone"
                          : "Not Accessible"),
                    ],
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.favorite),
                      SizedBox(width: 8),
                      Text("Cause: $cause"),
                    ],
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      // Handle Join Event Action
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.defaultSpace / 3,),
                      child: Text("Join Event"),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor,
                      onPrimary: Colors.white,
                    ),
                  ),
                  SizedBox(height: TSizes.spaceBtwSections),
                  Text('Participants',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: TSizes.spaceBtwItems),
                  Divider(),
                  // List top donators
                  for (var donator in topDonators)
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(donator.profilePicture),
                      ),
                      title: Text(donator.name),
                      trailing: Icon(Icons.accessible),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
