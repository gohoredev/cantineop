class Game {
  String bgImage;
  String icon;
  String name;
  String type;
  num score;
  num download;
  num review;
  String description;
  List<String> images;

  Game(
      this.bgImage,
      this.icon,
      this.name,
      this.type,
      this.score,
      this.download,
      this.review,
      this.description,
      this.images,
      );

  static List<Game> games() {
    return [
      Game(
        'assets/images/tchep1.jpg',
        'assets/images/tchep1.jpg',
        'Tchep sénégalais',
        'Tchep sénégalais',
        4.8,
        382,
        324,
        "Ingrédients: 1 kg poissons frais (Barracuda, dorade, tilapia, etc). 1 kg de riz parfumé cassé (le riz siam). 6 gousses d'ail. 1 petit bouquet de persil.",
        [
          'assets/images/tchep2.jpg',
          'assets/images/tchep3.jpg',
          'assets/images/tchep1.jpg',
        ],
      ),
      Game(
        'assets/images/alloco.jpg',
        'assets/images/alloco.jpg',
        'Alloco',
        'Alloco',
        4.7,
        226,
        148,
        " Alloco: 1 kg poissons frais (Barracuda, dorade, tilapia, etc). 1 kg de riz parfumé cassé (le riz siam). 6 gousses d'ail. 1 petit bouquet de persil.",
        [
          'assets/images/alloco2.jpg',
          'assets/images/alloco3.jpg',
          'assets/images/alloco4.jpg',
          'assets/images/alloco.jpg',
        ],
      ),
    ];
  }
}
