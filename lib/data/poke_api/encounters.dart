// To parse this JSON data, do
//
//     final encounters = encountersFromJson(jsonString);
//
// API call
//
//     https://pokeapi.co/api/v2/pokemon/${id}/encounters

import 'dart:convert';

List<Encounters> encountersFromJson(String str) => List<Encounters>.from(json.decode(str).map((x) => Encounters.fromJson(x)));

String encountersToJson(List<Encounters> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Encounters {
    LocationArea locationArea;
    List<VersionDetail> versionDetails;

    Encounters({
        this.locationArea,
        this.versionDetails,
    });

    factory Encounters.fromJson(Map<String, dynamic> json) => Encounters(
        locationArea: json["location_area"] == null ? null : LocationArea.fromJson(json["location_area"]),
        versionDetails: json["version_details"] == null ? null : List<VersionDetail>.from(json["version_details"].map((x) => VersionDetail.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "location_area": locationArea == null ? null : locationArea.toJson(),
        "version_details": versionDetails == null ? null : List<dynamic>.from(versionDetails.map((x) => x.toJson())),
    };
}

class LocationArea {
    String name;
    String url;

    LocationArea({
        this.name,
        this.url,
    });

    factory LocationArea.fromJson(Map<String, dynamic> json) => LocationArea(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
    };
}

class VersionDetail {
    List<EncounterDetail> encounterDetails;
    int maxChance;
    LocationArea version;

    VersionDetail({
        this.encounterDetails,
        this.maxChance,
        this.version,
    });

    factory VersionDetail.fromJson(Map<String, dynamic> json) => VersionDetail(
        encounterDetails: json["encounter_details"] == null ? null : List<EncounterDetail>.from(json["encounter_details"].map((x) => EncounterDetail.fromJson(x))),
        maxChance: json["max_chance"] == null ? null : json["max_chance"],
        version: json["version"] == null ? null : LocationArea.fromJson(json["version"]),
    );

    Map<String, dynamic> toJson() => {
        "encounter_details": encounterDetails == null ? null : List<dynamic>.from(encounterDetails.map((x) => x.toJson())),
        "max_chance": maxChance == null ? null : maxChance,
        "version": version == null ? null : version.toJson(),
    };
}

class EncounterDetail {
    int chance;
    List<LocationArea> conditionValues;
    int maxLevel;
    LocationArea method;
    int minLevel;

    EncounterDetail({
        this.chance,
        this.conditionValues,
        this.maxLevel,
        this.method,
        this.minLevel,
    });

    factory EncounterDetail.fromJson(Map<String, dynamic> json) => EncounterDetail(
        chance: json["chance"] == null ? null : json["chance"],
        conditionValues: json["condition_values"] == null ? null : List<LocationArea>.from(json["condition_values"].map((x) => LocationArea.fromJson(x))),
        maxLevel: json["max_level"] == null ? null : json["max_level"],
        method: json["method"] == null ? null : LocationArea.fromJson(json["method"]),
        minLevel: json["min_level"] == null ? null : json["min_level"],
    );

    Map<String, dynamic> toJson() => {
        "chance": chance == null ? null : chance,
        "condition_values": conditionValues == null ? null : List<dynamic>.from(conditionValues.map((x) => x.toJson())),
        "max_level": maxLevel == null ? null : maxLevel,
        "method": method == null ? null : method.toJson(),
        "min_level": minLevel == null ? null : minLevel,
    };
}
