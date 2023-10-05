import 'package:flutter/material.dart';
class HeaderSection1 extends StatelessWidget {
  const HeaderSection1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
    //  height: 200,
     // color: Colors.orange,
      child: Row(
          mainAxisAlignment :MainAxisAlignment.spaceBetween,
          children :[
                Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("CANTINE ONPOINT AFRICA",style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                fontWeight: FontWeight.bold)
              ,),

            ],
        ),
        CircleAvatar(
          child: Image.asset("assets/images/avatar.png",fit: BoxFit.cover,),
        )

      ]),
    );

  }
}