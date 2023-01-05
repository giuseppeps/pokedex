import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  final int pageSize = 15;
  int currentPage = 0;
  List<Pokemon> pokemon = [];

  PokemonBloc() : super(PokemonState.initial) {
    on<FetchPokemonEvent>((event, emit) async {
      if (state == PokemonState.loading) {
        return;
      }
      pokemon.clear();
      emit(PokemonState.loading);

      var response = await http.get(Uri.parse(
          'https://pokeapi.co/api/v2/pokemon?offset=${event.offset}&limit=$pageSize'));

      if (response.statusCode == 200) {
        var data = json.decode(response.body)['results'] as List;
        var newPokemon = data.map((p) => Pokemon.fromJson(p)).toList();

        await Future.wait(newPokemon.map((p) => p.getDetails()));

        pokemon.addAll(newPokemon);

        currentPage = event.offset;

        emit(PokemonState.loaded);
      }
    });
  }
}
