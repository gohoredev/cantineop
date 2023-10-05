import 'dart:convert';
import 'package:cantineop/models/Commandes.dart';
import 'package:cantineop/services/CommandeService.dart';
import 'package:http/http.dart' as http;

class CommandeServiceImpl implements CommandesService{

  String dataURL="http://10.100.5.102:8080/api/commandess";

  @override
  Future<String> createCommandes(Commandes commandes) async{
    // TODO: implement createCommandes
    var url =Uri.parse('$dataURL');
    var response =await http.post(url,body: jsonEncode(commandes.toJson()),headers: {
      'Content-Type': 'application/json;charset=utf-8',
    }, );
    var body = response.body;
    return body;  }

  @override
  Future<String> deletedCommandes(int id) async {
    // TODO: implement deletedCommandes
    var url =Uri.parse('$dataURL/$id');
    var response =await http.delete(url);
    return response.body;  }

  @override
  Future<List<Commandes>> getAllCommandesList() async{
    // TODO: implement getAllCommandesList
    List<Commandes> commandesList=[];
    var url =Uri.parse('$dataURL');
    var response =await http.get(url);
    //  print("la list ok");
    var body = json.decode(response.body);
    for( var i=0; i<body.length;i++){
      commandesList.add(Commandes.fromJson(body[i]));
    }
    return commandesList;
  }

  @override
  Future<Commandes> getOneCommandes(int commandesId) async {
    // TODO: implement getOneCommandes
    Commandes commandes;
    var url =Uri.parse('$dataURL/$commandesId');
    var response =await http.get(url);
    commandes=Commandes.fromJson(jsonDecode(response.body));
    return commandes;  }

  @override
  Future<String> updateCommandes(Commandes commandes) async{
    // TODO: implement updateCommandes
    var url =Uri.parse('$dataURL/${commandes.id }');
    var response =await http.put(url,body: jsonEncode(commandes.toJson()),headers: {
      'Content-Type': 'application/json;charset=utf-8',
    }, );
    var body = response.body;
    return body;  }
  
}