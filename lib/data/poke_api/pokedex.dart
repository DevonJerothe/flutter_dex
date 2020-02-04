// To parse this JSON data, do
//
//     final pokedex = pokedexFromJson(jsonString);

import 'dart:convert';

Pokedex pokedexFromJson(String str) => Pokedex.fromJson(json.decode(str));

String pokedexToJson(Pokedex data) => json.encode(data.toJson());

class Pokedex {
    List<Description> descriptions;
    int id;
    bool isMainSeries;
    String name;
    List<Name> names;
    List<PokemonEntry> pokemonEntries;
    Region region;
    List<Region> versionGroups;

    Pokedex({
        this.descriptions,
        this.id,
        this.isMainSeries,
        this.name,
        this.names,
        this.pokemonEntries,
        this.region,
        this.versionGroups,
    });

    factory Pokedex.fromJson(Map<String, dynamic> json) => Pokedex(
        descriptions: json["descriptions"] == null ? null : List<Description>.from(json["descriptions"].map((x) => Description.fromJson(x))),
        id: json["id"] == null ? null : json["id"],
        isMainSeries: json["is_main_series"] == null ? null : json["is_main_series"],
        name: json["name"] == null ? null : json["name"],
        names: json["names"] == null ? null : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pokemonEntries: json["pokemon_entries"] == null ? null : List<PokemonEntry>.from(json["pokemon_entries"].map((x) => PokemonEntry.fromJson(x))),
        region: json["region"] == null ? null : Region.fromJson(json["region"]),
        versionGroups: json["version_groups"] == null ? null : List<Region>.from(json["version_groups"].map((x) => Region.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "descriptions": descriptions == null ? null : List<dynamic>.from(descriptions.map((x) => x.toJson())),
        "id": id == null ? null : id,
        "is_main_series": isMainSeries == null ? null : isMainSeries,
        "name": name == null ? null : name,
        "names": names == null ? null : List<dynamic>.from(names.map((x) => x.toJson())),
        "pokemon_entries": pokemonEntries == null ? null : List<dynamic>.from(pokemonEntries.map((x) => x.toJson())),
        "region": region == null ? null : region.toJson(),
        "version_groups": versionGroups == null ? null : List<dynamic>.from(versionGroups.map((x) => x.toJson())),
    };
}

class Description {
    String description;
    Region language;

    Description({
        this.description,
        this.language,
    });

    factory Description.fromJson(Map<String, dynamic> json) => Description(
        description: json["description"] == null ? null : json["description"],
        language: json["language"] == null ? null : Region.fromJson(json["language"]),
    );

    Map<String, dynamic> toJson() => {
        "description": description == null ? null : description,
        "language": language == null ? null : language.toJson(),
    };
}

class Region {
    String name;
    String url;

    Region({
        this.name,
        this.url,
    });

    factory Region.fromJson(Map<String, dynamic> json) => Region(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
    };
}

class Name {
    Region language;
    String name;

    Name({
        this.language,
        this.name,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: json["language"] == null ? null : Region.fromJson(json["language"]),
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language == null ? null : language.toJson(),
        "name": name == null ? null : name,
    };
}

class PokemonEntry {
    int entryNumber;
    Region pokemonSpecies;

    PokemonEntry({
        this.entryNumber,
        this.pokemonSpecies,
    });

    factory PokemonEntry.fromJson(Map<String, dynamic> json) => PokemonEntry(
        entryNumber: json["entry_number"] == null ? null : json["entry_number"],
        pokemonSpecies: json["pokemon_species"] == null ? null : Region.fromJson(json["pokemon_species"]),
    );

    Map<String, dynamic> toJson() => {
        "entry_number": entryNumber == null ? null : entryNumber,
        "pokemon_species": pokemonSpecies == null ? null : pokemonSpecies.toJson(),
    };
}
