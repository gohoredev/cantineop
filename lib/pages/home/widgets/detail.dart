import 'package:flutter/material.dart';
import 'package:cantineop/pages/home/game.dart';
import 'package:cantineop/pages/home/widgets/DetailSliver.dart';
import 'package:cantineop/pages/home/widgets/GameInfo.dart';

class DetailPage extends StatelessWidget {
  const DetailPage(this.game, {super.key});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: DetailSliverDelegate(
              game: game,
              expandedHeight: 360,
              roundedContainerHeight: 30,
            ),
          ),
          SliverToBoxAdapter(
            child: GameInfo(game),
          )
        ],
      ),
    );
  }
}
