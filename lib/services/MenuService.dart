import 'package:cantineop/models/Menu.dart';

abstract class MenusService {
//get
  Future<List<Menus>> getAllMenusList();
  Future<Menus> getOneMenus(int menusId);
  Future<String> createMenus(Menus menus);
  // put
  Future<String> updateMenus(Menus menus);
  //delete
  Future<String> deletedMenus(int menusId);

}