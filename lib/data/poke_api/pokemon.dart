// To parse this JSON data, do
//
//     final Pokemon = PokemonFromJson(jsonString);

import 'dart:convert';

import 'package:flutter_dex/data/poke_api/ability.dart' as ability;
import 'package:flutter_dex/data/poke_api/move.dart' as move;
import 'package:flutter_dex/data/poke_api/apiwrapper/poke_api.dart';

Pokemon pokemonFromJson(String str) => Pokemon.fromJson(json.decode(str));

String pokemonToJson(Pokemon data) => json.encode(data.toJson());

class Pokemon {
  List<Ability> abilities;
  int baseExperience;
  List<Species> forms;
  List<GameIndex> gameIndices;
  int height;
  List<HeldItem> heldItems;
  int id;
  bool isDefault;
  String locationAreaEncounters;
  List<Move> moves;
  String name;
  int order;
  Species species;
  Sprites sprites;
  List<Stat> stats;
  List<Type> types;
  int weight;

  Pokemon({
    this.abilities,
    this.baseExperience,
    this.forms,
    this.gameIndices,
    this.height,
    this.heldItems,
    this.id,
    this.isDefault,
    this.locationAreaEncounters,
    this.moves,
    this.name,
    this.order,
    this.species,
    this.sprites,
    this.stats,
    this.types,
    this.weight,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        abilities: json["abilities"] == null
            ? null
            : List<Ability>.from(
                json["abilities"].map((x) => Ability.fromJson(x))),
        baseExperience:
            json["base_experience"] == null ? null : json["base_experience"],
        forms: json["forms"] == null
            ? null
            : List<Species>.from(json["forms"].map((x) => Species.fromJson(x))),
        gameIndices: json["game_indices"] == null
            ? null
            : List<GameIndex>.from(
                json["game_indices"].map((x) => GameIndex.fromJson(x))),
        height: json["height"] == null ? null : json["height"],
        heldItems: json["held_items"] == null
            ? null
            : List<HeldItem>.from(
                json["held_items"].map((x) => HeldItem.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
        isDefault: json["is_default"] == null ? null : json["is_default"],
        locationAreaEncounters: json["location_area_encounters"] == null
            ? null
            : json["location_area_encounters"],
        moves: json["moves"] == null
            ? null
            : List<Move>.from(json["moves"].map((x) => Move.fromJson(x))),
        name: json["name"] == null ? null : json["name"],
        order: json["order"] == null ? null : json["order"],
        species:
            json["species"] == null ? null : Species.fromJson(json["species"]),
        sprites:
            json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
        stats: json["stats"] == null
            ? null
            : List<Stat>.from(json["stats"].map((x) => Stat.fromJson(x))),
        types: json["types"] == null
            ? null
            : List<Type>.from(json["types"].map((x) => Type.fromJson(x))),
        weight: json["weight"] == null ? null : json["weight"],
      );

  Map<String, dynamic> toJson() => {
        "abilities": abilities == null
            ? null
            : List<dynamic>.from(abilities.map((x) => x.toJson())),
        "base_experience": baseExperience == null ? null : baseExperience,
        "forms": forms == null
            ? null
            : List<dynamic>.from(forms.map((x) => x.toJson())),
        "game_indices": gameIndices == null
            ? null
            : List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "height": height == null ? null : height,
        "held_items": heldItems == null
            ? null
            : List<dynamic>.from(heldItems.map((x) => x.toJson())),
        "id": id == null ? null : id,
        "is_default": isDefault == null ? null : isDefault,
        "location_area_encounters":
            locationAreaEncounters == null ? null : locationAreaEncounters,
        "moves": moves == null
            ? null
            : List<dynamic>.from(moves.map((x) => x.toJson())),
        "name": name == null ? null : name,
        "order": order == null ? null : order,
        "species": species == null ? null : species.toJson(),
        "sprites": sprites == null ? null : sprites.toJson(),
        "stats": stats == null
            ? null
            : List<dynamic>.from(stats.map((x) => x.toJson())),
        "types": types == null
            ? null
            : List<dynamic>.from(types.map((x) => x.toJson())),
        "weight": weight == null ? null : weight,
      };
}

class Ability {
  Species ability;
  bool isHidden;
  int slot;

  Ability({
    this.ability,
    this.isHidden,
    this.slot,
  });

  Future<ability.Ability> get abilityInfo async =>
      await PokeAPI().getAbilityInfo(ability: ability?.name);

  factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        ability:
            json["ability"] == null ? null : Species.fromJson(json["ability"]),
        isHidden: json["is_hidden"] == null ? null : json["is_hidden"],
        slot: json["slot"] == null ? null : json["slot"],
      );

  Map<String, dynamic> toJson() => {
        "ability": ability == null ? null : ability.toJson(),
        "is_hidden": isHidden == null ? null : isHidden,
        "slot": slot == null ? null : slot,
      };
}

class Species {
  String name;
  String url;

  Species({
    this.name,
    this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) => Species(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}

class GameIndex {
  int gameIndex;
  Species version;

  GameIndex({
    this.gameIndex,
    this.version,
  });

  factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"] == null ? null : json["game_index"],
        version:
            json["version"] == null ? null : Species.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "game_index": gameIndex == null ? null : gameIndex,
        "version": version == null ? null : version.toJson(),
      };
}

class HeldItem {
  Species item;
  List<VersionDetail> versionDetails;

  HeldItem({
    this.item,
    this.versionDetails,
  });

  factory HeldItem.fromJson(Map<String, dynamic> json) => HeldItem(
        item: json["item"] == null ? null : Species.fromJson(json["item"]),
        versionDetails: json["version_details"] == null
            ? null
            : List<VersionDetail>.from(
                json["version_details"].map((x) => VersionDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "item": item == null ? null : item.toJson(),
        "version_details": versionDetails == null
            ? null
            : List<dynamic>.from(versionDetails.map((x) => x.toJson())),
      };
}

class VersionDetail {
  int rarity;
  Species version;

  VersionDetail({
    this.rarity,
    this.version,
  });

  factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
        rarity: json["rarity"] == null ? null : json["rarity"],
        version:
            json["version"] == null ? null : Species.fromJson(json["version"]),
      );

  Map<String, dynamic> toJson() => {
        "rarity": rarity == null ? null : rarity,
        "version": version == null ? null : version.toJson(),
      };
}

class Move {
  Species move;
  List<VersionGroupDetail> versionGroupDetails;

  Move({
    this.move,
    this.versionGroupDetails,
  });

  Future<move.Move> get abilityInfo async =>
      await PokeAPI().getMoveInfo(move: move?.name);

  factory Move.fromJson(Map<String, dynamic> json) => Move(
        move: json["move"] == null ? null : Species.fromJson(json["move"]),
        versionGroupDetails: json["version_group_details"] == null
            ? null
            : List<VersionGroupDetail>.from(json["version_group_details"]
                .map((x) => VersionGroupDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "move": move == null ? null : move.toJson(),
        "version_group_details": versionGroupDetails == null
            ? null
            : List<dynamic>.from(versionGroupDetails.map((x) => x.toJson())),
      };
}

class VersionGroupDetail {
  int levelLearnedAt;
  Species moveLearnMethod;
  Species versionGroup;

  VersionGroupDetail({
    this.levelLearnedAt,
    this.moveLearnMethod,
    this.versionGroup,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      VersionGroupDetail(
        levelLearnedAt:
            json["level_learned_at"] == null ? null : json["level_learned_at"],
        moveLearnMethod: json["move_learn_method"] == null
            ? null
            : Species.fromJson(json["move_learn_method"]),
        versionGroup: json["version_group"] == null
            ? null
            : Species.fromJson(json["version_group"]),
      );

  Map<String, dynamic> toJson() => {
        "level_learned_at": levelLearnedAt == null ? null : levelLearnedAt,
        "move_learn_method":
            moveLearnMethod == null ? null : moveLearnMethod.toJson(),
        "version_group": versionGroup == null ? null : versionGroup.toJson(),
      };
}

class Sprites {
  String backDefault;
  dynamic backFemale;
  String backShiny;
  dynamic backShinyFemale;
  String frontDefault;
  dynamic frontFemale;
  String frontShiny;
  dynamic frontShinyFemale;

  Sprites({
    this.backDefault,
    this.backFemale,
    this.backShiny,
    this.backShinyFemale,
    this.frontDefault,
    this.frontFemale,
    this.frontShiny,
    this.frontShinyFemale,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"] == null ? null : json["back_default"],
        backFemale: json["back_female"],
        backShiny: json["back_shiny"] == null ? null : json["back_shiny"],
        backShinyFemale: json["back_shiny_female"],
        frontDefault:
            json["front_default"] == null ? null : json["front_default"],
        frontFemale: json["front_female"],
        frontShiny: json["front_shiny"] == null ? null : json["front_shiny"],
        frontShinyFemale: json["front_shiny_female"],
      );

  Map<String, dynamic> toJson() => {
        "back_default": backDefault == null ? null : backDefault,
        "back_female": backFemale,
        "back_shiny": backShiny == null ? null : backShiny,
        "back_shiny_female": backShinyFemale,
        "front_default": frontDefault == null ? null : frontDefault,
        "front_female": frontFemale,
        "front_shiny": frontShiny == null ? null : frontShiny,
        "front_shiny_female": frontShinyFemale,
      };
}

class Stat {
  int baseStat;
  int effort;
  Species stat;

  Stat({
    this.baseStat,
    this.effort,
    this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        baseStat: json["base_stat"] == null ? null : json["base_stat"],
        effort: json["effort"] == null ? null : json["effort"],
        stat: json["stat"] == null ? null : Species.fromJson(json["stat"]),
      );

  Map<String, dynamic> toJson() => {
        "base_stat": baseStat == null ? null : baseStat,
        "effort": effort == null ? null : effort,
        "stat": stat == null ? null : stat.toJson(),
      };
}

class Type {
  int slot;
  Species type;

  Type({
    this.slot,
    this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        slot: json["slot"] == null ? null : json["slot"],
        type: json["type"] == null ? null : Species.fromJson(json["type"]),
      );

  Map<String, dynamic> toJson() => {
        "slot": slot == null ? null : slot,
        "type": type == null ? null : type.toJson(),
      };
}

// To parse this JSON data, do
//
//     final pokeList = pokeListFromJson(jsonString);

PokeList pokeListFromJson(String str) => PokeList.fromJson(json.decode(str));

String pokeListToJson(PokeList data) => json.encode(data.toJson());

class PokeList {
  int count;
  dynamic next;
  dynamic previous;
  List<Result> results;

  PokeList({
    this.count,
    this.next,
    this.previous,
    this.results,
  });

  factory PokeList.fromJson(Map<String, dynamic> json) => PokeList(
        count: json["count"] == null ? null : json["count"],
        next: json["next"],
        previous: json["previous"],
        results: json["results"] == null
            ? null
            : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count == null ? null : count,
        "next": next,
        "previous": previous,
        "results": results == null
            ? null
            : List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  String name;
  String url;

  Result({
    this.name,
    this.url,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
      };
}
