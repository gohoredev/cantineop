

import 'package:cantineop/models/Utilisateurs.dart';
import 'package:cantineop/services/UtilisateurService.dart';

class UtilisateursController {
  final UtilisateurService _utilisateurService;
  UtilisateursController(this._utilisateurService);
  Future <List<Utilisateurs>> utilisateurslist() async {
    return _utilisateurService.getAllUtilisateursList();
  }
  Future <Utilisateurs> getOneUtilisateurs(int utilisateursId) async {
    return _utilisateurService.getOneUtilisateurs(utilisateursId);
  }
  Future <String> updateUtilisateurs(Utilisateurs utilisateurs) async {
    return _utilisateurService.updateUtilisateurs(utilisateurs);
  }
  Future <String> createUtilisateurs(Utilisateurs utilisateurs) async {
    return _utilisateurService.createUtilisateurs(utilisateurs);
  }

  Future <String> deleteUtilisateurs(int utilisateurs) {
    return _utilisateurService.deletedUtilisateurs(utilisateurs);
  }
}