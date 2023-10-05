import 'package:cantineop/models/Paiements.dart';

abstract class PaiementsService {
//get
  Future<List<Paiements>> getAllPaiementsList();
  Future<Paiements> getOnePaiements(int paiementsId);
  Future<String> createPaiements(Paiements paiements);
  // put
  Future<String> updatePaiements(Paiements paiements);
  //delete
  Future<String> deletedPaiements(int paiements);

}