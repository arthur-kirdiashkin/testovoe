import 'package:flutter/widgets.dart';
import 'package:testovoe/features/data/planet_model.dart';

class PlanetWidget extends StatefulWidget {
  final PlanetModel planetModel;
  const PlanetWidget({super.key, required this.planetModel});

  @override
  State<PlanetWidget> createState() => _PlanetWidgetState();
}

class _PlanetWidgetState extends State<PlanetWidget>
    with SingleTickerProviderStateMixin {


  late AnimationController _controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: (2000 * widget.planetModel.orbitVelocities).toInt()),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    _controller.addListener(() {});

    _controller.repeat();
  }


   

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, widget.planetModel.remoteness),
            child: Container(
              width: widget.planetModel.radius,
              height: widget.planetModel.radius,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: widget.planetModel.color),
            ),
          );
        },
      ),
    );
  }
}
