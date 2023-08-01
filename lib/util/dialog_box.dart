import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogBox extends StatefulWidget {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });
  //const DialogBox({super.key});

  @override
  State<DialogBox> createState() => _DialogBoxState(controller: this.controller,onSave: this.onSave,onCancel: this.onCancel);
}

class _DialogBoxState extends State<DialogBox> {

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  _DialogBoxState({
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextFormField(
                controller: controller,
                maxLength: 72,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Ajouter une nouvelle tâche",
                ),
                // The validator receives the text that the user has entered.

                validator: (value){
                  if (value == null || value.isEmpty) {

                    return "Le champs ne peux être null";

                  }
                  return null;
                }
            ),

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Enregistrer", onPressed: onSave),

                const SizedBox(width: 8),

                // cancel button
                MyButton(text: "Annuler", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

/*
class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            TextFormField(
              controller: controller,
              maxLength: 72,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Ajouter une nouvelle tâche",
              ),
              // The validator receives the text that the user has entered.
              validator: (value){
            if (value == null || value.isEmpty) {

            return "Le champs ne peux être null";

            }
              }
            ),

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Enregistrer", onPressed: onSave),

                const SizedBox(width: 8),

                // cancel button
                MyButton(text: "Annuler", onPressed: onCancel),
              ],
            ),
          ],
        ),
      ),
    );
  }
}*/
