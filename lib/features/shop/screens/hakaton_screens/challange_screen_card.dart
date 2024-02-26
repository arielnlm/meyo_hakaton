import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meyo_impact/common/widgets/appbar/appbar.dart';
import 'package:meyo_impact/utils/constants/colors.dart';
import 'package:meyo_impact/utils/constants/sizes.dart';

class ChallengeCard extends StatelessWidget {
  final String challengeName;
  final String creatorName;
  final String description;
  final IconData challengeIcon;
  final int participants;
  final double totalFundsRaised;

  final String imagePath; // Add this line to include the image path

  ChallengeCard({
    Key? key,
    required this.challengeName,
    required this.creatorName,
    required this.description,
    required this.challengeIcon,
    required this.participants,
    required this.totalFundsRaised,
    required this.imagePath, // Add this line for the image path
  }) : super(key: key);

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
      appBar: TAppBar(showBackArrow: true, title: Text("Today's challenge"),),
      body: SingleChildScrollView(
        child: Card(
          color: TColors.white,
          margin: EdgeInsets.all(8.0),
          elevation: 4.0,
          child: Column(
            children: [
              Image.asset(
                imagePath, // Use the image path provided
                width: double
                    .infinity, // Make the image take the full width of the screen
                height: 200, // Adjust the height as needed
                fit: BoxFit.cover, // Cover the card's width
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ListTile(
                      leading: Icon(challengeIcon, size: 40.0),
                      title: Text(challengeName,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text('Created by $creatorName'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(description,
                          maxLines: 3, overflow: TextOverflow.ellipsis),
                    ),
                    Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('$participants Participants'),
                        Text('\$$totalFundsRaised Raised'),
                      ],
                    ),
                    SizedBox(height: 8.0),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.all(TSizes.defaultSpace),
                        child: ElevatedButton.icon(
                          onPressed: () {
                            // Handle donate button action
                          },
                          icon: Icon(Icons.favorite_border),
                          label: Text('Donate'),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(TSizes.defaultSpace),
                            primary: TColors.primary,
                            onPrimary: TColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text('Top Donators',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Divider(),
                    // List top donators
                    for (var donator in topDonators)
                      ListTile(
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(donator.profilePicture),
                        ),
                        title: Text(donator.name),
                        trailing: Text(
                            '\$${donator.donationAmount.toStringAsFixed(2)}'),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Donator {
  final String name;
  final String profilePicture;
  final double donationAmount;

  Donator({
    required this.name,
    required this.profilePicture,
    required this.donationAmount,
  });
}
