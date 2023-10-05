

import 'package:cantineop/templates/headerss.dart';
import 'package:flutter/material.dart';
import 'package:cantineop/controller/UtilisateursController.dart';
import 'package:cantineop/models/Utilisateurs.dart';
import 'package:cantineop/services/servicesImplement/UtilisateurServiceImpl.dart';

class AddUpdateUtilisateur extends StatefulWidget {

  int? id=null;


  AddUpdateUtilisateur({super.key,this.id});
  @override
  State<AddUpdateUtilisateur> createState() => _AddUpdateUtilisateurState();
}

class _AddUpdateUtilisateurState extends State<AddUpdateUtilisateur> {
  // On défini une clé qui permet d'identifier de manière unique le formulaire
  GlobalKey<FormState> utilisateurForm = GlobalKey<FormState>();

  var utilisateursController = UtilisateursController(UtilisateurServiceImpl());
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController fonctionController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController motDepasseController = TextEditingController();

    //récupérer un produit si l'ID existe
  Utilisateurs? user =null;
  @override
  void initState() {
    Future(() async {

      // On utilise un widget car il renferme, contient les propriété de la class  statefulwidget
      if(widget.id !=null) {
        user= await utilisateursController.getOneUtilisateurs(widget.id!);
        setState(() {
          user=user;
        });
        nomController.text=user!.nom!;
        prenomController.text=user!.prenom!;
        emailController.text='${user!.email!}';
        fonctionController.text= '${user!.fonction! }';
        telephoneController.text='${user!.telephone!}';
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
            key: utilisateurForm,
            child: Column(
              children: [
                TextFormField(
                  controller: nomController,
                  autofocus: true,
                  decoration: InputDecoration(
                    label: Text("nom"),
                  ),
                ),
                TextFormField(
                  controller: prenomController,
                  decoration: InputDecoration(
                    label: Text("prenom"),
                  ),
                ),
                TextFormField(
                  controller: emailController,
                 // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("email"),
                  ),
                ),
                TextFormField(
                  controller: fonctionController,
                  decoration: InputDecoration(
                    label: Text("fonction"),
                  ),
                ),
                TextFormField(
                  controller: telephoneController,
                  decoration: InputDecoration(
                    label: Text("telephone"),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),

                // boutton pour enregistrer
                if(user==null)
                  FilledButton(
                      onPressed: () async {
                        if (!utilisateurForm.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Champ invalid"),backgroundColor: Colors.red,),);
                          return;
                        }
                        Utilisateurs utilisateur = Utilisateurs(
                          nom: nomController.text,
                          prenom: prenomController.text,
                          email:emailController.text,
                          fonction:fonctionController.text,
                          telephone: telephoneController.text,
                        );

                        String response= await utilisateursController.createUtilisateurs(utilisateur);
                        Navigator.of(context).pop(response);
                      },
                      child: Text("Enregistrer")),

                if(user!=null)
                // modification
                  FilledButton(
                      onPressed: () async {
                        if (!utilisateurForm.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Champ invalid"),backgroundColor: Colors.red,),);
                          return;
                        }
                        Utilisateurs utilisateurs = Utilisateurs(
                          id: user!.id!,
                          nom: nomController.text,
                          prenom: prenomController.text,
                          email: emailController.text,
                          fonction: fonctionController.text,
                          telephone:telephoneController.text,

                      //    quantite: int.parse(quantiteController.text),

                        );

                        String response= await utilisateursController.updateUtilisateurs(utilisateurs);
                        Navigator.of(context).pop(response);
                      },
                      child: Text("modifier")),
              ],
            ),
          ),
        )));
  }
}
