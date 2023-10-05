import 'package:flutter/material.dart';
import 'package:cantineop/pages/home/game.dart';
import 'package:cantineop/pages/home/widgets/Description.dart';
import 'package:cantineop/pages/home/widgets/Gallery.dart';
import 'package:cantineop/pages/home/widgets/Review.dart';
import 'package:cantineop/pages/home/widgets/headers.dart';

class GameInfo extends StatelessWidget {
  final Game game;

  const GameInfo(this.game, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          HeaderSection(game),
          GallerySection(game),
          DescriptionSection(game),
          ReviewSection(game)
        ],
      ),
    );
  }
}
