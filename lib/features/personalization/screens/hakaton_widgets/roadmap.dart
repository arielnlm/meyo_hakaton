import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:meyo_impact/utils/constants/sizes.dart';

class WeeklyRoadmap extends StatelessWidget {
  final List<double> completionRates; // Values between 0.0 (not started) to 1.0 (completed)
  final List<String> taskNames; // Names of the tasks for each day

  WeeklyRoadmap({
    Key? key,
    required this.completionRates,
    required this.taskNames,
  })  : assert(completionRates.length == 7 && taskNames.length == 7),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your weekly progress',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        Stack(
          alignment: Alignment.centerRight,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: CustomPaint(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: List.generate(7, (index) {
                    bool isUp = index % 2 == 0;
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: isUp ? 20.0 : 0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (!isUp) ...[
                            Text(taskNames[index]),
                            SizedBox(height: 8),
                          ],
                          CustomPaint(
                            painter: _CircleProgressPainter(rate: completionRates[index]),
                            child: SizedBox(width: 30, height: 30),
                          ),
                          if (isUp) ...[
                            SizedBox(height: 8),
                            Text(taskNames[index]),
                          ],
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(Icons.arrow_forward_ios, color: Colors.grey), // Right arrow icon
            ),
          ],
        ),
      ],
    );
  }
}

class _CircleProgressPainter extends CustomPainter {
  final double rate;

  _CircleProgressPainter({required this.rate});

  @override
  void paint(Canvas canvas, Size size) {
    final backgroundPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5;

    // Draw the background circle
    canvas.drawCircle(size.center(Offset.zero), size.width / 2, backgroundPaint);

    final foregroundPaint = Paint()
      ..shader = LinearGradient(colors: [Colors.green, Colors.green.shade800])
                .createShader(Rect.fromCircle(center: size.center(Offset.zero), radius: size.width / 2))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    // Draw the progress arc
    canvas.drawArc(Rect.fromLTWH(0, 0, size.width, size.height), -math.pi / 2, 2 * math.pi * rate, false, foregroundPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
