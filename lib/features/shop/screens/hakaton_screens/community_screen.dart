import 'package:flutter/material.dart';
import 'package:meyo_impact/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:meyo_impact/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:meyo_impact/utils/constants/colors.dart';
import 'package:meyo_impact/utils/constants/sizes.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarWidget extends StatelessWidget {
  const CalendarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MyHomePage();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> emotions = [
    'Happy',
    'Sad',
    'Angry',
    'Excited'
  ]; // Add more as needed

  Map<String, String> selectedCauses = {};

  Map<String, List<String>> topReasons = {
    'Happy': ['Sport', 'Movie', 'Weather'],
    'Sad': ['Friend', 'Weather', 'Hunger'],
    'Angry': ['Pet', 'Parking', 'Parents'],
    'Excited': ['Work', 'Love', 'Concert'],
  };

  String title = 'Emotion Calendar';
  String midSection = "On that day you've felt";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const TPrimaryHeaderContainer(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// -- Appbar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 64.0),
              child: Column(
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                          color: TColors.primary, // Adjust the color to fit your theme
                          fontWeight: FontWeight.bold,
                        ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems/2,),
                  Text(
                    "See how you've felt throughout the year",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: TColors.black, // Adjust the color to fit your theme
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            TableCalendar(
              availableGestures: AvailableGestures.none,
              firstDay: DateTime.utc(2010, 10, 16),
              lastDay: DateTime.utc(2030, 3, 14),
              focusedDay: DateTime.now(),
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                titleTextStyle: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).primaryColor,
                ),
                formatButtonVisible: false,
                titleCentered: true,
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwItems/2),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 64.0),
              child: Text(
                midSection,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: TColors.primary, // Adjust the color to fit your theme
                      fontWeight: FontWeight.bold,
                    ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 64.0),
              child: Column(
                children: emotions.map((emotion) {
                  return Card(
                    elevation: 2,
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        emotion,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: TColors.primary,
                        ),
                      ),
                      subtitle: Text(
                        topReasons[emotion]?.join(', ') ?? '',
                        style: TextStyle(
                          color: TColors.black, // Adjust the color to fit your theme
                        ),
                      ),
                      trailing: Icon(Icons.chevron_right, color: TColors.black),
                      onTap: () {
                        // Handle the tap, maybe expand to show more details or navigate
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections * 5,),
          ],
        ),
      ),
    );
  }
}
