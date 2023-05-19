import 'dart:convert';
import 'package:psmna10/models/valorant_model.dart';
import 'package:http/http.dart' as http;

class ApiValorant{
  String link='https://valorant-api.com/v1';

  Future<List<ValorantModel>?> getAllAgents() async{
    var result = await http.get(Uri.parse('$link/agents?isPlayableCharacter=true&language=es-MX'));
    //var listJSON = jsonDecode(result.body)['data'] as List;

    if(result.statusCode == 200){
      final jsonResponse = jsonDecode(result.body);
      //return listJSON.map((popular) => ValorantModel.fromMap(popular)).toList();
      return List<ValorantModel>.from(jsonResponse['data'].map((json) => ValorantModel.fromJson(json)));
    }
    return null;
  }
  Future<String> getIdAgent(String uuid_agent) async {
    Uri auxAgent = Uri.parse('https://valorant-api.com/v1/agents/' +
        uuid_agent);
    var result = await http.get(auxAgent);
    var listJSON = jsonDecode(result.body)['data'] as List;
    if (result.statusCode == 200) {
      print(listJSON[0]['key']);
      return listJSON[0]['key'];
    }
    return '';
  }
}