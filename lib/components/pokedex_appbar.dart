import 'package:flutter/material.dart';

import 'package:pokedex/theme/texts.dart';

class PokedexAppBar extends PreferredSize {
  final String title;

  const PokedexAppBar({
    super.key,
    required this.title,
    Size size = Size.zero,
    super.child = const SizedBox(),
  }) : super(preferredSize: size);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.red,
      title: Text(
        title[0].toUpperCase() + title.substring(1),
        style: nameTitleText.copyWith(color: Colors.white),
      ),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }
}
