import 'dart:convert';
import 'package:psmna10/models/valorant_model.dart';
import 'package:http/http.dart' as https;

class ApiValorant{
  Uri link=Uri.parse('https://valorant-api.com/v1/agents?language=es-MX&isPlayableCharacter=true');

  Future<List<ValorantModel>?> getAllAgents() async{
    var result = await https.get(link);
    var listJSON = jsonDecode(result.body)['data'] as List;
    if(result.statusCode == 200){
      return listJSON.map((popular) => ValorantModel.fromMap(popular)).toList();
    }
    return null;
  }
}