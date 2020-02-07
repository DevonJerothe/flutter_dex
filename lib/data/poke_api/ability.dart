// To parse this JSON data, do
//
//     final ability = abilityFromJson(jsonString);
//
// API call
//
//     https://pokeapi.co/api/v2/ability/${id}

import 'dart:convert';

Ability abilityFromJson(String str) => Ability.fromJson(json.decode(str));

String abilityToJson(Ability data) => json.encode(data.toJson());

class Ability {
    List<dynamic> effectChanges;
    List<EffectEntry> effectEntries;
    List<FlavorTextEntry> flavorTextEntries;
    Generation generation;
    int id;
    bool isMainSeries;
    String name;
    List<Name> names;
    List<Pokemon> pokemon;

    Ability({
        this.effectChanges,
        this.effectEntries,
        this.flavorTextEntries,
        this.generation,
        this.id,
        this.isMainSeries,
        this.name,
        this.names,
        this.pokemon,
    });

    factory Ability.fromJson(Map<String, dynamic> json) => Ability(
        effectChanges: json["effect_changes"] == null ? null : List<dynamic>.from(json["effect_changes"].map((x) => x)),
        effectEntries: json["effect_entries"] == null ? null : List<EffectEntry>.from(json["effect_entries"].map((x) => EffectEntry.fromJson(x))),
        flavorTextEntries: json["flavor_text_entries"] == null ? null : List<FlavorTextEntry>.from(json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
        generation: json["generation"] == null ? null : Generation.fromJson(json["generation"]),
        id: json["id"] == null ? null : json["id"],
        isMainSeries: json["is_main_series"] == null ? null : json["is_main_series"],
        name: json["name"] == null ? null : json["name"],
        names: json["names"] == null ? null : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pokemon: json["pokemon"] == null ? null : List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "effect_changes": effectChanges == null ? null : List<dynamic>.from(effectChanges.map((x) => x)),
        "effect_entries": effectEntries == null ? null : List<dynamic>.from(effectEntries.map((x) => x.toJson())),
        "flavor_text_entries": flavorTextEntries == null ? null : List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
        "generation": generation == null ? null : generation.toJson(),
        "id": id == null ? null : id,
        "is_main_series": isMainSeries == null ? null : isMainSeries,
        "name": name == null ? null : name,
        "names": names == null ? null : List<dynamic>.from(names.map((x) => x.toJson())),
        "pokemon": pokemon == null ? null : List<dynamic>.from(pokemon.map((x) => x.toJson())),
    };
}

class EffectEntry {
    String effect;
    Generation language;
    String shortEffect;

    EffectEntry({
        this.effect,
        this.language,
        this.shortEffect,
    });

    factory EffectEntry.fromJson(Map<String, dynamic> json) => EffectEntry(
        effect: json["effect"] == null ? null : json["effect"],
        language: json["language"] == null ? null : Generation.fromJson(json["language"]),
        shortEffect: json["short_effect"] == null ? null : json["short_effect"],
    );

    Map<String, dynamic> toJson() => {
        "effect": effect == null ? null : effect,
        "language": language == null ? null : language.toJson(),
        "short_effect": shortEffect == null ? null : shortEffect,
    };
}

class Generation {
    String name;
    String url;

    Generation({
        this.name,
        this.url,
    });

    factory Generation.fromJson(Map<String, dynamic> json) => Generation(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
    };
}

class FlavorTextEntry {
    String flavorText;
    Generation language;
    Generation versionGroup;

    FlavorTextEntry({
        this.flavorText,
        this.language,
        this.versionGroup,
    });

    factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"] == null ? null : json["flavor_text"],
        language: json["language"] == null ? null : Generation.fromJson(json["language"]),
        versionGroup: json["version_group"] == null ? null : Generation.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "flavor_text": flavorText == null ? null : flavorText,
        "language": language == null ? null : language.toJson(),
        "version_group": versionGroup == null ? null : versionGroup.toJson(),
    };
}

class Name {
    Generation language;
    String name;

    Name({
        this.language,
        this.name,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: json["language"] == null ? null : Generation.fromJson(json["language"]),
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language == null ? null : language.toJson(),
        "name": name == null ? null : name,
    };
}

class Pokemon {
    bool isHidden;
    Generation pokemon;
    int slot;

    Pokemon({
        this.isHidden,
        this.pokemon,
        this.slot,
    });

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        isHidden: json["is_hidden"] == null ? null : json["is_hidden"],
        pokemon: json["pokemon"] == null ? null : Generation.fromJson(json["pokemon"]),
        slot: json["slot"] == null ? null : json["slot"],
    );

    Map<String, dynamic> toJson() => {
        "is_hidden": isHidden == null ? null : isHidden,
        "pokemon": pokemon == null ? null : pokemon.toJson(),
        "slot": slot == null ? null : slot,
    };
}
