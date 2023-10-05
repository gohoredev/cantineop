

import 'package:cantineop/templates/headerss.dart';
import 'package:flutter/material.dart';
import 'package:cantineop/controller/MenusController.dart';
import 'package:cantineop/models/Menu.dart';
import 'package:cantineop/services/servicesImplement/MenuServiceImpl.dart';

class AddUpdateMenus extends StatefulWidget {

  int? id=null;


  AddUpdateMenus({super.key,this.id});
  @override
  State<AddUpdateMenus> createState() => _AddUpdateMenusState();
}

class _AddUpdateMenusState extends State<AddUpdateMenus> {
  // On défini une clé qui permet d'identifier de manière unique le formulaire
  GlobalKey<FormState> menusForm = GlobalKey<FormState>();

  var menuController = MenusController(MenuServiceImpl());
  TextEditingController nomPlatController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController prixController = TextEditingController();


  //récupérer un produit si l'ID existe
  Menus? m =null;
  @override
  void initState() {
    Future(() async {

      // On utilise un widget car il renferme, contient les propriété de la class  statefulwidget
      if(widget.id !=null) {
        m= await menuController.getOneMenus(widget.id!);
        setState(() {
          m=m;
        });
        nomPlatController.text=m!.nomPlat!;
        descriptionController.text=m!.description!;
        prixController.text= '${m!.prix! }';
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  Headerss().getAppBar(),

        body:SingleChildScrollView( child :  Container(
          padding: EdgeInsets.all(20),

          child: Form(
            key: menusForm,
            child: Column(
              children: [
                TextFormField(
                  controller: nomPlatController,
                  autofocus: true,
                  decoration: InputDecoration(
                    label: Text("nom"),
                  ),
                ),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    label: Text("description"),
                  ),
                ),
                TextFormField(
                  controller: prixController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("prix"),
                  ),
                ),
                     SizedBox(
                  height: 10,
                ),

                // boutton pour enregistrer
                if(m==null)
                  FilledButton(
                      onPressed: () async {
                        if (!menusForm.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Champ invalid"),backgroundColor: Colors.red,),);
                          return;
                        }
                        Menus menus = Menus(
                          nomPlat: nomPlatController.text,
                          description: descriptionController.text,
                          prix: int.parse(prixController.text),
                        );

                        String response= await menuController.createMenus(menus);
                        Navigator.of(context).pop(response);
                      },
                      child: Text("Enregistrer")),

                if(m!=null)
                // modification
                  FilledButton(
                      onPressed: () async {
                        if (!menusForm.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Champ invalid"),backgroundColor: Colors.red,),);
                          return;
                        }
                        Menus menus = Menus(
                          id: m!.id!,
                          nomPlat: nomPlatController.text,
                          description: descriptionController.text,
                          prix: int.parse(prixController.text),
                        );

                        String response= await menuController.updateMenus(menus);
                        Navigator.of(context).pop(response);
                      },
                      child: Text("modifier")),
              ],
            ),
          ),
        )));
  }
}
