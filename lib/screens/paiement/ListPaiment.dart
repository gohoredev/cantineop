
import 'package:cantineop/templates/headerss.dart';
import 'package:flutter/material.dart';
import 'package:cantineop/controller/PaiementsController.dart';
import 'package:cantineop/models/Paiements.dart';
import 'package:cantineop/screens/paiement/AddPaiements.dart';
import 'package:cantineop/services/servicesImplement/PaiementServiceImpl.dart';


class PaiementsScreen extends StatefulWidget {

  State<PaiementsScreen> createState()=> _PaiementsScreenState();
}

class _PaiementsScreenState extends State<PaiementsScreen> {
  @override
  Widget build(BuildContext context) {
    var paiementsController = PaiementsController(PaiementServiceImpl());

    paiementsList() {
      return paiementsController.paiementslist();
    }

    return Scaffold(
      appBar:  Headerss().getAppBar(),
      body: FutureBuilder<List<Paiements>>(
        future:paiementsList() ,
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
                var paiements = snapshot.data?[index];
                return Container(
                  height: 100.0,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Expanded(flex: 1, child: Text('${paiements?.id}')),
                      Expanded(flex: 2, child: Text('${paiements?.montant}')),
                      Expanded(flex: 3, child: Text('${paiements?.datePaiement}')),
                      Expanded(
                        flex: 4,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                                onTap: () {
                                  paiementsController
                                      .updatePaiements(paiements!);
                                },
                                child: builCallContainer(
                                    icon: Icons.remove_red_eye_outlined,
                                    color: Color(0xFFFFE0B2))),
                            InkWell(

                              onTap: () async {
                                String response = await Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)
                                =>AddUpdatePaiements(id: paiements!.id!,)));
                                if (response != null) {
                                  paiementsList();
                                  setState(() {

                                  });
                                }
                              },
                              child: builCallContainer(
                                  icon: Icons.update, color: Color(0xFFE1BEE7)),
                            ),
                            InkWell(
                              onTap: () async  {
                                String response=  await  paiementsController.deletePaiements(paiements!.id!);

                                if (response != null) {
                                  paiementsList();
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
          =>AddUpdatePaiements()));

          if (response != null) {
            paiementsList();
            setState(() {

            });
          }
        },
      ),
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
