


import 'package:cantineop/models/Paiements.dart';
import 'package:cantineop/services/PaiementService.dart';

class PaiementsController {
  final PaiementsService _paiementsService;

  PaiementsController(this._paiementsService);

  Future <List<Paiements>> paiementslist() async {
    return _paiementsService.getAllPaiementsList();
  }

  Future <Paiements> getOnePaiements(int commandesId) async {
    return _paiementsService.getOnePaiements(commandesId);
  }

  Future <String> updatePaiements(Paiements commandes) async {
    return _paiementsService.updatePaiements(commandes);
  }

  Future <String> createPaiements(Paiements commandes) async {
    return _paiementsService.createPaiements(commandes);
  }

  Future <String> deletePaiements(int commandes) {
    return _paiementsService.deletedPaiements(commandes);
  }

}