import 'package:flutter/material.dart';
import 'package:pokedex/models/pokemon.dart';
import 'package:pokedex/theme/texts.dart';
import 'package:pokedex/view/detail_screen/pokemon_detail_screen.dart';

class PokemonCard extends StatelessWidget {
  final Pokemon pokemon;

  const PokemonCard(this.pokemon, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      color: Colors.white54,
      child: InkWell(
        splashColor: Colors.red,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PokemonDetailScreen(pokemon),
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Image.network(
                pokemon.details?.sprites ?? "",
              ),
            ),
            Expanded(
              child: Text(
                pokemon.name[0].toUpperCase() + pokemon.name.substring(1),
                style: nameText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
