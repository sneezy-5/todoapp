import 'package:flutter/material.dart';

import 'my_button.dart';

class DialogEditBox extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;

  DialogEditBox({
    super.key,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // get user input
            const Text("Voulez-vous vraiment supprimer?"),
            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // save button
                MyButton(text: "Confirmer",textColor: Colors.pink, onPressed: onSave),

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