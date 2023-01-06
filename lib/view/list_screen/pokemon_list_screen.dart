import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/components/pokedex_appbar.dart';
import 'package:pokedex/controller/bloc/pokemon_bloc.dart';
import 'package:pokedex/view/list_screen/pokemon_grid_view.dart';

class PokemonListScreen extends StatefulWidget {
  const PokemonListScreen({super.key});

  @override
  PokemonListScreenState createState() => PokemonListScreenState();
}

class PokemonListScreenState extends State<PokemonListScreen> {
  @override
  void initState() {
    BlocProvider.of<PokemonBloc>(context).add(FetchPokemonEvent(0));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PokedexAppBar(title: 'Pokédex'),
      body: PokemonGridView(),
    );
  }
}
