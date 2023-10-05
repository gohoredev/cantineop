
import 'package:cantineop/models/Utilisateurs.dart';

abstract class UtilisateurService {
//get
  Future<List<Utilisateurs>> getAllUtilisateursList();
  Future<Utilisateurs> getOneUtilisateurs(int utilisateursId);
  Future<String> createUtilisateurs(Utilisateurs utilisateurs);
  // put
  Future<String> updateUtilisateurs(Utilisateurs utilisateurs);
  //delete
  Future<String> deletedUtilisateurs(int utilisateurs);

}