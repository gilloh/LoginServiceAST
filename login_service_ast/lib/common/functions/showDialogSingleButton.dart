import 'package:flutter/material.dart';

void showDialogSingleButton(BuildContext context, String title, String message, String buttonLabel) {
  showDialog(
    context: context,
    builder: (BuildContext context) { // TODO: check this
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          FlatButton(
            child: Text(buttonLabel),
            onPressed: () {
              Navigator.of(context).pop();
            },
          )
        ],
      );
    }
  );
}