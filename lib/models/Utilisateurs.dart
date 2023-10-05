class Utilisateurs {
  int? id;
  String? nom;
  String? prenom;
  String? email;
  String? fonction;
  String? telephone;
  String? motDePasse;

  Utilisateurs( {this.id,
        this.nom,
        this.prenom,
        this.email,
        this.fonction,
        this.telephone,
        this.motDePasse} );

  Utilisateurs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nom = json['nom'];
    prenom = json['prenom'];
    email = json['email'];
    fonction = json['fonction'];
    telephone = json['telephone'];
    motDePasse = json['motDePasse'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nom'] = this.nom;
    data['prenom'] = this.prenom;
    data['email'] = this.email;
    data['fonction'] = this.fonction;
    data['telephone'] = this.telephone;
    data['motDePasse'] = this.motDePasse;
    return data;
  }
}
