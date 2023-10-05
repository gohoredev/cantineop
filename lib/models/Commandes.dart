class Commandes {
  int? id;
  int? quantite;
  int? prixTotal;
  int? menuId;
  int? usersId;

  Commandes(
      {this.id, this.quantite, this.prixTotal, this.menuId, this.usersId});

  Commandes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantite = json['quantite'];
    prixTotal = json['prixTotal'];
    menuId = json['menuId'];
    usersId = json['usersId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantite'] = this.quantite;
    data['prixTotal'] = this.prixTotal;
    data['menuId'] = this.menuId;
    data['usersId'] = this.usersId;
    return data;
  }
}
