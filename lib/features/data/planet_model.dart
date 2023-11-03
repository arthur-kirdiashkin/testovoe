import 'package:flutter/material.dart';

class PlanetModel {
  final double radius;
  final Color color;
  final double orbitVelocities;
  final double remoteness;

  PlanetModel(
      {required this.radius,
      required this.color,
      required this.orbitVelocities,
      required this.remoteness});
}
