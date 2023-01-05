import 'package:flutter/material.dart';
import 'package:pokedex/components/pokedex_appbar.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/theme/texts.dart';
import 'package:pokedex/view/detail_screen/widget/pokemon_detail_text.dart';

class PokemonDetailScreen extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonDetailScreen(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PokedexAppBar(title: pokemon.name),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Center(
              child: Image.network(
                pokemon.details?.sprites ?? "",
                scale: 0.5,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: Text(
                      pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                      style: nameTitleText,
                    ),
                  ),
                  PokemonDetailText(
                    label: 'Altura',
                    value: "${pokemon.details?.height}",
                  ),
                  PokemonDetailText(
                    label: 'Peso',
                    value: "${pokemon.details?.weight}",
                  ),
                  PokemonDetailText(
                    label: 'Características',
                    value: "${pokemon.details?.types?.join(', ')}",
                  ),
                  PokemonDetailText(
                    label: 'Habilidades',
                    value: "${pokemon.details?.abilities?.join(', ')}",
                  ),
                ],
              ),
            ),
          ),
          const Divider(color: Colors.black26, thickness: 3),
          Flexible(
            child: Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  'Voltar',
                  style: pageText,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
