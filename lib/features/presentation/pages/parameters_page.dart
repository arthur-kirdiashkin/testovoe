import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/presentation/bloc/planet_bloc.dart';
import 'package:testovoe/features/presentation/bloc/planet_event.dart';

class ParametersPage extends StatefulWidget {
  const ParametersPage({super.key});

  @override
  State<ParametersPage> createState() => _ParametersPageState();
}

class _ParametersPageState extends State<ParametersPage> {
  final _radiusFormKey = GlobalKey<FormState>();
  final _orbitVelocitiesFormKey = GlobalKey<FormState>();
  final _remotenessFormKey = GlobalKey<FormState>();
  int selectedColor = 0;
  Color color = Colors.brown;
  final TextEditingController _radiusController = TextEditingController();
  final TextEditingController _orbitVelocitiesController =
      TextEditingController();
  final TextEditingController _remotenessController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final PlanetBloc planetBloc = context.read<PlanetBloc>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Parameters Page'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromRGBO(121, 85, 72, 1),
                          shape: const CircleBorder()),
                      onPressed: () {
                        planetBloc.add(
                          SelectColorEvent(
                            selectedColor: Colors.brown,
                          ),
                        );
                        setState(() {
                          selectedColor = 0;
                        });
                      },
                      child: selectedColor == 0
                          ? const Icon(Icons.check_outlined)
                          : const SizedBox()),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple,
                          shape: const CircleBorder()),
                      onPressed: () {
                        planetBloc.add(
                          SelectColorEvent(
                            selectedColor: Colors.purple,
                          ),
                        );
                        setState(() {
                          selectedColor = 1;
                        });
                      },
                      child: selectedColor == 1
                          ? const Icon(Icons.check_outlined)
                          : const SizedBox()),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: const CircleBorder()),
                      onPressed: () {
                        planetBloc.add(
                          SelectColorEvent(
                            selectedColor: Colors.blue,
                          ),
                        );
                        setState(() {
                          selectedColor = 2;
                        });
                      },
                      child: selectedColor == 2
                          ? const Icon(Icons.check_outlined)
                          : const SizedBox()),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey,
                          shape: const CircleBorder()),
                      onPressed: () {
                        planetBloc.add(
                          SelectColorEvent(
                            selectedColor: Colors.grey,
                          ),
                        );
                        setState(() {
                          selectedColor = 3;
                        });
                      },
                      child: selectedColor == 3
                          ? const Icon(Icons.check_outlined)
                          : const SizedBox())
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _radiusFormKey,
                  child: TextFormField(
                    validator: validateRadius,
                    keyboardType: TextInputType.number,
                    controller: _radiusController,
                    decoration: InputDecoration(
                      labelText: 'RadiusPlanet',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12.5),
                      isCollapsed: true,
                      fillColor: const Color.fromRGBO(242, 242, 242, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 358,
                            color: Color.fromRGBO(242, 242, 242, 1),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      focusColor: Colors.grey,
                      hoverColor: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _remotenessFormKey,
                  child: TextFormField(
                    validator: validateRemoteness,
                    keyboardType: TextInputType.number,
                    controller: _remotenessController,
                    decoration: InputDecoration(
                      labelText: 'Remoteness',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12.5),
                      isCollapsed: true,
                      fillColor: const Color.fromRGBO(242, 242, 242, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 358,
                            color: Color.fromRGBO(242, 242, 242, 1),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      focusColor: Colors.grey,
                      hoverColor: Colors.grey,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Form(
                  key: _orbitVelocitiesFormKey,
                  child: TextFormField(
                    validator: validateOrbitVelocities,
                    keyboardType: TextInputType.number,
                    controller: _orbitVelocitiesController,
                    decoration: InputDecoration(
                      labelText: 'OrbitVelocities',
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 12.5),
                      isCollapsed: true,
                      fillColor: const Color.fromRGBO(242, 242, 242, 1),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            width: 358,
                            color: Color.fromRGBO(242, 242, 242, 1),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      focusColor: Colors.grey,
                      hoverColor: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                if (_radiusFormKey.currentState!.validate() &&
                    _orbitVelocitiesFormKey.currentState!.validate() &&
                    _remotenessFormKey.currentState!.validate()) {
                  planetBloc.add(
                    AddPlanetEvent(
                      radius: double.parse(_radiusController.text),
                      color: Colors.red,
                      orbitVelocities:
                          double.parse(_orbitVelocitiesController.text),
                      remoteness: double.parse(_remotenessController.text),
                    ),
                  );
                  Navigator.pop(context);
                }
              },
              child: const Text('Add planet'))
        ],
      ),
    );
  }
}

String? validateRadius(String? value) {
  if (value!.isEmpty || value == '') {
    return 'Enter valid radius';
  } else if (double.parse(value) > 45) {
    return 'The planet can not be bigger than the sun';
  } else {
    return null;
  }
}

String? validateRemoteness(String? value) {
  if (value!.isEmpty || value == '') {
    return 'Enter valid remoteness';
  } else if (double.parse(value) > 175) {
    return 'The planet can not bee too far from the sun';
  } else {
    return null;
  }
}

String? validateOrbitVelocities(String? value) {
  if (value!.isEmpty || value == '') {
    return 'Enter valid orbitVelocities';
  } else {
    return null;
  }
}
