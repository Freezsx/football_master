class InfoEventModel {
  List<Event>? event;

  InfoEventModel({this.event});

  InfoEventModel.fromJson(Map<String, dynamic> json) {
    if (json['event'] != null) {
      event = <Event>[];
      json['event'].forEach((v) {
        event!.add(new Event.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.event != null) {
      data['event'] = this.event!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Event {
  String? idEvent;
  Null? idSoccerXML;
  String? idAPIfootball;
  String? strEvent;
  String? strEventAlternate;
  String? strFilename;
  String? strSport;
  String? idLeague;
  String? strLeague;
  String? strLeagueBadge;
  String? strSeason;
  String? strDescriptionEN;
  String? strHomeTeam;
  String? strAwayTeam;
  String? intHomeScore;
  String? intRound;
  String? intAwayScore;
  Null? intSpectators;
  String? strOfficial;
  String? strTimestamp;
  String? dateEvent;
  String? dateEventLocal;
  String? strTime;
  String? strTimeLocal;
  Null? strGroup;
  String? idHomeTeam;
  String? strHomeTeamBadge;
  String? idAwayTeam;
  String? strAwayTeamBadge;
  Null? intScore;
  Null? intScoreVotes;
  String? strResult;
  Null? idVenue;
  String? strVenue;
  String? strCountry;
  String? strCity;
  String? strPoster;
  String? strSquare;
  Null? strFanart;
  String? strThumb;
  String? strBanner;
  Null? strMap;
  String? strTweet1;
  String? strTweet2;
  String? strTweet3;
  String? strVideo;
  String? strStatus;
  String? strPostponed;
  String? strLocked;

  Event(
      {this.idEvent,
        this.idSoccerXML,
        this.idAPIfootball,
        this.strEvent,
        this.strEventAlternate,
        this.strFilename,
        this.strSport,
        this.idLeague,
        this.strLeague,
        this.strLeagueBadge,
        this.strSeason,
        this.strDescriptionEN,
        this.strHomeTeam,
        this.strAwayTeam,
        this.intHomeScore,
        this.intRound,
        this.intAwayScore,
        this.intSpectators,
        this.strOfficial,
        this.strTimestamp,
        this.dateEvent,
        this.dateEventLocal,
        this.strTime,
        this.strTimeLocal,
        this.strGroup,
        this.idHomeTeam,
        this.strHomeTeamBadge,
        this.idAwayTeam,
        this.strAwayTeamBadge,
        this.intScore,
        this.intScoreVotes,
        this.strResult,
        this.idVenue,
        this.strVenue,
        this.strCountry,
        this.strCity,
        this.strPoster,
        this.strSquare,
        this.strFanart,
        this.strThumb,
        this.strBanner,
        this.strMap,
        this.strTweet1,
        this.strTweet2,
        this.strTweet3,
        this.strVideo,
        this.strStatus,
        this.strPostponed,
        this.strLocked});

  Event.fromJson(Map<String, dynamic> json) {
    idEvent = json['idEvent'];
    idSoccerXML = json['idSoccerXML'];
    idAPIfootball = json['idAPIfootball'];
    strEvent = json['strEvent'];
    strEventAlternate = json['strEventAlternate'];
    strFilename = json['strFilename'];
    strSport = json['strSport'];
    idLeague = json['idLeague'];
    strLeague = json['strLeague'];
    strLeagueBadge = json['strLeagueBadge'];
    strSeason = json['strSeason'];
    strDescriptionEN = json['strDescriptionEN'];
    strHomeTeam = json['strHomeTeam'];
    strAwayTeam = json['strAwayTeam'];
    intHomeScore = json['intHomeScore'];
    intRound = json['intRound'];
    intAwayScore = json['intAwayScore'];
    intSpectators = json['intSpectators'];
    strOfficial = json['strOfficial'];
    strTimestamp = json['strTimestamp'];
    dateEvent = json['dateEvent'];
    dateEventLocal = json['dateEventLocal'];
    strTime = json['strTime'];
    strTimeLocal = json['strTimeLocal'];
    strGroup = json['strGroup'];
    idHomeTeam = json['idHomeTeam'];
    strHomeTeamBadge = json['strHomeTeamBadge'];
    idAwayTeam = json['idAwayTeam'];
    strAwayTeamBadge = json['strAwayTeamBadge'];
    intScore = json['intScore'];
    intScoreVotes = json['intScoreVotes'];
    strResult = json['strResult'];
    idVenue = json['idVenue'];
    strVenue = json['strVenue'];
    strCountry = json['strCountry'];
    strCity = json['strCity'];
    strPoster = json['strPoster'];
    strSquare = json['strSquare'];
    strFanart = json['strFanart'];
    strThumb = json['strThumb'];
    strBanner = json['strBanner'];
    strMap = json['strMap'];
    strTweet1 = json['strTweet1'];
    strTweet2 = json['strTweet2'];
    strTweet3 = json['strTweet3'];
    strVideo = json['strVideo'];
    strStatus = json['strStatus'];
    strPostponed = json['strPostponed'];
    strLocked = json['strLocked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idEvent'] = this.idEvent;
    data['idSoccerXML'] = this.idSoccerXML;
    data['idAPIfootball'] = this.idAPIfootball;
    data['strEvent'] = this.strEvent;
    data['strEventAlternate'] = this.strEventAlternate;
    data['strFilename'] = this.strFilename;
    data['strSport'] = this.strSport;
    data['idLeague'] = this.idLeague;
    data['strLeague'] = this.strLeague;
    data['strLeagueBadge'] = this.strLeagueBadge;
    data['strSeason'] = this.strSeason;
    data['strDescriptionEN'] = this.strDescriptionEN;
    data['strHomeTeam'] = this.strHomeTeam;
    data['strAwayTeam'] = this.strAwayTeam;
    data['intHomeScore'] = this.intHomeScore;
    data['intRound'] = this.intRound;
    data['intAwayScore'] = this.intAwayScore;
    data['intSpectators'] = this.intSpectators;
    data['strOfficial'] = this.strOfficial;
    data['strTimestamp'] = this.strTimestamp;
    data['dateEvent'] = this.dateEvent;
    data['dateEventLocal'] = this.dateEventLocal;
    data['strTime'] = this.strTime;
    data['strTimeLocal'] = this.strTimeLocal;
    data['strGroup'] = this.strGroup;
    data['idHomeTeam'] = this.idHomeTeam;
    data['strHomeTeamBadge'] = this.strHomeTeamBadge;
    data['idAwayTeam'] = this.idAwayTeam;
    data['strAwayTeamBadge'] = this.strAwayTeamBadge;
    data['intScore'] = this.intScore;
    data['intScoreVotes'] = this.intScoreVotes;
    data['strResult'] = this.strResult;
    data['idVenue'] = this.idVenue;
    data['strVenue'] = this.strVenue;
    data['strCountry'] = this.strCountry;
    data['strCity'] = this.strCity;
    data['strPoster'] = this.strPoster;
    data['strSquare'] = this.strSquare;
    data['strFanart'] = this.strFanart;
    data['strThumb'] = this.strThumb;
    data['strBanner'] = this.strBanner;
    data['strMap'] = this.strMap;
    data['strTweet1'] = this.strTweet1;
    data['strTweet2'] = this.strTweet2;
    data['strTweet3'] = this.strTweet3;
    data['strVideo'] = this.strVideo;
    data['strStatus'] = this.strStatus;
    data['strPostponed'] = this.strPostponed;
    data['strLocked'] = this.strLocked;
    return data;
  }
}
