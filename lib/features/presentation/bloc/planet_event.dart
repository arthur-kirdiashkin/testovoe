import 'package:flutter/material.dart';

abstract class PlanetEvent {}

class AddPlanetEvent extends PlanetEvent {
  final double radius;
  final Color color;
  final double orbitVelocities;
  final double remoteness;

  AddPlanetEvent(
      {required this.radius,
      required this.color,
      required this.orbitVelocities,
      required this.remoteness});
}

class SelectColorEvent extends PlanetEvent {
  final Color selectedColor;

  SelectColorEvent({required this.selectedColor});
}
