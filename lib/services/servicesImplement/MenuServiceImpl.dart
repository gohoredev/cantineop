import 'dart:convert';

import 'package:cantineop/models/Menu.dart';
import 'package:cantineop/services/MenuService.dart';
import 'package:http/http.dart' as http;

class MenuServiceImpl implements MenusService {

  String dataURL="http://10.100.5.102:8080/api/menus";


  @override
  Future<String> createMenus(Menus menus) async {
    var url =Uri.parse('$dataURL');
    var response =await http.post(url,body: jsonEncode(menus.toJson()),headers: {
      'Content-Type': 'application/json;charset=utf-8',
    }, );
    var body = response.body;
    return body;
  }

  @override
  Future<String> deletedMenus(int id) async {
    // TODO: implement deletedMenus
    var url =Uri.parse('$dataURL/$id');
    var response =await http.delete(url);
    return response.body;
  }

  @override
  Future<List<Menus>> getAllMenusList() async {
    // TODO: implement getAllMenusList
    List<Menus> menusList=[];
    var url =Uri.parse('$dataURL');
    var response =await http.get(url);
    //  print("la list ok");
    var body = json.decode(response.body);
    for( var i=0; i<body.length;i++){
      menusList.add(Menus.fromJson(body[i]));
    }
    return menusList;
  }

  @override
  Future<Menus> getOneMenus(int menusId) async {
    // TODO: implement getOneMenus
    Menus menus;
    var url =Uri.parse('$dataURL/$menusId');
    var response =await http.get(url);
    menus=Menus.fromJson(jsonDecode(response.body));
    return menus;  }

  @override
  Future<String> updateMenus(Menus menus) async{
    // TODO: implement updateMenus
    var url =Uri.parse('$dataURL/${menus.id }');
    var response =await http.put(url,body: jsonEncode(menus.toJson()),headers: {
      'Content-Type': 'application/json;charset=utf-8',
    }, );
    var body = response.body;
    return body;  }
  
}