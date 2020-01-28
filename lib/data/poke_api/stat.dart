// To parse this JSON data, do
//
//     final stat = statFromJson(jsonString);
//
// API call
//
//     https://pokeapi.co/api/v2/stat/${id}/

import 'dart:convert';

Stat statFromJson(String str) => Stat.fromJson(json.decode(str));

String statToJson(Stat data) => json.encode(data.toJson());

class Stat {
    AffectingMoves affectingMoves;
    AffectingNatures affectingNatures;
    List<Characteristic> characteristics;
    int gameIndex;
    int id;
    bool isBattleOnly;
    dynamic moveDamageClass;
    String name;
    List<Name> names;

    Stat({
        this.affectingMoves,
        this.affectingNatures,
        this.characteristics,
        this.gameIndex,
        this.id,
        this.isBattleOnly,
        this.moveDamageClass,
        this.name,
        this.names,
    });

    factory Stat.fromJson(Map<String, dynamic> json) => Stat(
        affectingMoves: json["affecting_moves"] == null ? null : AffectingMoves.fromJson(json["affecting_moves"]),
        affectingNatures: json["affecting_natures"] == null ? null : AffectingNatures.fromJson(json["affecting_natures"]),
        characteristics: json["characteristics"] == null ? null : List<Characteristic>.from(json["characteristics"].map((x) => Characteristic.fromJson(x))),
        gameIndex: json["game_index"] == null ? null : json["game_index"],
        id: json["id"] == null ? null : json["id"],
        isBattleOnly: json["is_battle_only"] == null ? null : json["is_battle_only"],
        moveDamageClass: json["move_damage_class"],
        name: json["name"] == null ? null : json["name"],
        names: json["names"] == null ? null : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "affecting_moves": affectingMoves == null ? null : affectingMoves.toJson(),
        "affecting_natures": affectingNatures == null ? null : affectingNatures.toJson(),
        "characteristics": characteristics == null ? null : List<dynamic>.from(characteristics.map((x) => x.toJson())),
        "game_index": gameIndex == null ? null : gameIndex,
        "id": id == null ? null : id,
        "is_battle_only": isBattleOnly == null ? null : isBattleOnly,
        "move_damage_class": moveDamageClass,
        "name": name == null ? null : name,
        "names": names == null ? null : List<dynamic>.from(names.map((x) => x.toJson())),
    };
}

class AffectingMoves {
    List<Crease> decrease;
    List<Crease> increase;

    AffectingMoves({
        this.decrease,
        this.increase,
    });

    factory AffectingMoves.fromJson(Map<String, dynamic> json) => AffectingMoves(
        decrease: json["decrease"] == null ? null : List<Crease>.from(json["decrease"].map((x) => Crease.fromJson(x))),
        increase: json["increase"] == null ? null : List<Crease>.from(json["increase"].map((x) => Crease.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "decrease": decrease == null ? null : List<dynamic>.from(decrease.map((x) => x.toJson())),
        "increase": increase == null ? null : List<dynamic>.from(increase.map((x) => x.toJson())),
    };
}

class Crease {
    int change;
    Decrease move;

    Crease({
        this.change,
        this.move,
    });

    factory Crease.fromJson(Map<String, dynamic> json) => Crease(
        change: json["change"] == null ? null : json["change"],
        move: json["move"] == null ? null : Decrease.fromJson(json["move"]),
    );

    Map<String, dynamic> toJson() => {
        "change": change == null ? null : change,
        "move": move == null ? null : move.toJson(),
    };
}

class Decrease {
    String name;
    String url;

    Decrease({
        this.name,
        this.url,
    });

    factory Decrease.fromJson(Map<String, dynamic> json) => Decrease(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
    };
}

class AffectingNatures {
    List<Decrease> decrease;
    List<Decrease> increase;

    AffectingNatures({
        this.decrease,
        this.increase,
    });

    factory AffectingNatures.fromJson(Map<String, dynamic> json) => AffectingNatures(
        decrease: json["decrease"] == null ? null : List<Decrease>.from(json["decrease"].map((x) => Decrease.fromJson(x))),
        increase: json["increase"] == null ? null : List<Decrease>.from(json["increase"].map((x) => Decrease.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "decrease": decrease == null ? null : List<dynamic>.from(decrease.map((x) => x.toJson())),
        "increase": increase == null ? null : List<dynamic>.from(increase.map((x) => x.toJson())),
    };
}

class Characteristic {
    String url;

    Characteristic({
        this.url,
    });

    factory Characteristic.fromJson(Map<String, dynamic> json) => Characteristic(
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
    };
}

class Name {
    Decrease language;
    String name;

    Name({
        this.language,
        this.name,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: json["language"] == null ? null : Decrease.fromJson(json["language"]),
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language == null ? null : language.toJson(),
        "name": name == null ? null : name,
    };
}
