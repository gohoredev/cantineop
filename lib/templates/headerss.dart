import 'package:flutter/material.dart';



class Headerss   {


  AppBar getAppBar(){
    return  AppBar(


      //  height: 200,
      // color: Colors.orange,
      title: Row(
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