// To parse this JSON data, do
//
//     final move = moveFromJson(jsonString);
//
// API call
//
//     https://pokeapi.co/api/v2/move/${id}/

import 'dart:convert';

Move moveFromJson(String str) => Move.fromJson(json.decode(str));

String moveToJson(Move data) => json.encode(data.toJson());

class Move {
    int accuracy;
    dynamic contestCombos;
    ContestEffect contestEffect;
    ContestType contestType;
    ContestType damageClass;
    dynamic effectChance;
    List<dynamic> effectChanges;
    List<EffectEntry> effectEntries;
    List<FlavorTextEntry> flavorTextEntries;
    ContestType generation;
    int id;
    List<Machine> machines;
    Meta meta;
    String name;
    List<Name> names;
    List<dynamic> pastValues;
    int power;
    int pp;
    int priority;
    List<dynamic> statChanges;
    ContestEffect superContestEffect;
    ContestType target;
    ContestType type;

    Move({
        this.accuracy,
        this.contestCombos,
        this.contestEffect,
        this.contestType,
        this.damageClass,
        this.effectChance,
        this.effectChanges,
        this.effectEntries,
        this.flavorTextEntries,
        this.generation,
        this.id,
        this.machines,
        this.meta,
        this.name,
        this.names,
        this.pastValues,
        this.power,
        this.pp,
        this.priority,
        this.statChanges,
        this.superContestEffect,
        this.target,
        this.type,
    });

    factory Move.fromJson(Map<String, dynamic> json) => Move(
        accuracy: json["accuracy"] == null ? null : json["accuracy"],
        contestCombos: json["contest_combos"],
        contestEffect: json["contest_effect"] == null ? null : ContestEffect.fromJson(json["contest_effect"]),
        contestType: json["contest_type"] == null ? null : ContestType.fromJson(json["contest_type"]),
        damageClass: json["damage_class"] == null ? null : ContestType.fromJson(json["damage_class"]),
        effectChance: json["effect_chance"],
        effectChanges: json["effect_changes"] == null ? null : List<dynamic>.from(json["effect_changes"].map((x) => x)),
        effectEntries: json["effect_entries"] == null ? null : List<EffectEntry>.from(json["effect_entries"].map((x) => EffectEntry.fromJson(x))),
        flavorTextEntries: json["flavor_text_entries"] == null ? null : List<FlavorTextEntry>.from(json["flavor_text_entries"].map((x) => FlavorTextEntry.fromJson(x))),
        generation: json["generation"] == null ? null : ContestType.fromJson(json["generation"]),
        id: json["id"] == null ? null : json["id"],
        machines: json["machines"] == null ? null : List<Machine>.from(json["machines"].map((x) => Machine.fromJson(x))),
        meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
        name: json["name"] == null ? null : json["name"],
        names: json["names"] == null ? null : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pastValues: json["past_values"] == null ? null : List<dynamic>.from(json["past_values"].map((x) => x)),
        power: json["power"] == null ? null : json["power"],
        pp: json["pp"] == null ? null : json["pp"],
        priority: json["priority"] == null ? null : json["priority"],
        statChanges: json["stat_changes"] == null ? null : List<dynamic>.from(json["stat_changes"].map((x) => x)),
        superContestEffect: json["super_contest_effect"] == null ? null : ContestEffect.fromJson(json["super_contest_effect"]),
        target: json["target"] == null ? null : ContestType.fromJson(json["target"]),
        type: json["type"] == null ? null : ContestType.fromJson(json["type"]),
    );

    Map<String, dynamic> toJson() => {
        "accuracy": accuracy == null ? null : accuracy,
        "contest_combos": contestCombos,
        "contest_effect": contestEffect == null ? null : contestEffect.toJson(),
        "contest_type": contestType == null ? null : contestType.toJson(),
        "damage_class": damageClass == null ? null : damageClass.toJson(),
        "effect_chance": effectChance,
        "effect_changes": effectChanges == null ? null : List<dynamic>.from(effectChanges.map((x) => x)),
        "effect_entries": effectEntries == null ? null : List<dynamic>.from(effectEntries.map((x) => x.toJson())),
        "flavor_text_entries": flavorTextEntries == null ? null : List<dynamic>.from(flavorTextEntries.map((x) => x.toJson())),
        "generation": generation == null ? null : generation.toJson(),
        "id": id == null ? null : id,
        "machines": machines == null ? null : List<dynamic>.from(machines.map((x) => x.toJson())),
        "meta": meta == null ? null : meta.toJson(),
        "name": name == null ? null : name,
        "names": names == null ? null : List<dynamic>.from(names.map((x) => x.toJson())),
        "past_values": pastValues == null ? null : List<dynamic>.from(pastValues.map((x) => x)),
        "power": power == null ? null : power,
        "pp": pp == null ? null : pp,
        "priority": priority == null ? null : priority,
        "stat_changes": statChanges == null ? null : List<dynamic>.from(statChanges.map((x) => x)),
        "super_contest_effect": superContestEffect == null ? null : superContestEffect.toJson(),
        "target": target == null ? null : target.toJson(),
        "type": type == null ? null : type.toJson(),
    };
}

class ContestEffect {
    String url;

    ContestEffect({
        this.url,
    });

    factory ContestEffect.fromJson(Map<String, dynamic> json) => ContestEffect(
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "url": url == null ? null : url,
    };
}

class ContestType {
    String name;
    String url;

    ContestType({
        this.name,
        this.url,
    });

    factory ContestType.fromJson(Map<String, dynamic> json) => ContestType(
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
    ContestType language;
    String shortEffect;

    EffectEntry({
        this.effect,
        this.language,
        this.shortEffect,
    });

    factory EffectEntry.fromJson(Map<String, dynamic> json) => EffectEntry(
        effect: json["effect"] == null ? null : json["effect"],
        language: json["language"] == null ? null : ContestType.fromJson(json["language"]),
        shortEffect: json["short_effect"] == null ? null : json["short_effect"],
    );

    Map<String, dynamic> toJson() => {
        "effect": effect == null ? null : effect,
        "language": language == null ? null : language.toJson(),
        "short_effect": shortEffect == null ? null : shortEffect,
    };
}

class FlavorTextEntry {
    String flavorText;
    ContestType language;
    ContestType versionGroup;

    FlavorTextEntry({
        this.flavorText,
        this.language,
        this.versionGroup,
    });

    factory FlavorTextEntry.fromJson(Map<String, dynamic> json) => FlavorTextEntry(
        flavorText: json["flavor_text"] == null ? null : json["flavor_text"],
        language: json["language"] == null ? null : ContestType.fromJson(json["language"]),
        versionGroup: json["version_group"] == null ? null : ContestType.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "flavor_text": flavorText == null ? null : flavorText,
        "language": language == null ? null : language.toJson(),
        "version_group": versionGroup == null ? null : versionGroup.toJson(),
    };
}

class Machine {
    ContestEffect machine;
    ContestType versionGroup;

    Machine({
        this.machine,
        this.versionGroup,
    });

    factory Machine.fromJson(Map<String, dynamic> json) => Machine(
        machine: json["machine"] == null ? null : ContestEffect.fromJson(json["machine"]),
        versionGroup: json["version_group"] == null ? null : ContestType.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "machine": machine == null ? null : machine.toJson(),
        "version_group": versionGroup == null ? null : versionGroup.toJson(),
    };
}

class Meta {
    ContestType ailment;
    int ailmentChance;
    ContestType category;
    int critRate;
    int drain;
    int flinchChance;
    int healing;
    dynamic maxHits;
    dynamic maxTurns;
    dynamic minHits;
    dynamic minTurns;
    int statChance;

    Meta({
        this.ailment,
        this.ailmentChance,
        this.category,
        this.critRate,
        this.drain,
        this.flinchChance,
        this.healing,
        this.maxHits,
        this.maxTurns,
        this.minHits,
        this.minTurns,
        this.statChance,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        ailment: json["ailment"] == null ? null : ContestType.fromJson(json["ailment"]),
        ailmentChance: json["ailment_chance"] == null ? null : json["ailment_chance"],
        category: json["category"] == null ? null : ContestType.fromJson(json["category"]),
        critRate: json["crit_rate"] == null ? null : json["crit_rate"],
        drain: json["drain"] == null ? null : json["drain"],
        flinchChance: json["flinch_chance"] == null ? null : json["flinch_chance"],
        healing: json["healing"] == null ? null : json["healing"],
        maxHits: json["max_hits"],
        maxTurns: json["max_turns"],
        minHits: json["min_hits"],
        minTurns: json["min_turns"],
        statChance: json["stat_chance"] == null ? null : json["stat_chance"],
    );

    Map<String, dynamic> toJson() => {
        "ailment": ailment == null ? null : ailment.toJson(),
        "ailment_chance": ailmentChance == null ? null : ailmentChance,
        "category": category == null ? null : category.toJson(),
        "crit_rate": critRate == null ? null : critRate,
        "drain": drain == null ? null : drain,
        "flinch_chance": flinchChance == null ? null : flinchChance,
        "healing": healing == null ? null : healing,
        "max_hits": maxHits,
        "max_turns": maxTurns,
        "min_hits": minHits,
        "min_turns": minTurns,
        "stat_chance": statChance == null ? null : statChance,
    };
}

class Name {
    ContestType language;
    String name;

    Name({
        this.language,
        this.name,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: json["language"] == null ? null : ContestType.fromJson(json["language"]),
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language == null ? null : language.toJson(),
        "name": name == null ? null : name,
    };
}
