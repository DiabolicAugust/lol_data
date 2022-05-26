class ChampionMastery {
  int? championId;
  int? championLevel;
  int? championPoints;
  int? lastPlayTime;
  int? championPointsSinceLastLevel;
  int? championPointsUntilNextLevel;
  bool? chestGranted;
  int? tokensEarned;
  String? summonerId;

  ChampionMastery(
      {this.championId,
        this.championLevel,
        this.championPoints,
        this.lastPlayTime,
        this.championPointsSinceLastLevel,
        this.championPointsUntilNextLevel,
        this.chestGranted,
        this.tokensEarned,
        this.summonerId});

  ChampionMastery.fromJson(Map<String, dynamic> json) {
    championId = json['championId'];
    championLevel = json['championLevel'];
    championPoints = json['championPoints'];
    lastPlayTime = json['lastPlayTime'];
    championPointsSinceLastLevel = json['championPointsSinceLastLevel'];
    championPointsUntilNextLevel = json['championPointsUntilNextLevel'];
    chestGranted = json['chestGranted'];
    tokensEarned = json['tokensEarned'];
    summonerId = json['summonerId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['championId'] = this.championId;
    data['championLevel'] = this.championLevel;
    data['championPoints'] = this.championPoints;
    data['lastPlayTime'] = this.lastPlayTime;
    data['championPointsSinceLastLevel'] = this.championPointsSinceLastLevel;
    data['championPointsUntilNextLevel'] = this.championPointsUntilNextLevel;
    data['chestGranted'] = this.chestGranted;
    data['tokensEarned'] = this.tokensEarned;
    data['summonerId'] = this.summonerId;
    return data;
  }
}