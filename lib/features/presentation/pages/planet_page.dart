import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/data/planet_model.dart';
import 'package:testovoe/features/presentation/pages/parameters_page.dart';
import 'package:testovoe/features/presentation/widgets/planet_widget.dart';
import '../bloc/planet_bloc.dart';
import '../bloc/planet_state.dart';
import '../widgets/stars_widget.dart';

class PlanetPage extends StatelessWidget {
  PlanetPage({super.key});
  final List<PlanetModel> _planets = [
    PlanetModel(
      radius: 45,
      color: Colors.yellow,
      orbitVelocities: 0.001,
      remoteness: 0,
    ),
    PlanetModel(
      radius: 10,
      color: Colors.green,
      orbitVelocities: 10,
      remoteness: 100,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ParametersPage()),
                    );
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
          ],
          centerTitle: true,
          title: const Text(
            'Planet System',
          ),
        ),
        body: BlocConsumer<PlanetBloc, PlanetState>(
          listener: (context, state) {
            if (state is LoadedPlanetState) {
              _planets.add(state.planetModel);
            }
          },
          builder: (context, state) {
            if (state is PlanetInitialState) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.black,
                  ),
                  const StarsWidget(),
                  getPlanetWidgets(_planets),
                ],
              );
            }

            if (state is LoadedPlanetState) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    color: Colors.black,
                  ),
                  const StarsWidget(),
                  getPlanetWidgets(_planets),
                ],
              );
            }
            return const SizedBox.shrink();
          },
        ));
  }
}

Widget getPlanetWidgets(List<PlanetModel> planetModels) {
  List<PlanetWidget> planetList = [];
  for (var i = 0; i < planetModels.length; i++) {
    planetList.add(PlanetWidget(planetModel: planetModels[i]));
  }
  return Stack(
    children: planetList,
  );
}
