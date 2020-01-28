// To parse this JSON data, do
//
//      final smogon = smogonFromJson(jsonString);
//
// To get json data use 
//
//      POST https://www.smogon.com/dex/_rpc/dump-pokemon
//
//      SEND BODY: {"gen":"ss","alias":"charizard","language":"en"}
//
// To get pokemon git
//
//      https://www.smogon.com/dex/media/sprites/xy/ralts.gif
//

import 'dart:convert';

Smogon smogonFromJson(String str) => Smogon.fromJson(json.decode(str));

String smogonToJson(Smogon data) => json.encode(data.toJson());

class Smogon {
    List<String> languages;
    List<String> learnset;
    List<Strategy> strategies;

    Smogon({
        this.languages,
        this.learnset,
        this.strategies,
    });

    factory Smogon.fromJson(Map<String, dynamic> json) => Smogon(
        languages: List<String>.from(json["languages"].map((x) => x)),
        learnset: List<String>.from(json["learnset"].map((x) => x)),
        strategies: List<Strategy>.from(json["strategies"].map((x) => Strategy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "languages": List<dynamic>.from(languages.map((x) => x)),
        "learnset": List<dynamic>.from(learnset.map((x) => x)),
        "strategies": List<dynamic>.from(strategies.map((x) => x.toJson())),
    };
}

class Strategy {
    String format;
    String overview;
    String comments;
    List<Moveset> movesets;
    Credits credits;

    Strategy({
        this.format,
        this.overview,
        this.comments,
        this.movesets,
        this.credits,
    });

    factory Strategy.fromJson(Map<String, dynamic> json) => Strategy(
        format: json["format"],
        overview: json["overview"],
        comments: json["comments"],
        movesets: List<Moveset>.from(json["movesets"].map((x) => Moveset.fromJson(x))),
        credits: Credits.fromJson(json["credits"]),
    );

    Map<String, dynamic> toJson() => {
        "format": format,
        "overview": overview,
        "comments": comments,
        "movesets": List<dynamic>.from(movesets.map((x) => x.toJson())),
        "credits": credits.toJson(),
    };
}

class Credits {
    List<Team> teams;
    List<WrittenBy> writtenBy;

    Credits({
        this.teams,
        this.writtenBy,
    });

    factory Credits.fromJson(Map<String, dynamic> json) => Credits(
        teams: List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
        writtenBy: List<WrittenBy>.from(json["writtenBy"].map((x) => WrittenBy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "teams": List<dynamic>.from(teams.map((x) => x.toJson())),
        "writtenBy": List<dynamic>.from(writtenBy.map((x) => x.toJson())),
    };
}

class Team {
    String name;
    List<WrittenBy> members;

    Team({
        this.name,
        this.members,
    });

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        name: json["name"],
        members: List<WrittenBy>.from(json["members"].map((x) => WrittenBy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "members": List<dynamic>.from(members.map((x) => x.toJson())),
    };
}

class WrittenBy {
    int userId;
    String username;

    WrittenBy({
        this.userId,
        this.username,
    });

    factory WrittenBy.fromJson(Map<String, dynamic> json) => WrittenBy(
        userId: json["user_id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
    };
}

class Moveset {
    String name;
    String pokemon;
    bool shiny;
    String gender;
    int level;
    String description;
    List<String> abilities;
    List<String> items;
    List<List<String>> moveslots;
    List<Evconfig> evconfigs;
    List<dynamic> ivconfigs;
    List<String> natures;

    Moveset({
        this.name,
        this.pokemon,
        this.shiny,
        this.gender,
        this.level,
        this.description,
        this.abilities,
        this.items,
        this.moveslots,
        this.evconfigs,
        this.ivconfigs,
        this.natures,
    });

    factory Moveset.fromJson(Map<String, dynamic> json) => Moveset(
        name: json["name"],
        pokemon: json["pokemon"],
        shiny: json["shiny"],
        gender: json["gender"],
        level: json["level"],
        description: json["description"],
        abilities: List<String>.from(json["abilities"].map((x) => x)),
        items: List<String>.from(json["items"].map((x) => x)),
        moveslots: List<List<String>>.from(json["moveslots"].map((x) => List<String>.from(x.map((x) => x)))),
        evconfigs: List<Evconfig>.from(json["evconfigs"].map((x) => Evconfig.fromJson(x))),
        ivconfigs: List<dynamic>.from(json["ivconfigs"].map((x) => x)),
        natures: List<String>.from(json["natures"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "pokemon": pokemon,
        "shiny": shiny,
        "gender": gender,
        "level": level,
        "description": description,
        "abilities": List<dynamic>.from(abilities.map((x) => x)),
        "items": List<dynamic>.from(items.map((x) => x)),
        "moveslots": List<dynamic>.from(moveslots.map((x) => List<dynamic>.from(x.map((x) => x)))),
        "evconfigs": List<dynamic>.from(evconfigs.map((x) => x.toJson())),
        "ivconfigs": List<dynamic>.from(ivconfigs.map((x) => x)),
        "natures": List<dynamic>.from(natures.map((x) => x)),
    };
}

class Evconfig {
    int hp;
    int atk;
    int def;
    int spa;
    int spd;
    int spe;

    Evconfig({
        this.hp,
        this.atk,
        this.def,
        this.spa,
        this.spd,
        this.spe,
    });

    factory Evconfig.fromJson(Map<String, dynamic> json) => Evconfig(
        hp: json["hp"],
        atk: json["atk"],
        def: json["def"],
        spa: json["spa"],
        spd: json["spd"],
        spe: json["spe"],
    );

    Map<String, dynamic> toJson() => {
        "hp": hp,
        "atk": atk,
        "def": def,
        "spa": spa,
        "spd": spd,
        "spe": spe,
    };
}
