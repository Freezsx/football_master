class InfoEventModel {
  List<Event>? event;

  InfoEventModel({this.event});

  factory InfoEventModel.fromJson(Map<String, dynamic> json) {
    return InfoEventModel(
      event: json['event'] != null
          ? List<Event>.from(json['event'].map((v) => Event.fromJson(v)))
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (event != null) {
      data['event'] = event!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Event {
  String? idEvent;
  String? idSoccerXML;
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
  String? intSpectators;
  String? strOfficial;
  String? strTimestamp;
  String? dateEvent;
  String? dateEventLocal;
  String? strTime;
  String? strTimeLocal;
  String? strGroup;
  String? idHomeTeam;
  String? strHomeTeamBadge;
  String? idAwayTeam;
  String? strAwayTeamBadge;
  String? intScore;
  String? intScoreVotes;
  String? strResult;
  String? idVenue;
  String? strVenue;
  String? strCountry;
  String? strCity;
  String? strPoster;
  String? strSquare;
  String? strFanart;
  String? strThumb;
  String? strBanner;
  String? strMap;
  String? strTweet1;
  String? strTweet2;
  String? strTweet3;
  String? strVideo;
  String? strStatus;
  String? strPostponed;
  String? strLocked;

  Event({
    this.idEvent,
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
    this.strLocked,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      idEvent: json['idEvent'] as String?,
      idSoccerXML: json['idSoccerXML'] as String?,
      idAPIfootball: json['idAPIfootball'] as String?,
      strEvent: json['strEvent'] as String?,
      strEventAlternate: json['strEventAlternate'] as String?,
      strFilename: json['strFilename'] as String?,
      strSport: json['strSport'] as String?,
      idLeague: json['idLeague'] as String?,
      strLeague: json['strLeague'] as String?,
      strLeagueBadge: json['strLeagueBadge'] as String?,
      strSeason: json['strSeason'] as String?,
      strDescriptionEN: json['strDescriptionEN'] as String?,
      strHomeTeam: json['strHomeTeam'] as String?,
      strAwayTeam: json['strAwayTeam'] as String?,
      intHomeScore: json['intHomeScore'] as String?,
      intRound: json['intRound'] as String?,
      intAwayScore: json['intAwayScore'] as String?,
      intSpectators: json['intSpectators'] as String?,
      strOfficial: json['strOfficial'] as String?,
      strTimestamp: json['strTimestamp'] as String?,
      dateEvent: json['dateEvent'] as String?,
      dateEventLocal: json['dateEventLocal'] as String?,
      strTime: json['strTime'] as String?,
      strTimeLocal: json['strTimeLocal'] as String?,
      strGroup: json['strGroup'] as String?,
      idHomeTeam: json['idHomeTeam'] as String?,
      strHomeTeamBadge: json['strHomeTeamBadge'] as String?,
      idAwayTeam: json['idAwayTeam'] as String?,
      strAwayTeamBadge: json['strAwayTeamBadge'] as String?,
      intScore: json['intScore'] as String?,
      intScoreVotes: json['intScoreVotes'] as String?,
      strResult: json['strResult'] as String?,
      idVenue: json['idVenue'] as String?,
      strVenue: json['strVenue'] as String?,
      strCountry: json['strCountry'] as String?,
      strCity: json['strCity'] as String?,
      strPoster: json['strPoster'] as String?,
      strSquare: json['strSquare'] as String?,
      strFanart: json['strFanart'] as String?,
      strThumb: json['strThumb'] as String?,
      strBanner: json['strBanner'] as String?,
      strMap: json['strMap'] as String?,
      strTweet1: json['strTweet1'] as String?,
      strTweet2: json['strTweet2'] as String?,
      strTweet3: json['strTweet3'] as String?,
      strVideo: json['strVideo'] as String?,
      strStatus: json['strStatus'] as String?,
      strPostponed: json['strPostponed'] as String?,
      strLocked: json['strLocked'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idEvent'] = idEvent;
    data['idSoccerXML'] = idSoccerXML;
    data['idAPIfootball'] = idAPIfootball;
    data['strEvent'] = strEvent;
    data['strEventAlternate'] = strEventAlternate;
    data['strFilename'] = strFilename;
    data['strSport'] = strSport;
    data['idLeague'] = idLeague;
    data['strLeague'] = strLeague;
    data['strLeagueBadge'] = strLeagueBadge;
    data['strSeason'] = strSeason;
    data['strDescriptionEN'] = strDescriptionEN;
    data['strHomeTeam'] = strHomeTeam;
    data['strAwayTeam'] = strAwayTeam;
    data['intHomeScore'] = intHomeScore;
    data['intRound'] = intRound;
    data['intAwayScore'] = intAwayScore;
    data['intSpectators'] = intSpectators;
    data['strOfficial'] = strOfficial;
    data['strTimestamp'] = strTimestamp;
    data['dateEvent'] = dateEvent;
    data['dateEventLocal'] = dateEventLocal;
    data['strTime'] = strTime;
    data['strTimeLocal'] = strTimeLocal;
    data['strGroup'] = strGroup;
    data['idHomeTeam'] = idHomeTeam;
    data['strHomeTeamBadge'] = strHomeTeamBadge;
    data['idAwayTeam'] = idAwayTeam;
    data['strAwayTeamBadge'] = strAwayTeamBadge;
    data['intScore'] = intScore;
    data['intScoreVotes'] = intScoreVotes;
    data['strResult'] = strResult;
    data['idVenue'] = idVenue;
    data['strVenue'] = strVenue;
    data['strCountry'] = strCountry;
    data['strCity'] = strCity;
    data['strPoster'] = strPoster;
    data['strSquare'] = strSquare;
    data['strFanart'] = strFanart;
    data['strThumb'] = strThumb;
    data['strBanner'] = strBanner;
    data['strMap'] = strMap;
    data['strTweet1'] = strTweet1;
    data['strTweet2'] = strTweet2;
    data['strTweet3'] = strTweet3;
    data['strVideo'] = strVideo;
    data['strStatus'] = strStatus;
    data['strPostponed'] = strPostponed;
    data['strLocked'] = strLocked;
    return data;
  }
}
