import 'package:flutter/material.dart';
import 'package:infinite_widgets/infinite_widgets.dart';
import 'package:pokedex_m/controllers/home_controller.dart';
import 'package:pokedex_m/core/app_const.dart';
import 'package:pokedex_m/pages/detail_page.dart';
import 'package:pokedex_m/repositories/poke_repository_impl.dart';
import 'package:pokedex_m/widgets/poke_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = HomeController(PokeRepositoryImpl());
  @override
  void initState() {
    _initialize();
    super.initState();
  }

  Future<void> _initialize() async {
    await _controller.fetch();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mAppTitle, style: TextStyle(color: Colors.black)),
        centerTitle: true, 
        backgroundColor: Colors.red,
      ),
      body: InfiniteGridView(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: _buildCard,
        itemCount: _controller.length,
        hasNext: _controller.length < 1118,
        nextData: _onNext,
      ),
    );
  }

  Future<void> _onNext() async {
    await _controller.next();
    setState(() {});
  }

  Widget _buildCard(BuildContext context, int index) {
    final pokemon = _controller.pokemons[index];
    return PokemonCard(
      pokemon: pokemon,
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => DetailPage(
              pokemon: pokemon,
            ),
          ),
        );
      },
    );
  }
}
