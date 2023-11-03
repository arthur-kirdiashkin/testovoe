import 'package:testovoe/features/data/planet_model.dart';

abstract class PlanetState {}


class PlanetInitialState extends PlanetState {}

class LoadedPlanetState extends PlanetState {
  final PlanetModel planetModel;

   LoadedPlanetState({required this.planetModel});
}


