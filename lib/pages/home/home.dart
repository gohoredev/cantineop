import 'package:flutter/material.dart';
import 'package:cantineop/pages/home/game.dart';
import 'package:cantineop/pages/home/widgets/category.dart';
import 'package:cantineop/pages/home/widgets/header.dart';
import 'package:cantineop/pages/home/widgets/search.dart';
import 'package:cantineop/templates/Navbar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context){
    return Scaffold(
       // backgroundColor: Colors.green,
      backgroundColor: Color(0xFF5F67EA),
      //  title: const Text("FOOD ONPOINT"),
      // SingleChildScrollView : permet de scroller
      body: SingleChildScrollView(
        child:Stack(
          children: [
            Transform(transform: Matrix4.identity()..rotateZ(20),
            origin: const Offset(150, 50),
            child :
            Image.asset('assets/images/bg_liquid.png', width: 200,
            ),
            ),
            Positioned(
              right: 0,
              top: 200,
            child: Transform(transform: Matrix4.identity()..rotateZ(20),
              origin: const Offset(100, 100),
              child : Image.asset(
                'assets/images/bg_liquid.png',
                width: 200,
              ),
            ),
            ),
            Column (
                children :  [
                  HeaderSection1(),
                  const  SearchSection(),
                  CategorySection(),
                ]

            )
          ],
        ),
      ),
      bottomNavigationBar: NavBar(),
    );
         }

}