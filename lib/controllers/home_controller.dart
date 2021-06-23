import 'package:pokedex_m/core/app_errors.dart';
import 'package:pokedex_m/models/pokemon_model.dart';
import 'package:pokedex_m/repositories/poke_repository.dart';

class HomeController {
  final PokeRepository _repository;

  HomeController(this._repository);

  List<PokemonModel> pokemons = <PokemonModel>[];

  int get length => pokemons.length;

  Failure failure;

  int _offset = 0;

  int limit = 20;

  Future<void> fetch() async {
    failure = null;
    final result = await _repository.fetch(offset: _offset, limit: limit);
    result.fold((l) => failure = l, (r) => pokemons.addAll(r));
  }

  Future<void> next() async {
    _offset += limit;
    await fetch();
  }
}
