import 'package:flutter/material.dart';
import 'package:cantineop/pages/home/widgets/newest.dart';
import 'package:cantineop/pages/home/widgets/popular.dart';

class CategorySection extends StatelessWidget  {
   CategorySection({super.key});

   // On veut stocké des données sur plusieurs Map

   final categories = [
     {
       'icon': Icons.restaurant,
       'color': const Color(0xFF605CF4),
       'title': 'Dabali expex'
     },
     {
       'icon': Icons.restaurant,
       'color': const Color(0xFFFC77A6),
       'title': 'Taxas Grill'
     },
     {
       'icon': Icons.restaurant,
       'color': const Color(0xFF4391FF),
       'title': 'Chez paul'
     },
     {
       'icon': Icons.restaurant,
       'color': const Color(0xFF7182f2),
       'title': 'GOHORE'
     },
   ];

   @override
   Widget build(BuildContext context) {
     return Container(
       decoration: const BoxDecoration(
         color: Color(0xFFF6F8FF),
         borderRadius: BorderRadius.only(
           topLeft: Radius.circular(20),
           topRight: Radius.circular(20),
         ),
       ),
       child: Column(
         children: [
           Container(
             height: 140,
             padding: const EdgeInsets.all(25),
             child: ListView.separated(
               scrollDirection: Axis.horizontal,
               itemBuilder: (_, index) => Column(
                 children: [
                   Container(
                     padding: const EdgeInsets.all(10),
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20),
                         color: categories[index]['color'] as Color),
                     child: Icon(
                       categories[index]['icon'] as IconData,
                       color: Colors.white,
                       size: 40,
                     ),
                   ),
                   const SizedBox(height: 10),
                   Text(
                     categories[index]['title'] as String,
                     style: TextStyle(
                       color: Colors.black.withOpacity(0.7),
                       fontWeight: FontWeight.bold,
                       fontSize: 16,
                     ),
                   )
                 ],
               ),
               separatorBuilder: (_, index) => const SizedBox(width: 33),
               itemCount: categories.length,
             ),
           ),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 25),
             width: 410,
             child: const Text(
               'Nos plats populaire',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20,
               ),
             ),
           ),
           PopularGame(),
           Container(
             padding: const EdgeInsets.symmetric(horizontal: 25),
             width: 410,
             child: const Text(
               'Avis clients',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 20,
               ),
             ),
           ),
           NewestGame(),
         ],
       ),
     );
   }

}