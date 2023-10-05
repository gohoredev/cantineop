
import 'package:cantineop/models/Commandes.dart';
import 'package:cantineop/services/CommandeService.dart';

class CommandeController {
  final CommandesService _commandesService;
  CommandeController(this._commandesService);
  Future <List<Commandes>> commandeslist() async {
    return _commandesService.getAllCommandesList();
  }
  Future <Commandes> getOneCommandes(int commandesId) async {
    return _commandesService.getOneCommandes(commandesId);
  }
  Future <String> updateCommandes(Commandes commandes) async {
    return _commandesService.updateCommandes(commandes);
  }
  Future <String> createCommandes(Commandes commandes) async {
    return _commandesService.createCommandes(commandes);
  }
  Future <String> deleteCommandes(int commandes){
    return _commandesService.deletedCommandes(commandes);
  }

}