import 'package:flutter_dex/data/poke_api/version.dart';
import 'package:http/http.dart';

import '../ability.dart';
import '../encounters.dart';
import '../item.dart';
import '../move.dart';
import '../pokemon.dart' as pk;
import '../species.dart';
import '../stat.dart';
import '../type.dart';

class PokeAPI {
  final urlBase = 'https://pokeapi.co/api/v2/';
  String limit = '?limit=1000';

  Future getPokemon({bool all = false, int id = 0, String pokemon}) async {
    String url;

    if (all) {
      url = urlBase + 'pokemon/' + limit;
    } else {
      url = urlBase + 'pokemon/' + ((id > 0) ? id.toString() : pokemon);
    }

    var response =
        await get(url, headers: {"Content-Type": "application/json"});
    return (all)
        ? pk.pokeListFromJson(response.body)
        : pk.pokemonFromJson(response.body);
  }

  Future<Move> getMoveInfo({int id = 0, String move, String urlCall}) async {
    String url = (urlCall.isNotEmpty)
        ? urlCall
        : urlBase + 'move/' + ((id > 0) ? id.toString() : move);
    var response = await get(url);
    return moveFromJson(response.body);
  }

  Future<Ability> getAbilityInfo(
      {int id = 0, String ability, String urlCall}) async {
    String url = (urlCall.isNotEmpty)
        ? urlCall
        : urlBase +
            'ability/' +
            ((id > 0) ? id.toString() : ability.toLowerCase());
    var response = await get(url);
    return abilityFromJson(response.body);
  }

  Future<Item> getItemInfo({int id = 0, String item, String urlCall}) async {
    String url = (urlCall.isNotEmpty)
        ? urlCall
        : urlBase + 'item/' + ((id > 0) ? id.toString() : item.toLowerCase());
    var response = await get(url);
    return itemFromJson(response.body);
  }

  Future<Stat> getStatInfo({int id = 0, String stat, String urlCall}) async {
    String url = (urlCall.isNotEmpty)
        ? urlCall
        : urlBase + 'stat/' + ((id > 0) ? id.toString() : stat.toLowerCase());
    var response = await get(url);
    return statFromJson(response.body);
  }

  Future<List<Encounters>> getEncounters(
      {int id = 0, String pokemon, String urlCall}) async {
    String url = (urlCall.isNotEmpty)
        ? urlCall
        : urlBase +
            'pokemon/' +
            ((id > 0) ? id.toString() : pokemon.toLowerCase()) +
            '/encounters';
    var response = await get(url);
    return encountersFromJson(response.body);
  }

  Future<Type> getTypeInfo({int id = 0, String type, String urlCall}) async {
    String url = (urlCall.isNotEmpty)
        ? urlCall
        : urlBase + 'type/' + ((id > 0) ? id.toString() : type.toLowerCase());
    var response = await get(url);
    return typeFromJson(response.body);
  }

  Future<Species> getSpeciesInfo(
      {int id = 0, String pokemon, String urlCall}) async {
    String url = (urlCall.isNotEmpty)
        ? urlCall
        : urlBase +
            'pokemon-species/' +
            ((id > 0) ? id.toString() : pokemon.toLowerCase());
    var response = await get(url);
    return speciesFromJson(response.body);
  }

  Future<Version> getVersionInfo(
      {int id = 0, String version, String urlCall}) async {
    String url = (urlCall.isNotEmpty)
        ? urlCall
        : urlBase +
            'version-group' +
            ((id > 0) ? id.toString() : version.toLowerCase());
    var response = await get(url);
    return versionFromJson(response.body);
  }
}
