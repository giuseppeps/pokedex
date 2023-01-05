class PokemonDetails {
  String? sprites;
  num height;
  num weight;
  List<String>? types;
  List<String>? abilities;

  PokemonDetails(
      this.sprites, this.height, this.weight, this.types, this.abilities);

  factory PokemonDetails.fromJson(Map<String, dynamic> json) {
    var sprites = json['sprites']['front_default'] as String;
    var height = json['height'] as num;
    var weight = json['weight'] as num;
    List<String>? types;
    types = (json['types'] as List)
        .map((f) => f['type']['name'])
        .toList()
        .cast<String>();
    List<String>? abilities = (json['abilities'] as List)
        .map((f) => f['ability']['name'])
        .toList()
        .cast<String>();
    return PokemonDetails(sprites, height, weight, types, abilities);
  }
}
