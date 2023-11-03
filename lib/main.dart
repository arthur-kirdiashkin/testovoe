import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/presentation/bloc/planet_bloc.dart';
import 'features/presentation/pages/planet_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanetBloc(),
      child: MaterialApp(
        home: PlanetPage(),
      ),
    );
  }
}
