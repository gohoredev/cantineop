

import 'package:cantineop/models/Menu.dart';
import 'package:cantineop/services/MenuService.dart';

class MenusController {
  final MenusService _menusService;

  MenusController(this._menusService);

  Future <List<Menus>> menuslist() async {
    return _menusService.getAllMenusList();
  }


  Future <Menus> getOneMenus(int menusId) async {
    return _menusService.getOneMenus(menusId);
  }

  Future <String> updateMenus(Menus menus) async {
    return _menusService.updateMenus(menus);
  }

  Future <String> createMenus(Menus menus) async {
    return _menusService.createMenus(menus);
  }

  Future <String> deleteMenus(int menus) {
    return _menusService.deletedMenus(menus);
  }
}