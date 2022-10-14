import '../Provider/Poke_Provider.dart';

PokeProvider pokeProvider = PokeProvider();

class Poke {
  List<ModelPokes> items = [];

  Poke();

  Poke.fromJsonList(jsonList) {
    
    for (var item in jsonList) {
      final pokemon = ModelPokes.fromJsonMap(item);
      print(pokemon != null);
      items.add(pokemon);
    }
  }
}

class ModelPokes {
  String name;
  List types;
  String img;

  ModelPokes({required this.name, required this.types, required this.img});

  factory ModelPokes.fromJsonMap(Map<String, dynamic> json) {
    return ModelPokes(
      name: json["name"],
      types: json["types"],
      img: json["sprites"]["other"]["official-artwork"]["front_default"],
    
    );
  }
}

