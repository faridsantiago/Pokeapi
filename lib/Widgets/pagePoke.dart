import 'Package:flutter/material.dart';
import '../Models/Model_Pokemons.dart';

Widget cartaPoke(String texto, String img, List types) {
  return Container(
    constraints: const BoxConstraints.expand(),
    margin: const EdgeInsets.only(left: 10, bottom: 10),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10)),
      elevation: 5,
      child: Column(
        children: [
          Expanded(
              flex: 5,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10)),
                  image: DecorationImage(
                    image: Image.network(
                      img,
                      loadingBuilder: (context, child, loadingProgress) =>
                          loadingProgress == null
                              ? child
                              : const Center(
                                  child: CircularProgressIndicator()),
                    ).image,
                    fit: BoxFit.contain,
                  ),
                ),
              )),
          Expanded(
            flex: 3,
            child: Stack(
              children: [
                Row(children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                        decoration:
                            BoxDecoration(color: Color.fromARGB(255, 255, 255, 255),borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10)))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        decoration:
                            BoxDecoration(color: Color.fromARGB(255,255,255,255),borderRadius: const BorderRadius.only(bottomRight: Radius.circular(10)))),
                  )
                ]),
                Center(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(50)),
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, bottom: 1),
                      child: Text(
                        texto[0].toUpperCase() + texto.substring(1),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

List<Widget> ListPokemons(List<ModelPokes> listado) {
  final List<Widget> pokemons = [];
  for (var element in listado) {
    pokemons.add(
      GestureDetector(
        child: cartaPoke(element.name, element.img, element.types),
        onTap: () {
          print(element.name);
        },
      ),
    );
  }

  return pokemons;
}