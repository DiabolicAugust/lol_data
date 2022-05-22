import 'dart:convert';

import 'package:http/http.dart';
import 'package:lol_data/models/summoner.dart';
import 'package:http/http.dart' as http;

class ProfileRepository{
   String server;
  final String api = 'RGAPI-d252e980-2711-47c4-8f96-efb1f43e87e8';
  ProfileRepository(this.server,){
    server = server.toLowerCase();
  }

Future<Summoner> getSummonerInfo(String summonerName)async{
    String url = 'https://$server.api.riotgames.com/lol/summoner/v4/summoners/by-name/$summonerName?api_key=$api';
    Response response = await http.get(Uri.parse(url,),);
    return Summoner.fromJson(jsonDecode(response.body),);
}

Future<String> getSummonerIcon(String id)async{
    String version = await getIconsStorageVersion();
    final String uri = 'https://ddragon.leagueoflegends.com/cdn/$version/img/profileicon/$id.png';
  return uri;
}

Future<String> getIconsStorageVersion() async{
    Response response = await http.get(Uri.parse('https://ddragon.leagueoflegends.com/api/versions.json'));
    return jsonDecode(response.body)[0];
}


}