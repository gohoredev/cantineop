import 'package:cantineop/templates/Navbar.dart';
import 'package:cantineop/templates/headerss.dart';
import 'package:flutter/material.dart';
import 'package:cantineop/controller/UtilisateursController.dart';
import 'package:cantineop/models/Utilisateurs.dart';
import 'package:cantineop/screens/utilisateurs/AddUtilisateur.dart';
import 'package:cantineop/services/servicesImplement/UtilisateurServiceImpl.dart';

class UtilisateurScreen extends StatefulWidget {
  State<UtilisateurScreen> createState() => _UtilisateurScreenState();
}

class _UtilisateurScreenState extends State<UtilisateurScreen> {
  @override
  Widget build(BuildContext context) {
    var utilisateurController =
        UtilisateursController(UtilisateurServiceImpl());

    utilisateurList() {
      return utilisateurController.utilisateurslist();
    }

    return Scaffold(
       appBar:  Headerss().getAppBar(),

      body: FutureBuilder<List<Utilisateurs>>(
        future: utilisateurList(),
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
                var utilisateurs = snapshot.data?[index];
                return Container(
                  height: 100.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text('${utilisateurs?.id}')),
                      Expanded(flex: 2, child: Text('${utilisateurs?.nom}')),
                      Expanded(flex: 3, child: Text('${utilisateurs?.prenom}')),
                      Expanded(flex: 4, child: Text('${utilisateurs?.email}')),
                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                                onTap: () {
                                  utilisateurController
                                      .updateUtilisateurs(utilisateurs!);
                                },
                                child: builCallContainer(
                                    icon: Icons.remove_red_eye_outlined,
                                    color: Color(0xFFFFE0B2))),
                            InkWell(
                              onTap: () async {
                                String response = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            AddUpdateUtilisateur(
                                              id: utilisateurs!.id!,
                                            )));
                                if (response != null) {
                                  utilisateurList();
                                  setState(() {});
                                }
                              },
                              child: builCallContainer(
                                  icon: Icons.update, color: Color(0xFFE1BEE7)),
                            ),
                            InkWell(
                              onTap: () async {
                                String response = await utilisateurController
                                    .deleteUtilisateurs(utilisateurs!.id!);

                                if (response != null) {
                                  utilisateurList();
                                  setState(() {});
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
          String response = await Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AddUpdateUtilisateur()));

          if (response != null) {
            utilisateurList();
            setState(() {});
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
