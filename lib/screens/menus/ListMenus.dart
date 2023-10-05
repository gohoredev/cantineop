
import 'package:cantineop/templates/Navbar.dart';
import 'package:cantineop/templates/headerss.dart';
import 'package:flutter/material.dart';
import 'package:cantineop/controller/MenusController.dart';
import 'package:cantineop/models/Menu.dart';
import 'package:cantineop/screens/menus/AddMenus.dart';
import 'package:cantineop/services/servicesImplement/MenuServiceImpl.dart';


class MenusScreen extends StatefulWidget {

  State<MenusScreen> createState()=> _MenusScreenState();
}

class _MenusScreenState extends State<MenusScreen> {
  @override
  Widget build(BuildContext context) {
    var menusController = MenusController(MenuServiceImpl());

    menuList() {
      return menusController.menuslist();
    }

    return Scaffold(
      appBar:  Headerss().getAppBar(),
      body: FutureBuilder<List<Menus>>(
        future:menuList() ,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(
              child: Text("error"),
            );
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                var menus = snapshot.data?[index];
                return Container(
                  height: 100.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text('${menus?.id}')),
                      Expanded(flex: 2, child: Text('${menus?.nomPlat}')),
                      Expanded(flex: 3, child: Text('${menus?.description}')),
                      Expanded(flex: 4, child: Text('${menus?.prix}')),

                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                                onTap: () {
                                  menusController
                                      .updateMenus(menus!);
                                },
                                child: builCallContainer(
                                    icon: Icons.remove_red_eye_outlined,
                                    color: Color(0xFFFFE0B2))),
                            InkWell(

                              onTap: () async {
                                String response = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
                                =>AddUpdateMenus(id: menus!.id!,)));
                                if (response != null) {
                                  menuList();
                                  setState(() {

                                  });
                                }
                              },
                              child: builCallContainer(
                                  icon: Icons.update, color: Color(0xFFE1BEE7)),
                            ),
                            InkWell(
                              onTap: () async  {
                                String response=  await  menusController.deleteMenus(menus!.id!);

                                if (response != null) {
                                  menuList();
                                  setState(() {

                                  });
                                }
                              },

                              child: builCallContainer(
                                  icon: Icons.delete, color: Color(0xFFFFCDD2)),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  thickness: 0.5,
                  height: 0.5,
                );
              },
              itemCount: snapshot.data?.length ?? 0);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          String response = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
          =>AddUpdateMenus()));

          if (response != null) {
            menuList();
            setState(() {

            });
          }
        },
      ),
      bottomNavigationBar: NavBar(),

    );
  }

  Container builCallContainer({required IconData icon, required Color color}) {
    return Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
      child: Icon(icon),
    );
  }
}
