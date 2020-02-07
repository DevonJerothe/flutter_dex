// To parse this JSON data, do
//
//     final form = formFromJson(jsonString);
//
// API call
//
//     https://pokeapi.co/api/v2/pokemon-form/${id}

import 'dart:convert';

Form formFromJson(String str) => Form.fromJson(json.decode(str));

String formToJson(Form data) => json.encode(data.toJson());

class Form {
    String formName;
    List<dynamic> formNames;
    int formOrder;
    int id;
    bool isBattleOnly;
    bool isDefault;
    bool isMega;
    String name;
    List<dynamic> names;
    int order;
    Pokemon pokemon;
    Sprites sprites;
    Pokemon versionGroup;

    Form({
        this.formName,
        this.formNames,
        this.formOrder,
        this.id,
        this.isBattleOnly,
        this.isDefault,
        this.isMega,
        this.name,
        this.names,
        this.order,
        this.pokemon,
        this.sprites,
        this.versionGroup,
    });

    factory Form.fromJson(Map<String, dynamic> json) => Form(
        formName: json["form_name"] == null ? null : json["form_name"],
        formNames: json["form_names"] == null ? null : List<dynamic>.from(json["form_names"].map((x) => x)),
        formOrder: json["form_order"] == null ? null : json["form_order"],
        id: json["id"] == null ? null : json["id"],
        isBattleOnly: json["is_battle_only"] == null ? null : json["is_battle_only"],
        isDefault: json["is_default"] == null ? null : json["is_default"],
        isMega: json["is_mega"] == null ? null : json["is_mega"],
        name: json["name"] == null ? null : json["name"],
        names: json["names"] == null ? null : List<dynamic>.from(json["names"].map((x) => x)),
        order: json["order"] == null ? null : json["order"],
        pokemon: json["pokemon"] == null ? null : Pokemon.fromJson(json["pokemon"]),
        sprites: json["sprites"] == null ? null : Sprites.fromJson(json["sprites"]),
        versionGroup: json["version_group"] == null ? null : Pokemon.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "form_name": formName == null ? null : formName,
        "form_names": formNames == null ? null : List<dynamic>.from(formNames.map((x) => x)),
        "form_order": formOrder == null ? null : formOrder,
        "id": id == null ? null : id,
        "is_battle_only": isBattleOnly == null ? null : isBattleOnly,
        "is_default": isDefault == null ? null : isDefault,
        "is_mega": isMega == null ? null : isMega,
        "name": name == null ? null : name,
        "names": names == null ? null : List<dynamic>.from(names.map((x) => x)),
        "order": order == null ? null : order,
        "pokemon": pokemon == null ? null : pokemon.toJson(),
        "sprites": sprites == null ? null : sprites.toJson(),
        "version_group": versionGroup == null ? null : versionGroup.toJson(),
    };
}

class Pokemon {
    String name;
    String url;

    Pokemon({
        this.name,
        this.url,
    });

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
    };
}

class Sprites {
    String backDefault;
    String backShiny;
    String frontDefault;
    String frontShiny;

    Sprites({
        this.backDefault,
        this.backShiny,
        this.frontDefault,
        this.frontShiny,
    });

    factory Sprites.fromJson(Map<String, dynamic> json) => Sprites(
        backDefault: json["back_default"] == null ? null : json["back_default"],
        backShiny: json["back_shiny"] == null ? null : json["back_shiny"],
        frontDefault: json["front_default"] == null ? null : json["front_default"],
        frontShiny: json["front_shiny"] == null ? null : json["front_shiny"],
    );

    Map<String, dynamic> toJson() => {
        "back_default": backDefault == null ? null : backDefault,
        "back_shiny": backShiny == null ? null : backShiny,
        "front_default": frontDefault == null ? null : frontDefault,
        "front_shiny": frontShiny == null ? null : frontShiny,
    };
}
