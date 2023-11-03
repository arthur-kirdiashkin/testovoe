import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/data/planet_model.dart';
import 'package:testovoe/features/presentation/bloc/planet_event.dart';
import 'package:testovoe/features/presentation/bloc/planet_state.dart';

class PlanetBloc extends Bloc<PlanetEvent, PlanetState> {
  var selectedColor = const Color.fromRGBO(121, 85, 72, 1);
  PlanetBloc() : super(PlanetInitialState()) {
    on<AddPlanetEvent>(_onAddPlanetEvent);
    on<SelectColorEvent>(_onSelectColorEvent);
  }

  _onAddPlanetEvent(AddPlanetEvent event, emit) {
    final planetModel = PlanetModel(
      radius: event.radius,
      color: selectedColor,
      orbitVelocities: event.orbitVelocities,
      remoteness: event.remoteness,
    );
    emit(LoadedPlanetState(planetModel: planetModel));
  }

  _onSelectColorEvent(SelectColorEvent event, emit) {
    selectedColor = event.selectedColor;
  }
}
