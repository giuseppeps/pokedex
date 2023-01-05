part of 'pokemon_bloc.dart';

abstract class PokemonEvent {}

class FetchPokemonEvent extends PokemonEvent {
  final int offset;

  FetchPokemonEvent(this.offset);
}
