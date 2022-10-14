import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Model_Pokemons.dart';

class PokeProvider {
  Future<List<ModelPokes>> getPokes(int offset) async {
    List listaNueva = [];
    String Url = "https://pokeapi.co/api/v2/pokemon/?limit=10&offset=$offset";
    final response = await http.get(Uri.parse(Url));

    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final json = jsonDecode(body);
      for (var item in json["results"]) {
        var pokemon = await getPokeDetail(item["url"]);
        listaNueva.add(pokemon);
      }
      final final2 = Poke.fromJsonList(listaNueva);
      return final2.items;

    } else {
      throw Exception("failed to load");
    }
  }

  getPokeDetail(String url) async {
    String Url = url;
    final response = await http.get(Uri.parse(Url));
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      final json = jsonDecode(body);
      return json;
    } else {
      throw Exception("Failed to load");
    }
}
}