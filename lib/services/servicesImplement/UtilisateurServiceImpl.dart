
import 'dart:convert';

import 'package:cantineop/models/Utilisateurs.dart';
import 'package:cantineop/services/UtilisateurService.dart';
import 'package:http/http.dart' as http;

class UtilisateurServiceImpl implements UtilisateurService {

  String dataURL="http://10.100.5.102:8080/api/utilisateurss";

  @override
  Future<String> createUtilisateurs(Utilisateurs utilisateurs)  async {
    // TODO: implement createUtilisateurs
    var url =Uri.parse('$dataURL');
    var response =await http.post(url,body: jsonEncode(utilisateurs.toJson()),headers: {
      'Content-Type': 'application/json;charset=utf-8',
    }, );
    var body = response.body;
    return body;
  }

  @override
  Future<String> deletedUtilisateurs(int id) async {
    // TODO: implement deletedUtilisateurs
    var url =Uri.parse('$dataURL/$id');
    var response =await http.delete(url);
    return response.body;
  }

  @override
  Future<List<Utilisateurs>> getAllUtilisateursList() async {
    // TODO: implement getAllUtilisateursList
    List<Utilisateurs> utilisateursList=[];
    var url =Uri.parse('$dataURL');
    var response =await http.get(url);
    //  print("la list ok");
    var body = json.decode(response.body);
    for( var i=0; i<body.length;i++){
      utilisateursList.add(Utilisateurs.fromJson(body[i]));
    }
    return utilisateursList;
  }

  @override
  Future<Utilisateurs> getOneUtilisateurs(int utilisateursId) async {
    // TODO: implement getOneUtilisateurs
    Utilisateurs utilisateurs;
    var url =Uri.parse('$dataURL/$utilisateursId');
    var response =await http.get(url);
    utilisateurs=Utilisateurs.fromJson(jsonDecode(response.body));
    return utilisateurs;  }

  @override
  Future<String> updateUtilisateurs(Utilisateurs utilisateurs) async {
    // TODO: implement updateUtilisateurs
    var url =Uri.parse('$dataURL/${utilisateurs.id }');
    var response =await http.put(url,body: jsonEncode(utilisateurs.toJson()),headers: {
      'Content-Type': 'application/json;charset=utf-8',
    }, );
    var body = response.body;
    return body;
  }
  
}