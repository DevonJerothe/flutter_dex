// To parse this JSON data, do
//
//     final version = versionFromJson(jsonString);
//
// API call
//
//     https://pokeapi.co/api/v2/version/${id}/

import 'dart:convert';

Version versionFromJson(String str) => Version.fromJson(json.decode(str));

String versionToJson(Version data) => json.encode(data.toJson());

class Version {
    int id;
    String name;
    List<Name> names;
    VersionGroup versionGroup;

    Version({
        this.id,
        this.name,
        this.names,
        this.versionGroup,
    });

    factory Version.fromJson(Map<String, dynamic> json) => Version(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        names: json["names"] == null ? null : List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        versionGroup: json["version_group"] == null ? null : VersionGroup.fromJson(json["version_group"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "names": names == null ? null : List<dynamic>.from(names.map((x) => x.toJson())),
        "version_group": versionGroup == null ? null : versionGroup.toJson(),
    };
}

class Name {
    VersionGroup language;
    String name;

    Name({
        this.language,
        this.name,
    });

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: json["language"] == null ? null : VersionGroup.fromJson(json["language"]),
        name: json["name"] == null ? null : json["name"],
    );

    Map<String, dynamic> toJson() => {
        "language": language == null ? null : language.toJson(),
        "name": name == null ? null : name,
    };
}

class VersionGroup {
    String name;
    String url;

    VersionGroup({
        this.name,
        this.url,
    });

    factory VersionGroup.fromJson(Map<String, dynamic> json) => VersionGroup(
        name: json["name"] == null ? null : json["name"],
        url: json["url"] == null ? null : json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "url": url == null ? null : url,
    };
}
