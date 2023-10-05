import 'package:cantineop/pages/home/home.dart';
import 'package:flutter/material.dart';
void main(){
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title : "Restaurant",
      debugShowCheckedModeBanner:false,
      // Scaffold repprésente une seule page
      home:HomePage(),
    );

  }

}
