import 'package:flutter/material.dart';
import 'package:pokedex/view/list_screen/widget/skeleton.dart';

class PokemonCardSkeleton extends StatelessWidget {
  const PokemonCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: const Skeleton(),
    );
  }
}
