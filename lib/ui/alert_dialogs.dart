import 'package:flutter/material.dart';

class AlertDialogs {
  static AlertDialog showAlertLogin(
      {required BuildContext context,
      required String message,
      required String description}) {
    return AlertDialog(
      title: Text(message),
      content: SingleChildScrollView(
        child: ListBody(children: [Text(description)]),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'login'),
          child: Text('Aceptar'),
        ),
      ],
    );
  }
}
