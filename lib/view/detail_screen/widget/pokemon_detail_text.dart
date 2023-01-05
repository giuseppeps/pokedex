import 'package:flutter/material.dart';
import 'package:pokedex/theme/texts.dart';

class PokemonDetailText extends StatelessWidget {
  final String label;
  final String value;

  const PokemonDetailText(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$label:  ",
              style: labelText,
            ),
            TextSpan(
              text: value,
              style: valueText,
            ),
          ],
        ),
      ),
    );
  }
}
