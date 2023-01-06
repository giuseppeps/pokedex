import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/controller/bloc/pokemon_bloc.dart';
import 'package:pokedex/view/list_screen/pokemon_list_screen.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => PokemonBloc(),
      child: const MaterialApp(
        home: PokemonListScreen(),
      ),
    ),
  );
}
