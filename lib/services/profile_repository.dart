import 'dart:convert';

import 'package:http/http.dart';
import 'package:lol_data/models/champion_mastery.dart';
import 'package:lol_data/models/summoner.dart';
import 'package:http/http.dart' as http;

class ProfileRepository {
  String server;
  final String api = 'RGAPI-41363057-4539-4a78-8ee4-5c4cd52538f8';
  final String summonerName = 'CutieMorgan';

  ProfileRepository(
    this.server,
  ) {
    server = server.toLowerCase();
  }

  Future<List<ChampionMastery>> getChampionMastery(String encryptedId) async {
    List<ChampionMastery> championMastery = [];

    Response response = await http.get(
      Uri.parse(
        'https://euw1.api.riotgames.com/lol/champion-mastery/v4/champion-masteries/by-summoner/$encryptedId?api_key=$api',
      ),
    );
    dynamic json = jsonDecode(response.body);

    for (var champ in json) {
      championMastery.add(ChampionMastery.fromJson(champ));
    }
    return championMastery;
  }

  Future<Summoner> getSummonerInfo() async {
    String url =
        'https://$server.api.riotgames.com/lol/summoner/v4/summoners/by-name/$summonerName?api_key=$api';
    Response response = await http.get(
      Uri.parse(
        url,
      ),
    );
    return Summoner.fromJson(
      jsonDecode(response.body),
    );
  }

  Future<String> getSummonerIcon(String id) async {
    String version = await getIconsStorageVersion();
    final String uri =
        'https://ddragon.leagueoflegends.com/cdn/$version/img/profileicon/$id.png';
    return uri;
  }

  Future<String> getIconsStorageVersion() async {
    Response response = await http.get(
        Uri.parse('https://ddragon.leagueoflegends.com/api/versions.json'));
    return jsonDecode(response.body)[0];
  }
}
