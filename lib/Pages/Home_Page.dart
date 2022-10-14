import 'package:flutter/material.dart';
import '../Widgets/SwiperPokemon.dart';
import '../Widgets/PageViewPokemon.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  late PageController _scrollController;
  int offset = 0;


  @override
  void initState() {
    super.initState();
    _scrollController = PageController();
    _scrollController.addListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        children: const [
          Expanded(
            flex: 1,
            child: PageViewPoke(),
          ),
          Expanded(
              flex: 2,
              child: SwipperPoke())
        ],
      ),
    );
  }
}
