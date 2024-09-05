class InfoFootballModel {
  List<Teams>? teams;

  InfoFootballModel({this.teams});

  InfoFootballModel.fromJson(Map<String, dynamic> json) {
    if (json['teams'] != null) {
      teams = <Teams>[];
      json['teams'].forEach((v) {
        teams!.add(new Teams.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teams != null) {
      data['teams'] = this.teams!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Teams {
  String? idTeam;
  String? idSoccerXML;
  String? idAPIfootball;
  String? intLoved;
  String? strTeam;
  String? strTeamAlternate;
  String? strTeamShort;
  String? intFormedYear;
  String? strSport;
  String? strLeague;
  String? idLeague;
  String? strLeague2;
  String? idLeague2;
  String? strLeague3;
  String? idLeague3;
  String? strLeague4;
  String? idLeague4;
  String? strLeague5;
  String? idLeague5;
  String? strLeague6;
  String? idLeague6;
  String? strLeague7;
  String? idLeague7;
  Null? strDivision;
  String? idVenue;
  String? strStadium;
  String? strKeywords;
  String? strRSS;
  String? strLocation;
  String? intStadiumCapacity;
  String? strWebsite;
  String? strFacebook;
  String? strTwitter;
  String? strInstagram;
  String? strDescriptionEN;
  String? strDescriptionDE;
  String? strDescriptionFR;
  Null? strDescriptionCN;
  String? strDescriptionIT;
  String? strDescriptionJP;
  String? strDescriptionRU;
  String? strDescriptionES;
  String? strDescriptionPT;
  Null? strDescriptionSE;
  Null? strDescriptionNL;
  Null? strDescriptionHU;
  String? strDescriptionNO;
  Null? strDescriptionIL;
  Null? strDescriptionPL;
  String? strColour1;
  String? strColour2;
  String? strColour3;
  String? strGender;
  String? strCountry;
  String? strBadge;
  String? strLogo;
  String? strFanart1;
  String? strFanart2;
  String? strFanart3;
  String? strFanart4;
  String? strBanner;
  String? strEquipment;
  String? strYoutube;
  String? strLocked;

  Teams(
      {this.idTeam,
        this.idSoccerXML,
        this.idAPIfootball,
        this.intLoved,
        this.strTeam,
        this.strTeamAlternate,
        this.strTeamShort,
        this.intFormedYear,
        this.strSport,
        this.strLeague,
        this.idLeague,
        this.strLeague2,
        this.idLeague2,
        this.strLeague3,
        this.idLeague3,
        this.strLeague4,
        this.idLeague4,
        this.strLeague5,
        this.idLeague5,
        this.strLeague6,
        this.idLeague6,
        this.strLeague7,
        this.idLeague7,
        this.strDivision,
        this.idVenue,
        this.strStadium,
        this.strKeywords,
        this.strRSS,
        this.strLocation,
        this.intStadiumCapacity,
        this.strWebsite,
        this.strFacebook,
        this.strTwitter,
        this.strInstagram,
        this.strDescriptionEN,
        this.strDescriptionDE,
        this.strDescriptionFR,
        this.strDescriptionCN,
        this.strDescriptionIT,
        this.strDescriptionJP,
        this.strDescriptionRU,
        this.strDescriptionES,
        this.strDescriptionPT,
        this.strDescriptionSE,
        this.strDescriptionNL,
        this.strDescriptionHU,
        this.strDescriptionNO,
        this.strDescriptionIL,
        this.strDescriptionPL,
        this.strColour1,
        this.strColour2,
        this.strColour3,
        this.strGender,
        this.strCountry,
        this.strBadge,
        this.strLogo,
        this.strFanart1,
        this.strFanart2,
        this.strFanart3,
        this.strFanart4,
        this.strBanner,
        this.strEquipment,
        this.strYoutube,
        this.strLocked});

  Teams.fromJson(Map<String, dynamic> json) {
    idTeam = json['idTeam'];
    idSoccerXML = json['idSoccerXML'];
    idAPIfootball = json['idAPIfootball'];
    intLoved = json['intLoved'];
    strTeam = json['strTeam'];
    strTeamAlternate = json['strTeamAlternate'];
    strTeamShort = json['strTeamShort'];
    intFormedYear = json['intFormedYear'];
    strSport = json['strSport'];
    strLeague = json['strLeague'];
    idLeague = json['idLeague'];
    strLeague2 = json['strLeague2'];
    idLeague2 = json['idLeague2'];
    strLeague3 = json['strLeague3'];
    idLeague3 = json['idLeague3'];
    strLeague4 = json['strLeague4'];
    idLeague4 = json['idLeague4'];
    strLeague5 = json['strLeague5'];
    idLeague5 = json['idLeague5'];
    strLeague6 = json['strLeague6'];
    idLeague6 = json['idLeague6'];
    strLeague7 = json['strLeague7'];
    idLeague7 = json['idLeague7'];
    strDivision = json['strDivision'];
    idVenue = json['idVenue'];
    strStadium = json['strStadium'];
    strKeywords = json['strKeywords'];
    strRSS = json['strRSS'];
    strLocation = json['strLocation'];
    intStadiumCapacity = json['intStadiumCapacity'];
    strWebsite = json['strWebsite'];
    strFacebook = json['strFacebook'];
    strTwitter = json['strTwitter'];
    strInstagram = json['strInstagram'];
    strDescriptionEN = json['strDescriptionEN'];
    strDescriptionDE = json['strDescriptionDE'];
    strDescriptionFR = json['strDescriptionFR'];
    strDescriptionCN = json['strDescriptionCN'];
    strDescriptionIT = json['strDescriptionIT'];
    strDescriptionJP = json['strDescriptionJP'];
    strDescriptionRU = json['strDescriptionRU'];
    strDescriptionES = json['strDescriptionES'];
    strDescriptionPT = json['strDescriptionPT'];
    strDescriptionSE = json['strDescriptionSE'];
    strDescriptionNL = json['strDescriptionNL'];
    strDescriptionHU = json['strDescriptionHU'];
    strDescriptionNO = json['strDescriptionNO'];
    strDescriptionIL = json['strDescriptionIL'];
    strDescriptionPL = json['strDescriptionPL'];
    strColour1 = json['strColour1'];
    strColour2 = json['strColour2'];
    strColour3 = json['strColour3'];
    strGender = json['strGender'];
    strCountry = json['strCountry'];
    strBadge = json['strBadge'];
    strLogo = json['strLogo'];
    strFanart1 = json['strFanart1'];
    strFanart2 = json['strFanart2'];
    strFanart3 = json['strFanart3'];
    strFanart4 = json['strFanart4'];
    strBanner = json['strBanner'];
    strEquipment = json['strEquipment'];
    strYoutube = json['strYoutube'];
    strLocked = json['strLocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idTeam'] = this.idTeam;
    data['idSoccerXML'] = this.idSoccerXML;
    data['idAPIfootball'] = this.idAPIfootball;
    data['intLoved'] = this.intLoved;
    data['strTeam'] = this.strTeam;
    data['strTeamAlternate'] = this.strTeamAlternate;
    data['strTeamShort'] = this.strTeamShort;
    data['intFormedYear'] = this.intFormedYear;
    data['strSport'] = this.strSport;
    data['strLeague'] = this.strLeague;
    data['idLeague'] = this.idLeague;
    data['strLeague2'] = this.strLeague2;
    data['idLeague2'] = this.idLeague2;
    data['strLeague3'] = this.strLeague3;
    data['idLeague3'] = this.idLeague3;
    data['strLeague4'] = this.strLeague4;
    data['idLeague4'] = this.idLeague4;
    data['strLeague5'] = this.strLeague5;
    data['idLeague5'] = this.idLeague5;
    data['strLeague6'] = this.strLeague6;
    data['idLeague6'] = this.idLeague6;
    data['strLeague7'] = this.strLeague7;
    data['idLeague7'] = this.idLeague7;
    data['strDivision'] = this.strDivision;
    data['idVenue'] = this.idVenue;
    data['strStadium'] = this.strStadium;
    data['strKeywords'] = this.strKeywords;
    data['strRSS'] = this.strRSS;
    data['strLocation'] = this.strLocation;
    data['intStadiumCapacity'] = this.intStadiumCapacity;
    data['strWebsite'] = this.strWebsite;
    data['strFacebook'] = this.strFacebook;
    data['strTwitter'] = this.strTwitter;
    data['strInstagram'] = this.strInstagram;
    data['strDescriptionEN'] = this.strDescriptionEN;
    data['strDescriptionDE'] = this.strDescriptionDE;
    data['strDescriptionFR'] = this.strDescriptionFR;
    data['strDescriptionCN'] = this.strDescriptionCN;
    data['strDescriptionIT'] = this.strDescriptionIT;
    data['strDescriptionJP'] = this.strDescriptionJP;
    data['strDescriptionRU'] = this.strDescriptionRU;
    data['strDescriptionES'] = this.strDescriptionES;
    data['strDescriptionPT'] = this.strDescriptionPT;
    data['strDescriptionSE'] = this.strDescriptionSE;
    data['strDescriptionNL'] = this.strDescriptionNL;
    data['strDescriptionHU'] = this.strDescriptionHU;
    data['strDescriptionNO'] = this.strDescriptionNO;
    data['strDescriptionIL'] = this.strDescriptionIL;
    data['strDescriptionPL'] = this.strDescriptionPL;
    data['strColour1'] = this.strColour1;
    data['strColour2'] = this.strColour2;
    data['strColour3'] = this.strColour3;
    data['strGender'] = this.strGender;
    data['strCountry'] = this.strCountry;
    data['strBadge'] = this.strBadge;
    data['strLogo'] = this.strLogo;
    data['strFanart1'] = this.strFanart1;
    data['strFanart2'] = this.strFanart2;
    data['strFanart3'] = this.strFanart3;
    data['strFanart4'] = this.strFanart4;
    data['strBanner'] = this.strBanner;
    data['strEquipment'] = this.strEquipment;
    data['strYoutube'] = this.strYoutube;
    data['strLocked'] = this.strLocked;
    return data;
  }
}
