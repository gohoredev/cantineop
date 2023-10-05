

import 'package:flutter/material.dart';
import 'package:cantineop/controller/MenusController.dart';
import 'package:cantineop/controller/PaiementsController.dart';
import 'package:cantineop/models/Paiements.dart';
import 'package:cantineop/services/servicesImplement/MenuServiceImpl.dart';
import 'package:cantineop/services/servicesImplement/PaiementServiceImpl.dart';

class AddUpdatePaiements extends StatefulWidget {

  int? id=null;


  AddUpdatePaiements({super.key,this.id});
  @override
  State<AddUpdatePaiements> createState() => _AddUpdatePaiementsState();
}

class _AddUpdatePaiementsState extends State<AddUpdatePaiements> {
  // On défini une clé qui permet d'identifier de manière unique le formulaire
  GlobalKey<FormState> paiementsForm = GlobalKey<FormState>();

  var paiementsController = PaiementsController(PaiementServiceImpl());

  TextEditingController montantController = TextEditingController();
  TextEditingController datePaiementController = TextEditingController();
  TextEditingController methodePaiementController = TextEditingController();
  TextEditingController commandeIdController = TextEditingController();

  //récupérer un produit si l'ID existe
  Paiements? p =null;
  @override
  void initState() {
    Future(() async {

      // On utilise un widget car il renferme, contient les propriété de la class  statefulwidget
      if(widget.id !=null) {
        p= await paiementsController.getOnePaiements(widget.id!);
        setState(() {
          p=p;
        });
        montantController.text='${p!.montant!}';
        datePaiementController.text=p!.datePaiement!;
        methodePaiementController.text=p!.methodePaiement!;
        commandeIdController.text= '${p!.commandeId! }';
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   //     appBar: Header().getAppBar(),

        body:SingleChildScrollView( child :  Container(
          padding: EdgeInsets.all(20),

          child: Form(
            key: paiementsForm,
            child: Column(
              children: [
                TextFormField(
                  controller: montantController,
                  autofocus: true,
                  decoration: InputDecoration(
                    label: Text("Montant"),
                  ),
                ),
                TextFormField(
                  controller: datePaiementController,
                  decoration: InputDecoration(
                    label: Text("Date paiement "),
                  ),
                ),
                TextFormField(
                  controller: methodePaiementController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    label: Text("Methode paiement"),
                  ),
                ),
                TextFormField(
                  controller: commandeIdController,
                  decoration: InputDecoration(
                    label: Text("commande "),
                  ),
                ),

                SizedBox(
                  height: 10,
                ),

                // boutton pour enregistrer
                if(p==null)
                  FilledButton(
                      onPressed: () async {
                        if (!paiementsForm.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Champ invalid"),backgroundColor: Colors.red,),);
                          return;
                        }
                        Paiements paiements = Paiements(
                          montant:  int.parse(montantController.text),
                          datePaiement: datePaiementController.text,
                          methodePaiement: methodePaiementController.text,
                          commandeId: int.parse(commandeIdController.text),
                        );

                        String response= await paiementsController.createPaiements(paiements);
                        Navigator.of(context).pop(response);
                      },
                      child: Text("Enregistrer")),

                if(p!=null)
                // modification
                  FilledButton(
                      onPressed: () async {
                        if (!paiementsForm.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Champ invalid"),backgroundColor: Colors.red,),);
                          return;
                        }
                        Paiements paiements = Paiements(
                          id: p!.id!,
                          montant: int.parse(montantController.text),
                          datePaiement: datePaiementController.text,
                          methodePaiement: methodePaiementController.text,
                          commandeId: int.parse(commandeIdController.text),
                        );

                        String response= await paiementsController.updatePaiements(paiements);
                        Navigator.of(context).pop(response);
                      },
                      child: Text("modifier")),
              ],
            ),
          ),
        )));
  }
}
