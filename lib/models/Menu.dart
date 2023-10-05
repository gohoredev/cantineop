class Menus {
  int? id;
  String? nomPlat;
  String? description;
  int? prix;

  Menus({this.id, this.nomPlat, this.description, this.prix});

  Menus.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomPlat = json['nomPlat'];
    description = json['description'];
    prix = json['prix'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nomPlat'] = this.nomPlat;
    data['description'] = this.description;
    data['prix'] = this.prix;
    return data;
  }
}
