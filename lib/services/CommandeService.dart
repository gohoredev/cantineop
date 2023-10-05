import 'package:cantineop/models/Commandes.dart';

abstract class CommandesService {
//get
  Future<List<Commandes>> getAllCommandesList();
  Future<Commandes> getOneCommandes(int commandesId);
  Future<String> createCommandes(Commandes commandes);
  // put
  Future<String> updateCommandes(Commandes commandes);
  //delete
  Future<String> deletedCommandes(int commandesId);

}