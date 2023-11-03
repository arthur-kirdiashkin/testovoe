import 'package:flutter/material.dart';
import 'dart:math' as math;
class StarsWidget extends StatelessWidget {
  final int numberStars = 60;

  const StarsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: getStars(context),
      ),
    );
  }

  List<Widget> getStars(BuildContext context) {
    final List<Widget> stars = [];

    for (int i = 0; i < numberStars; ++i) {
      final xy = getRandomXY(context);
      final widget = Transform.translate(
        offset: Offset(xy[0], xy[1]),
        child: Container(
          width: 2.5,
          height: 2.5,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
        ),
      );

      stars.add(widget);
    }

    return stars;
  }

  List<double> getRandomXY(BuildContext context) {
    final size = MediaQuery.of(context).size;
    double x = size.width * (math.Random().nextDouble() - 1 / 2);
    double y = size.height * (math.Random().nextDouble() - 1 / 2);

    return [x, y];
  }
}