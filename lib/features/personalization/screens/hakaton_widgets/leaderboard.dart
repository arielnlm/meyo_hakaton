import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:meyo_impact/utils/constants/colors.dart';
import 'package:meyo_impact/utils/constants/sizes.dart';
import 'package:meyo_impact/utils/theme/widget_themes/text_theme.dart';

class LeaderBoardItem {
  final String name;
  final int score;

  LeaderBoardItem({required this.name, required this.score});
}

class LeaderboardWidget extends StatelessWidget {
  final List<LeaderBoardItem> leaderboardItems;

  const LeaderboardWidget({Key? key, required this.leaderboardItems})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Best this week',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        Column(
          children: leaderboardItems.asMap().entries.map((entry) {
            int index = entry.key;
            LeaderBoardItem item = entry.value;
            return LeaderboardTile(
              name: item.name,
              score: item.score,
              position: index + 1,
              isTopThree: index < 3,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class LeaderboardTile extends StatelessWidget {
  final String name;
  final int score;
  final int position;
  final bool isTopThree;

  const LeaderboardTile({
    Key? key,
    required this.name,
    required this.score,
    required this.position,
    this.isTopThree = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.spaceBtwItems / 2),
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      decoration: BoxDecoration(
        color: isTopThree ? TColors.primary : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: isTopThree ? TColors.white : Colors.grey[300],
            child: Text(
              position.toString(),
              style: TextStyle(
                color: isTopThree ? TColors.black : Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isTopThree ? Colors.white : Colors.black,
            ),
          ),
          Text(
            '$score pts',
            style: TextStyle(
              fontSize: 16,
              color: isTopThree ? Colors.white : Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

// Example usage:
class LeaderboardScreen extends StatelessWidget {
  LeaderboardScreen({Key? key}) : super(key: key);

  final List<LeaderBoardItem> leaderboardItems = List.generate(
    10,
    (index) =>
        LeaderBoardItem(name: 'User ${index + 1}', score: (index + 1) * 100),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Best this week'),
        backgroundColor: Colors.blueAccent,
      ),
      body: LeaderboardWidget(leaderboardItems: leaderboardItems),
    );
  }
}
