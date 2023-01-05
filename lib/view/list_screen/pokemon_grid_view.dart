import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/controller/bloc/pokemon_bloc.dart';
import 'package:pokedex/view/list_screen/widget/pokemon_card.dart';

class PokemonGridView extends StatelessWidget {
  const PokemonGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        if (state == PokemonState.initial) {
          // Disparar o evento de busca de Pokémon quando o aplicativo for iniciado
          BlocProvider.of<PokemonBloc>(context).add(FetchPokemonEvent(0));
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state == PokemonState.loaded) {
          var bloc = BlocProvider.of<PokemonBloc>(context);
          return Column(
            children: [
              Expanded(
                flex: 10,
                child: GridView(
                  padding: const EdgeInsets.all(8.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 5, mainAxisSpacing: 8),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: List.generate(bloc.pokemon.length, (index) {
                    return PokemonCard(bloc.pokemon[index]);
                  }).toList(),
                ),
              ),
              const Divider(color: Colors.black26, thickness: 3),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      IconButton(
                          onPressed: bloc.currentPage > 0
                              ? () {
                                  // Disparar o evento de busca de Pokémon quando o botão for pressionado
                                  bloc.add(FetchPokemonEvent(
                                      bloc.currentPage - bloc.pageSize));
                                }
                              : null,
                          icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                      Text("Página ${(bloc.currentPage / 15 + 1).round()}"),
                      IconButton(
                          onPressed: () {
                            // Disparar o evento de busca de Pokémon quando o botão for pressionado
                            bloc.add(FetchPokemonEvent(
                                bloc.currentPage + bloc.pageSize));
                          },
                          icon: const Icon(Icons.arrow_forward_ios_rounded)),
                    ],
                  ),
                ),
              ),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
