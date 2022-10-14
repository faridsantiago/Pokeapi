import 'package:flutter/material.dart';
import '../Widgets/pagePoke.dart';

import '../Models/Model_Pokemons.dart';
import '../Provider/Poke_Provider.dart';

class PageViewPoke extends StatefulWidget {
  const PageViewPoke({Key? key}) : super(key: key);

  @override
  State<PageViewPoke> createState() => _PageViewPokeState();
}

class _PageViewPokeState extends State<PageViewPoke> {
  late Future<List<ModelPokes>> _listadoGifs;
  int offset = 0;

  @override
  void initState() {
    super.initState();
    _listadoGifs = PokeProvider().getPokes(offset);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<ModelPokes>>(
      future: _listadoGifs,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PageView(
            padEnds: false,
            controller: PageController(viewportFraction: 1 / 2, initialPage: 0),
            children: ListPokemons(snapshot.data!),
            onPageChanged: (value) async {
              if (value == snapshot.data!.length - 7) {
                final getprovider = PokeProvider();
                offset = offset + 10;
                getprovider.getPokes(offset).then((value) {
                  setState(() {
                    _listadoGifs.then((gifs) => gifs.addAll(value));
                  });
                });
              }
            },
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
