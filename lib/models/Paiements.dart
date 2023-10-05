class Paiements {
  int? id;
  int? montant;
  String? datePaiement;
  String? methodePaiement;
  int? commandeId;

  Paiements(
      {this.id,
        this.montant,
        this.datePaiement,
        this.methodePaiement,
        this.commandeId});

  Paiements.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    montant = json['montant'];
    datePaiement = json['datePaiement'];
    methodePaiement = json['methodePaiement'];
    commandeId = json['commandeId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['montant'] = this.montant;
    data['datePaiement'] = this.datePaiement;
    data['methodePaiement'] = this.methodePaiement;
    data['commandeId'] = this.commandeId;
    return data;
  }
}
