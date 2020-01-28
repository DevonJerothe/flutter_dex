// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);
//
// API call
//
//     https://pokeapi.co/api/v2/item/${id}/

import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
    List<Category> attributes;
    dynamic babyTriggerFor;
    Category category;
    int cost;
    List<EffectEntry> effectEntries;
    List<FlavorTextEntry> flavorTextEntries;
    Category flingEffect;
    int flingPower;
    List<GameIndex> gameIndices;
    List<HeldByPokemon> heldByPokemon;
    int id;
    List<dynamic> machines;
    String name;
    List<Name> names;
    Sprites sprites;

    Item({
        this.attributes,
        this.babyTriggerFor,
        this.category,
        this.cost,
        this.effectEntries,
        this.flavorTextEntries,
        this.flingEffect,
        this.flingPower,
        this.gameIndices,
        this.heldByPokemon,
        this.id,
        this.machines,
        this.name,
        this.names,
        this.sprites,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        attributes: json["attributes"] == null ? null : List<Category>.from(json["attributes"].map((x) => Category.fromJson(x))),
        babyTriggerFor: json["baby_trigger_for"],
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
        cost: json["cost"] == null ? null : json["cost"],
        effectEntries: json["effect_entries"] == null ? null : List<EffectEntry>.from(json["effect_entries"].map((x) => EffectEntry.fromJson(x))),
        flavorTextEntries: json["flavor_text_entries"] == null ? null : List<FlavorTextEntry>.from(json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
        flingEffect: json["fling_effect"] == null ? null : Category.fromJson(json["fling_effect"]),
        flingPower: json["fling_power"] == null ? null : json["fling_power"],
        gameIndices: json["game_indices"] == null ? null : List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromJson(x))),
        heldByPokemon: json["held_by_pokemon"] == null ? null : List<HeldByPokemon>.from(json["held_by_pokemon"].map((x) => HeldByPokemon.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
        machines: json["machines"] == null ? null : List<dynamic>.from(json["machines"].map((x) => x)),
        name: json["name"] == null ? null : json["name"],
        names: json["names"] == null ? null : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        sprites: json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
    );

    Map<String, dynamic> toJson() => {
        "attributes": attributes == null ? null : List<dynamic>.from(attributes.map((x) => x.toJson())),
        "baby_trigger_for": babyTriggerFor,
        "category": category == null ? null : category.toJson(),
        "cost": cost == null ? null : cost,
        "effect_entries": effectEntries == null ? null : List<dynamic>.from(effectEntries.map((x) => x.toJson())),
        "flavor_text_entries": flavorTextEntries == null ? null : List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
        "fling_effect": flingEffect == null ? null : flingEffect.toJson(),
        "fling_power": flingPower == null ? null : flingPower,
        "game_indices": gameIndices == null ? null : List<dynamic>.from(gameIndices.map((x) => x.toJson())),
        "held_by_pokemon": heldByPokemon == null ? null : List<dynamic>.from(heldByPokemon.map((x) => x.toJson())),
        "id": id == null ? null : id,
        "machines": machines == null ? null : List<dynamic>.from(machines.map((x) => x)),
        "name": name == null ? null : name,
        "names": names == null ? null : List<dynamic>.from(names.map((x) => x.toJson())),
        "sprites": sprites == null ? null : sprites.toJson(),
    };
}

class Category {
    String name;
    String url;

    Category({
        this.name,
        this.url,
    });

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
    };
}

class EffectEntry {
    String effect;
    Category language;
    String shortEffect;

    EffectEntry({
        this.effect,
        this.language,
        this.shortEffect,
    });

    factory EffectEntry.fromJson(Map<String, dynamic> json) => EffectEntry(
        effect: json["effect"] == null ? null : json["effect"],
        language: json["language"] == null ? null : Category.fromJson(json["language"]),
        shortEffect: json["short_effect"] == null ? null : json["short_effect"],
    );

    Map<String, dynamic> toJson() => {
        "effect": effect == null ? null : effect,
        "language": language == null ? null : language.toJson(),
        "short_effect": shortEffect == null ? null : shortEffect,
    };
}

class FlavorTextEntry {
    Category language;
    String text;
    Category versionGroup;

    FlavorTextEntry({
        this.language,
        this.text,
        this.versionGroup,
    });

    factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => FlavorTextEntry(
        language: json["language"] == null ? null : Category.fromJson(json["language"]),
        text: json["text"] == null ? null : json["text"],
        versionGroup: json["version_group"] == null ? null : Category.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "language": language == null ? null : language.toJson(),
        "text": text == null ? null : text,
        "version_group": versionGroup == null ? null : versionGroup.toJson(),
    };
}

class GameIndex {
    int gameIndex;
    Category generation;

    GameIndex({
        this.gameIndex,
        this.generation,
    });

    factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"] == null ? null : json["game_index"],
        generation: json["generation"] == null ? null : Category.fromJson(json["generation"]),
    );

    Map<String, dynamic> toJson() => {
        "game_index": gameIndex == null ? null : gameIndex,
        "generation": generation == null ? null : generation.toJson(),
    };
}

class HeldByPokemon {
    Category pokemon;
    List<VersionDetail> versionDetails;

    HeldByPokemon({
        this.pokemon,
        this.versionDetails,
    });

    factory HeldByPokemon.fromJson(Map<String, dynamic> json) => HeldByPokemon(
        pokemon: json["pokemon"] == null ? null : Category.fromJson(json["pokemon"]),
        versionDetails: json["version_details"] == null ? null : List<VersionDetail>.from(json["version_details"].map((x) => VersionDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "pokemon": pokemon == null ? null : pokemon.toJson(),
        "version_details": versionDetails == null ? null : List<dynamic>.from(versionDetails.map((x) => x.toJson())),
    };
}

class VersionDetail {
    int rarity;
    Category version;

    VersionDetail({
        this.rarity,
        this.version,
    });

    factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
        rarity: json["rarity"] == null ? null : json["rarity"],
        version: json["version"] == null ? null : Category.fromJson(json["version"]),
    );

    Map<String, dynamic> toJson() => {
        "rarity": rarity == null ? null : rarity,
        "version": version == null ? null : version.toJson(),
    };
}

class Name {
    Category language;
    String name;

    Name({
        this.language,
        this.name,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: json["language"] == null ? null : Category.fromJson(json["language"]),
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language == null ? null : language.toJson(),
        "name": name == null ? null : name,
    };
}

class Sprites {
    String spritesDefault;

    Sprites({
        this.spritesDefault,
    });

    factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        spritesDefault: json["default"] == null ? null : json["default"],
    );

    Map<String, dynamic> toJson() => {
        "default": spritesDefault == null ? null : spritesDefault,
    };
}
