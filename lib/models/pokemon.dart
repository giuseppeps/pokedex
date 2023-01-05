import 'package:pokedex/models/pokemon_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Pokemon {
  final String name;
  final String url;
  PokemonDetails? details;

  Pokemon(this.name, this.url);

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    var pokemon = Pokemon(json['name'], json['url']);
    pokemon.getDetails();
    return pokemon;
  }

  Future<void> getDetails() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      details = PokemonDetails.fromJson(data);
    }
  }
}
