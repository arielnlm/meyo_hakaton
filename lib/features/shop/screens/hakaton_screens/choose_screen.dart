import 'package:flutter/material.dart';
import 'package:meyo_impact/common/widgets/appbar/appbar.dart';
import 'package:meyo_impact/utils/constants/colors.dart';

class ChooseWidget extends StatefulWidget {
  @override
  _ChooseWidgetState createState() => _ChooseWidgetState();
}

class _ChooseWidgetState extends State<ChooseWidget> {
  double buttonPosition = 0.0;
  double redWidthPercentage = 0.5;
  double blueWidthPercentage = 0.5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Path', style: Theme.of(context).textTheme.headlineSmall),
      ),
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: (redWidthPercentage * 100).toInt(),
                child: Container(
                  color: TColors.error,
                  child: Center(
                    child: Text(
                      'MENTAL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: (blueWidthPercentage * 100).toInt(),
                child: Container(
                  color: TColors.primary,
                  child: Center(
                    child: Text(
                      'PHYSICAL',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            left: MediaQuery.of(context).size.width / 2 - 50.0,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  buttonPosition += details.primaryDelta!;
                  buttonPosition = buttonPosition.clamp(
                      -MediaQuery.of(context).size.width / 2,
                      MediaQuery.of(context).size.width / 2);
      
                  if (buttonPosition < 0) {
                    // Move to the right, expand blue and shrink red
                    redWidthPercentage = (MediaQuery.of(context).size.width - buttonPosition) /
                        MediaQuery.of(context).size.width;
                    blueWidthPercentage = 1 - redWidthPercentage;
                  } else {
                    // Move to the left, expand red and shrink blue
                    blueWidthPercentage = (MediaQuery.of(context).size.width + buttonPosition) /
                        MediaQuery.of(context).size.width;
                    redWidthPercentage = 1 - blueWidthPercentage;
                  }
                });
              },
              onHorizontalDragEnd: (details) {
                // Reset button position and section widths
                setState(() {
                  buttonPosition = 0.0;
                  redWidthPercentage = 0.5;
                  blueWidthPercentage = 0.5;
                });
              },
              child: Transform.translate(
                offset: Offset(buttonPosition, 0.0),
                child: Container(
                  child: ElevatedButton(
                    onPressed: () {
                      // Your button action here
                    },
                    child: Text('Button'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}