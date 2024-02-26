import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meyo_impact/common/widgets/appbar/appbar.dart';
import 'package:meyo_impact/utils/constants/colors.dart';
import 'package:meyo_impact/utils/constants/sizes.dart';

class EmotionPickerScreen extends StatefulWidget {
  @override
  _EmotionPickerScreenState createState() => _EmotionPickerScreenState();
}

class _EmotionPickerScreenState extends State<EmotionPickerScreen> {
  Set<int> _selectedEmotionsIndices =
      {}; // A set to keep track of selected indices

  final List<IconData> _emotionsIcons = [
    Icons.sentiment_very_satisfied, // Energetic
    Icons.sentiment_satisfied, // Happy
    Icons.sentiment_neutral, // Neutral
    Icons.sentiment_dissatisfied, // Sad
    Icons.sentiment_very_dissatisfied, // Angry
    Icons.sick, // Sick
    Icons.flare, // Excited
    Icons.favorite, // Loved
    Icons.mood_bad, // Grumpy
    Icons.nights_stay, // Tired
    Icons.snowboarding, // Adventurous
    Icons.sentiment_satisfied_alt, // Content
  ];

  final List<String> _emotionsTexts = [
    'Energetic',
    'Happy',
    'Neutral',
    'Sad',
    'Angry',
    'Sick',
    'Excited',
    'Loved',
    'Grumpy',
    'Tired',
    'Adventurous',
    'Content',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'How are you feeling?',
        ),
        showBackArrow: true,
      ),
      body: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: _emotionsIcons.length,
            itemBuilder: (context, index) {
              bool isSelected = _selectedEmotionsIndices.contains(index);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _selectedEmotionsIndices.remove(index);
                    } else {
                      _selectedEmotionsIndices.add(index);
                    }
                  });
                },
                child: Opacity(
                  opacity: isSelected
                      ? 1.0
                      : 0.4, // Full color for selected, greyed out for not
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _emotionsIcons[index],
                        size: 60,
                        color:
                            isSelected ? TColors.success : TColors.darkerGrey,
                      ),
                      SizedBox(height: 8),
                      Text(
                        _emotionsTexts[index],
                        style: TextStyle(
                          fontSize: 14,
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          ElevatedButton.icon(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.next_plan),
            label: Text('Confirm'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              primary: TColors.primary,
              onPrimary: TColors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
