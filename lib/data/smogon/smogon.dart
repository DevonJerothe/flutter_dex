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
// To get pokemon gif
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
        languages: json["languages"] == null ? null : List<String>.from(json["languages"].map((x) => x)),
        learnset: json["learnset"] == null ? null : List<String>.from(json["learnset"].map((x) => x)),
        strategies: json["strategies"] == null ? null : List<Strategy>.from(json["strategies"].map((x) => Strategy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "languages": languages == null ? null : List<dynamic>.from(languages.map((x) => x)),
        "learnset": learnset == null ? null : List<dynamic>.from(learnset.map((x) => x)),
        "strategies": strategies == null ? null : List<dynamic>.from(strategies.map((x) => x.toJson())),
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
        format: json["format"] == null ? null : json["format"],
        overview: json["overview"] == null ? null : json["overview"],
        comments: json["comments"] == null ? null : json["comments"],
        movesets: json["movesets"] == null ? null : List<Moveset>.from(json["movesets"].map((x) => Moveset.fromJson(x))),
        credits: json["credits"] == null ? null : Credits.fromJson(json["credits"]),
    );

    Map<String, dynamic> toJson() => {
        "format": format == null ? null : format,
        "overview": overview == null ? null : overview,
        "comments": comments == null ? null : comments,
        "movesets": movesets == null ? null : List<dynamic>.from(movesets.map((x) => x.toJson())),
        "credits": credits == null ? null : credits.toJson(),
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
        teams: json["teams"] == null ? null : List<Team>.from(json["teams"].map((x) => Team.fromJson(x))),
        writtenBy: json["writtenBy"] == null ? null : List<WrittenBy>.from(json["writtenBy"].map((x) => WrittenBy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "teams": teams == null ? null : List<dynamic>.from(teams.map((x) => x.toJson())),
        "writtenBy": writtenBy == null ? null : List<dynamic>.from(writtenBy.map((x) => x.toJson())),
    };
}

class Team {
    Name name;
    List<WrittenBy> members;

    Team({
        this.name,
        this.members,
    });

    factory Team.fromJson(Map<String, dynamic> json) => Team(
        name: json["name"] == null ? null : nameValues.map[json["name"]],
        members: json["members"] == null ? null : List<WrittenBy>.from(json["members"].map((x) => WrittenBy.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : nameValues.reverse[name],
        "members": members == null ? null : List<dynamic>.from(members.map((x) => x.toJson())),
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
        userId: json["user_id"] == null ? null : json["user_id"],
        username: json["username"] == null ? null : json["username"],
    );

    Map<String, dynamic> toJson() => {
        "user_id": userId == null ? null : userId,
        "username": username == null ? null : username,
    };
}

enum Name { QUALITY_CHECKED_BY, GRAMMAR_CHECKED_BY, EARLIER_VERSIONS_BY }

final nameValues = EnumValues({
    "Earlier versions by": Name.EARLIER_VERSIONS_BY,
    "Grammar checked by": Name.GRAMMAR_CHECKED_BY,
    "Quality checked by": Name.QUALITY_CHECKED_BY
});

class Moveset {
    String name;
    String pokemon;
    bool shiny;
    String gender;
    int level;
    String description;
    List<String> abilities;
    List<String> items;
    List<List<Moveslot>> moveslots;
    List<Vconfig> evconfigs;
    List<Vconfig> ivconfigs;
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
        name: json["name"] == null ? null : json["name"],
        pokemon: json["pokemon"] == null ? null : json["pokemon"],
        shiny: json["shiny"] == null ? null : json["shiny"],
        gender: json["gender"] == null ? null : json["gender"],
        level: json["level"] == null ? null : json["level"],
        description: json["description"] == null ? null : json["description"],
        abilities: json["abilities"] == null ? null : List<String>.from(json["abilities"].map((x) => x)),
        items: json["items"] == null ? null : List<String>.from(json["items"].map((x) => x)),
        moveslots: json["moveslots"] == null ? null : List<List<Moveslot>>.from(json["moveslots"].map((x) => List<Moveslot>.from(x.map((x) => Moveslot.fromJson(x))))),
        evconfigs: json["evconfigs"] == null ? null : List<Vconfig>.from(json["evconfigs"].map((x) => Vconfig.fromJson(x))),
        ivconfigs: json["ivconfigs"] == null ? null : List<Vconfig>.from(json["ivconfigs"].map((x) => Vconfig.fromJson(x))),
        natures: json["natures"] == null ? null : List<String>.from(json["natures"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "pokemon": pokemon == null ? null : pokemon,
        "shiny": shiny == null ? null : shiny,
        "gender": gender == null ? null : gender,
        "level": level == null ? null : level,
        "description": description == null ? null : description,
        "abilities": abilities == null ? null : List<dynamic>.from(abilities.map((x) => x)),
        "items": items == null ? null : List<dynamic>.from(items.map((x) => x)),
        "moveslots": moveslots == null ? null : List<dynamic>.from(moveslots.map((x) => List<dynamic>.from(x.map((x) => x.toJson())))),
        "evconfigs": evconfigs == null ? null : List<dynamic>.from(evconfigs.map((x) => x.toJson())),
        "ivconfigs": ivconfigs == null ? null : List<dynamic>.from(ivconfigs.map((x) => x.toJson())),
        "natures": natures == null ? null : List<dynamic>.from(natures.map((x) => x)),
    };
}

class Vconfig {
    int hp;
    int atk;
    int def;
    int spa;
    int spd;
    int spe;

    Vconfig({
        this.hp,
        this.atk,
        this.def,
        this.spa,
        this.spd,
        this.spe,
    });

    factory Vconfig.fromJson(Map<String, dynamic> json) => Vconfig(
        hp: json["hp"] == null ? null : json["hp"],
        atk: json["atk"] == null ? null : json["atk"],
        def: json["def"] == null ? null : json["def"],
        spa: json["spa"] == null ? null : json["spa"],
        spd: json["spd"] == null ? null : json["spd"],
        spe: json["spe"] == null ? null : json["spe"],
    );

    Map<String, dynamic> toJson() => {
        "hp": hp == null ? null : hp,
        "atk": atk == null ? null : atk,
        "def": def == null ? null : def,
        "spa": spa == null ? null : spa,
        "spd": spd == null ? null : spd,
        "spe": spe == null ? null : spe,
    };
}

class Moveslot {
    String move;
    dynamic type;

    Moveslot({
        this.move,
        this.type,
    });

    factory Moveslot.fromJson(Map<String, dynamic> json) => Moveslot(
        move: json["move"] == null ? null : json["move"],
        type: json["type"],
    );

    Map<String, dynamic> toJson() => {
        "move": move == null ? null : move,
        "type": type,
    };
}

class EnumValues<T> {
    Map<String, T> map;
    Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        if (reverseMap == null) {
            reverseMap = map.map((k, v) => new MapEntry(v, k));
        }
        return reverseMap;
    }
}
