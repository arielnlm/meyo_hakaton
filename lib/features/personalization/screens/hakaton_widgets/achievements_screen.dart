import 'package:flutter/material.dart';
import 'package:meyo_impact/common/widgets/appbar/appbar.dart';

class Achievement {
  final IconData icon;
  final String name;
  final String type;

  Achievement({required this.icon, required this.name, required this.type});
}

class AchievementsWidget extends StatelessWidget {
  // Dummy data for the achievements
  final List<Achievement> achievements = [
    Achievement(icon: Icons.star, name: 'Super Star', type: 'Skills'),
    Achievement(icon: Icons.lock, name: 'Lock Master', type: 'Skills'),
    Achievement(icon: Icons.lightbulb, name: 'Idea Generator', type: 'Ideas'),
    Achievement(icon: Icons.thumb_up, name: 'Thumb Leader', type: 'Social'),
    // Add more achievements here...
  ];

  @override
  Widget build(BuildContext context) {
    // Group achievements by type
    Map<String, List<Achievement>> groupedAchievements = {};
    for (var achievement in achievements) {
      groupedAchievements.putIfAbsent(achievement.type, () => []);
      groupedAchievements[achievement.type]?.add(achievement);
    }

    return Scaffold(
      appBar: TAppBar(showBackArrow: true, title: Text('Achievements', style: Theme.of(context).textTheme.headlineSmall)),
      extendBody: true,
      body: ListView(
        children: groupedAchievements.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  entry.key,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                physics:
                    NeverScrollableScrollPhysics(), // to disable GridView's scrolling
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                  childAspectRatio: 1,
                ),
                itemCount: entry.value.length,
                itemBuilder: (context, index) {
                  return _buildAchievementItem(context, entry.value[index]);
                },
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildAchievementItem(BuildContext context, Achievement achievement) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: () => _showBadgePopup(context, achievement),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                achievement.icon,
                size: 32.0,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 8),
              Text(
                achievement.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showBadgePopup(BuildContext context, Achievement achievement) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(achievement.name),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(achievement.icon,
                  size: 64.0, color: Theme.of(context).primaryColor),
              SizedBox(height: 24.0),
              LinearProgressIndicator(
                value: 0.7,
                minHeight: 10.0,
                backgroundColor: Colors.grey.shade200,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(height: 16.0),
              Text('Progress: 7/10', style: TextStyle(fontSize: 16)),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('GOT IT!',
                  style: TextStyle(color: Theme.of(context).primaryColor)),
            ),
          ],
        );
      },
    );
  }
}
