// To parse this JSON data, do
//
//     final infoLeagueModel = infoLeagueModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

InfoLeagueModel infoLeagueModelFromJson(String str) => InfoLeagueModel.fromJson(json.decode(str));

String infoLeagueModelToJson(InfoLeagueModel data) => json.encode(data.toJson());

class InfoLeagueModel {
  List<League> leagues;

  InfoLeagueModel({
    required this.leagues,
  });

  factory InfoLeagueModel.fromJson(Map<String, dynamic> json) => InfoLeagueModel(
    leagues: List<League>.from(json["leagues"].map((x) => League.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "leagues": List<dynamic>.from(leagues.map((x) => x.toJson())),
  };
}

class League {
  String idLeague;
  String strLeague;
  String strSport;
  String strLeagueAlternate;

  League({
    required this.idLeague,
    required this.strLeague,
    required this.strSport,
    required this.strLeagueAlternate,
  });

  factory League.fromJson(Map<String, dynamic> json) => League(
    idLeague: json["idLeague"],
    strLeague: json["strLeague"],
    strSport: json["strSport"],
    strLeagueAlternate: json["strLeagueAlternate"],
  );

  Map<String, dynamic> toJson() => {
    "idLeague": idLeague,
    "strLeague": strLeague,
    "strSport": strLeague,
    "strLeagueAlternate": strLeagueAlternate,
  };
}

enum StrSport {
  AMERICAN_FOOTBALL,
  BASKETBALL,
  ICE_HOCKEY,
  MOTORSPORT,
  SOCCER
}

final strSportValues = EnumValues({
  "American Football": StrSport.AMERICAN_FOOTBALL,
  "Basketball": StrSport.BASKETBALL,
  "Ice Hockey": StrSport.ICE_HOCKEY,
  "Motorsport": StrSport.MOTORSPORT,
  "Soccer": StrSport.SOCCER
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
