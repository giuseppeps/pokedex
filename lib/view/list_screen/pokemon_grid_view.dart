import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/controller/bloc/pokemon_bloc.dart';
import 'package:pokedex/view/list_screen/widget/pokemon_card.dart';
import 'package:pokedex/view/list_screen/widget/pokemon_card_skeleton.dart';
import 'package:pokedex/view/list_screen/widget/skeleton.dart';

class PokemonGridView extends StatelessWidget {
  const PokemonGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        var bloc = BlocProvider.of<PokemonBloc>(context);
        return Column(
          children: [
            Expanded(
              flex: 10,
              child: LayoutBuilder(builder: (context, constraints) {
                return GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        // 16 é o espaçamento total entre as linhas
                        mainAxisExtent: (constraints.maxHeight - 16) / 5),
                    shrinkWrap: true,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      if (state == PokemonState.loaded) {
                        return PokemonCard(bloc.pokemon[index]);
                      } else {
                        return const PokemonCardSkeleton();
                      }
                    });
              }),
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
                                bloc.add(FetchPokemonEvent(
                                    bloc.currentPage - bloc.pageSize));
                              }
                            : null,
                        icon: const Icon(Icons.arrow_back_ios_new_rounded)),
                    state == PokemonState.loaded
                        ? Text("Página ${(bloc.currentPage / 15 + 1).round()}")
                        : const Skeleton(
                            height: 20,
                            width: 80,
                          ),
                    IconButton(
                        onPressed: () {
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
      },
    );
  }
}
