import 'dart:convert';

import 'package:cantineop/models/Paiements.dart';
import 'package:cantineop/services/PaiementService.dart';
import 'package:http/http.dart' as http;

class PaiementServiceImpl implements PaiementsService {
  String dataURL="http://10.100.5.102:8080/api/paiementss";


  @override
  Future<String> createPaiements(Paiements paiements) {
    // TODO: implement createPaiements
    throw UnimplementedError();
  }

  @override
  Future<String> deletedPaiements(int id) async{
    // TODO: implement deletedPaiements
    var url =Uri.parse('$dataURL/$id');
    var response =await http.delete(url);
    return response.body;
  }

  @override
  Future<List<Paiements>> getAllPaiementsList() async {
    // TODO: implement getAllPaiementsList
    List<Paiements> paiementsList=[];
    var url =Uri.parse('$dataURL');
    var response =await http.get(url);
    //  print("la list ok");
    var body = json.decode(response.body);
    for( var i=0; i<body.length;i++){
      paiementsList.add(Paiements.fromJson(body[i]));
    }
    return paiementsList;
  }

  @override
  Future<Paiements> getOnePaiements(int paiementsId) async{
    // TODO: implement getOnePaiements
    Paiements paiements;
    var url =Uri.parse('$dataURL/$paiementsId');
    var response =await http.get(url);
    paiements=Paiements.fromJson(jsonDecode(response.body));
    return paiements;  }

  @override
  Future<String> updatePaiements(Paiements paiements) async{
    // TODO: implement updatePaiements
    var url =Uri.parse('$dataURL/${paiements.id }');
    var response =await http.post(url,body: jsonEncode(paiements.toJson()),headers: {
      'Content-Type': 'application/json;charset=utf-8',
    }, );
    var body = response.body;
    return body;  }

}