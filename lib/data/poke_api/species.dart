// To parse this JSON data, do
//
//     final species = speciesFromJson(jsonString);
//
// API call
//
//     https://pokeapi.co/api/v2/pokemon-species/${id}/

import 'dart:convert';

Species speciesFromJson(String str) => Species.fromJson(json.decode(str));

String speciesToJson(Species data) => json.encode(data.toJson());

class Species {
    int baseHappiness;
    int captureRate;
    Color color;
    List<Color> eggGroups;
    EvolutionChain evolutionChain;
    dynamic evolvesFromSpecies;
    List<FlavorTextEntry> flavorTextEntries;
    List<dynamic> formDescriptions;
    bool formsSwitchable;
    int genderRate;
    List<Genus> genera;
    Color generation;
    Color growthRate;
    Color habitat;
    bool hasGenderDifferences;
    int hatchCounter;
    int id;
    bool isBaby;
    String name;
    List<Name> names;
    int order;
    List<PalParkEncounter> palParkEncounters;
    List<PokedexNumber> pokedexNumbers;
    Color shape;
    List<Variety> varieties;

    Species({
        this.baseHappiness,
        this.captureRate,
        this.color,
        this.eggGroups,
        this.evolutionChain,
        this.evolvesFromSpecies,
        this.flavorTextEntries,
        this.formDescriptions,
        this.formsSwitchable,
        this.genderRate,
        this.genera,
        this.generation,
        this.growthRate,
        this.habitat,
        this.hasGenderDifferences,
        this.hatchCounter,
        this.id,
        this.isBaby,
        this.name,
        this.names,
        this.order,
        this.palParkEncounters,
        this.pokedexNumbers,
        this.shape,
        this.varieties,
    });

    factory Species.fromJson(Map<String, dynamic> json) => Species(
        baseHappiness: json["base_happiness"] == null ? null : json["base_happiness"],
        captureRate: json["capture_rate"] == null ? null : json["capture_rate"],
        color: json["color"] == null ? null : Color.fromJson(json["color"]),
        eggGroups: json["egg_groups"] == null ? null : List<Color>.from(json["egg_groups"].map((x) => Color.fromJson(x))),
        evolutionChain: json["evolution_chain"] == null ? null : EvolutionChain.fromJson(json["evolution_chain"]),
        evolvesFromSpecies: json["evolves_from_species"],
        flavorTextEntries: json["flavor_text_entries"] == null ? null : List<FlavorTextEntry>.from(json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
        formDescriptions: json["form_descriptions"] == null ? null : List<dynamic>.from(json["form_descriptions"].map((x) => x)),
        formsSwitchable: json["forms_switchable"] == null ? null : json["forms_switchable"],
        genderRate: json["gender_rate"] == null ? null : json["gender_rate"],
        genera: json["genera"] == null ? null : List<Genus>.from(json["genera"].map((x) => Genus.fromJson(x))),
        generation: json["generation"] == null ? null : Color.fromJson(json["generation"]),
        growthRate: json["growth_rate"] == null ? null : Color.fromJson(json["growth_rate"]),
        habitat: json["habitat"] == null ? null : Color.fromJson(json["habitat"]),
        hasGenderDifferences: json["has_gender_differences"] == null ? null : json["has_gender_differences"],
        hatchCounter: json["hatch_counter"] == null ? null : json["hatch_counter"],
        id: json["id"] == null ? null : json["id"],
        isBaby: json["is_baby"] == null ? null : json["is_baby"],
        name: json["name"] == null ? null : json["name"],
        names: json["names"] == null ? null : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        order: json["order"] == null ? null : json["order"],
        palParkEncounters: json["pal_park_encounters"] == null ? null : List<PalParkEncounter>.from(json["pal_park_encounters"].map((x) => PalParkEncounter.fromJson(x))),
        pokedexNumbers: json["pokedex_numbers"] == null ? null : List<PokedexNumber>.from(json["pokedex_numbers"].map((x) => PokedexNumber.fromJson(x))),
        shape: json["shape"] == null ? null : Color.fromJson(json["shape"]),
        varieties: json["varieties"] == null ? null : List<Variety>.from(json["varieties"].map((x) => Variety.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "base_happiness": baseHappiness == null ? null : baseHappiness,
        "capture_rate": captureRate == null ? null : captureRate,
        "color": color == null ? null : color.toJson(),
        "egg_groups": eggGroups == null ? null : List<dynamic>.from(eggGroups.map((x) => x.toJson())),
        "evolution_chain": evolutionChain == null ? null : evolutionChain.toJson(),
        "evolves_from_species": evolvesFromSpecies,
        "flavor_text_entries": flavorTextEntries == null ? null : List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
        "form_descriptions": formDescriptions == null ? null : List<dynamic>.from(formDescriptions.map((x) => x)),
        "forms_switchable": formsSwitchable == null ? null : formsSwitchable,
        "gender_rate": genderRate == null ? null : genderRate,
        "genera": genera == null ? null : List<dynamic>.from(genera.map((x) => x.toJson())),
        "generation": generation == null ? null : generation.toJson(),
        "growth_rate": growthRate == null ? null : growthRate.toJson(),
        "habitat": habitat == null ? null : habitat.toJson(),
        "has_gender_differences": hasGenderDifferences == null ? null : hasGenderDifferences,
        "hatch_counter": hatchCounter == null ? null : hatchCounter,
        "id": id == null ? null : id,
        "is_baby": isBaby == null ? null : isBaby,
        "name": name == null ? null : name,
        "names": names == null ? null : List<dynamic>.from(names.map((x) => x.toJson())),
        "order": order == null ? null : order,
        "pal_park_encounters": palParkEncounters == null ? null : List<dynamic>.from(palParkEncounters.map((x) => x.toJson())),
        "pokedex_numbers": pokedexNumbers == null ? null : List<dynamic>.from(pokedexNumbers.map((x) => x.toJson())),
        "shape": shape == null ? null : shape.toJson(),
        "varieties": varieties == null ? null : List<dynamic>.from(varieties.map((x) => x.toJson())),
    };
}

class Color {
    String name;
    String url;

    Color({
        this.name,
        this.url,
    });

    factory Color.fromJson(Map<String, dynamic> json) => Color(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
    };
}

class EvolutionChain {
    String url;

    EvolutionChain({
        this.url,
    });

    factory EvolutionChain.fromJson(Map<String, dynamic> json) => EvolutionChain(
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
    };
}

class FlavorTextEntry {
    String flavorText;
    Color language;
    Color version;

    FlavorTextEntry({
        this.flavorText,
        this.language,
        this.version,
    });

    factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"] == null ? null : json["flavor_text"],
        language: json["language"] == null ? null : Color.fromJson(json["language"]),
        version: json["version"] == null ? null : Color.fromJson(json["version"]),
    );

    Map<String, dynamic> toJson() => {
        "flavor_text": flavorText == null ? null : flavorText,
        "language": language == null ? null : language.toJson(),
        "version": version == null ? null : version.toJson(),
    };
}

class Genus {
    String genus;
    Color language;

    Genus({
        this.genus,
        this.language,
    });

    factory Genus.fromJson(Map<String, dynamic> json) => Genus(
        genus: json["genus"] == null ? null : json["genus"],
        language: json["language"] == null ? null : Color.fromJson(json["language"]),
    );

    Map<String, dynamic> toJson() => {
        "genus": genus == null ? null : genus,
        "language": language == null ? null : language.toJson(),
    };
}

class Name {
    Color language;
    String name;

    Name({
        this.language,
        this.name,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: json["language"] == null ? null : Color.fromJson(json["language"]),
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language == null ? null : language.toJson(),
        "name": name == null ? null : name,
    };
}

class PalParkEncounter {
    Color area;
    int baseScore;
    int rate;

    PalParkEncounter({
        this.area,
        this.baseScore,
        this.rate,
    });

    factory PalParkEncounter.fromJson(Map<String, dynamic> json) => PalParkEncounter(
        area: json["area"] == null ? null : Color.fromJson(json["area"]),
        baseScore: json["base_score"] == null ? null : json["base_score"],
        rate: json["rate"] == null ? null : json["rate"],
    );

    Map<String, dynamic> toJson() => {
        "area": area == null ? null : area.toJson(),
        "base_score": baseScore == null ? null : baseScore,
        "rate": rate == null ? null : rate,
    };
}

class PokedexNumber {
    int entryNumber;
    Color pokedex;

    PokedexNumber({
        this.entryNumber,
        this.pokedex,
    });

    factory PokedexNumber.fromJson(Map<String, dynamic> json) => PokedexNumber(
        entryNumber: json["entry_number"] == null ? null : json["entry_number"],
        pokedex: json["pokedex"] == null ? null : Color.fromJson(json["pokedex"]),
    );

    Map<String, dynamic> toJson() => {
        "entry_number": entryNumber == null ? null : entryNumber,
        "pokedex": pokedex == null ? null : pokedex.toJson(),
    };
}

class Variety {
    bool isDefault;
    Color pokemon;

    Variety({
        this.isDefault,
        this.pokemon,
    });

    factory Variety.fromJson(Map<String, dynamic> json) => Variety(
        isDefault: json["is_default"] == null ? null : json["is_default"],
        pokemon: json["pokemon"] == null ? null : Color.fromJson(json["pokemon"]),
    );

    Map<String, dynamic> toJson() => {
        "is_default": isDefault == null ? null : isDefault,
        "pokemon": pokemon == null ? null : pokemon.toJson(),
    };
}
