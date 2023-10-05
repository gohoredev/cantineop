import 'package:cantineop/controller/UtilisateursController.dart';
import 'package:cantineop/models/Utilisateurs.dart';
import 'package:cantineop/services/servicesImplement/UtilisateurServiceImpl.dart';
import 'package:cantineop/templates/Navbar.dart';
import 'package:cantineop/templates/headerss.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cantineop/controller/CommandesController.dart';
import 'package:cantineop/controller/MenusController.dart';
import 'package:cantineop/models/Commandes.dart';
import 'package:cantineop/models/Menu.dart';
import 'package:cantineop/services/servicesImplement/CommandeServiceImpl.dart';
import 'package:cantineop/services/servicesImplement/MenuServiceImpl.dart';

class AddUpdateCommandes extends StatefulWidget {
  int? id = null;

  AddUpdateCommandes({super.key, this.id});
  @override
  State<AddUpdateCommandes> createState() => _AddUpdateCommandesState();
}

class _AddUpdateCommandesState extends State<AddUpdateCommandes> {
  // On défini une clé qui permet d'identifier de manière unique le formulaire
  GlobalKey<FormState> commandesForm = GlobalKey<FormState>();
  var _menusID=null;
  var _usersID=null;

  var commandesController = CommandeController(CommandeServiceImpl());

  var menusController = MenusController(MenuServiceImpl());

  var usersController = UtilisateursController(UtilisateurServiceImpl());


  TextEditingController quantiteController = TextEditingController();
  TextEditingController prixTotalController = TextEditingController();
  TextEditingController menuIdController = TextEditingController();
  TextEditingController usersIdController = TextEditingController();

  var menuId = '';

  //récupérer un produit si l'ID existe
  Commandes? cmd = null;
   List<Menus> menuInit=[];
  List<Utilisateurs> userInit=[];


  @override
  void initState() {

    super.initState();

    Future(() async {
      print("debut ++++");

      menuInit = await menusController.menuslist();
      userInit = await usersController.utilisateurslist();
      setState(() {
        menuInit=menuInit;
        userInit=userInit;

      });


// On utilise un widget car il renferme, contient les propriété de la class  statefulwidget

      if (widget.id != null) {
        cmd = await commandesController.getOneCommandes(widget.id!);
        setState(() {
          cmd = cmd;
          quantiteController.text = '${cmd!.quantite!}';
          prixTotalController.text = '${cmd!.prixTotal!}';
          _usersID = cmd!.usersId;
          _menusID = cmd!.menuId;
        });


      }
    });
    //super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  Headerss().getAppBar(),

        body: SingleChildScrollView(
            child: Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: commandesForm,
        child: Column(
          children: [
            TextFormField(
              controller: quantiteController,
              autofocus: true,
              decoration: InputDecoration(
                label: Text("quantite"),
              ),
            ),
            TextFormField(
              controller: prixTotalController,
              decoration: InputDecoration(
                label: Text("prix total"),
              ),
            ),


             Column(

               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                 SizedBox(height: 20,),
                 Text("Plat"),
                 DropdownButton2<int>(
                  value: _menusID,
                  //elevation: 0,
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  onChanged: (int? newValue) {
                    setState(() {
                      _menusID = newValue!;
                    });
                  },
                  items: (menuInit ?? [] ).map<DropdownMenuItem<int>>((e) {
                    return DropdownMenuItem<int>(
                      value: e.id,
                      child: Text(e.nomPlat!, style: const TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),),
                    );
                  }).toList(),
                  isExpanded: true,
                  dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      elevation: 8
                  ),
            ),
                 Divider(
                   color: Colors.black87,
                 )
               ],
             ),

            SizedBox(height: 20,),

            Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20,),
                Text("Nom user"),
                DropdownButton2<int>(
                  value: _usersID,
                  //elevation: 0,
                  underline: Container(
                    height: 0,
                    color: Colors.transparent,
                  ),
                  onChanged: (int? newValue) {
                    setState(() {
                      _usersID = newValue!;
                    });
                  },
                  items: (userInit ?? [] ).map<DropdownMenuItem<int>>((e) {
                    return DropdownMenuItem<int>(
                      value: e.id,
                      child: Text(e.nom!, style: const TextStyle(color: Colors.black54, fontSize: 18, fontWeight: FontWeight.bold),),
                    );
                  }).toList(),
                  isExpanded: true,
                  dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Theme.of(context).colorScheme.background,
                      ),
                      elevation: 8
                  ),
                ),
                Divider(
                  color: Colors.black87,
                )
              ],
            ),

            SizedBox(
              height: 10,
            ),

            // boutton pour enregistrer
            if (cmd == null)
              FilledButton(
                  onPressed: () async {
                    if (!commandesForm.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Champ invalid"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    Commandes commandes = Commandes(
                      quantite: int.parse(quantiteController.text),
                      prixTotal: int.parse(prixTotalController.text),
                      menuId: _menusID,
                      usersId:_usersID,
                    );

                    String response =
                        await commandesController.createCommandes(commandes);
                    Navigator.of(context).pop(response);
                  },
                  child: Text("Enregistrer")),

            if (cmd != null)
              // modification
              FilledButton(
                  onPressed: () async {
                    if (!commandesForm.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Champ invalid"),
                          backgroundColor: Colors.red,
                        ),
                      );
                      return;
                    }
                    Commandes commandes = Commandes(
                      id: cmd!.id!,
                      quantite: int.parse(quantiteController.text),
                      prixTotal: int.parse(prixTotalController.text),
                      menuId: _menusID,
                      usersId:_usersID,
                    );

                    String response =
                        await commandesController.updateCommandes(commandes);
                    Navigator.of(context).pop(response);
                  },
                  child: Text("modifier")),

          ],

        ),

      ),

            )

        )

    );

  }
}
