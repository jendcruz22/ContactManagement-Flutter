import 'package:flutter/material.dart';
import 'package:mcc_project/models/contact.dart';
import 'package:mcc_project/utils/contact_manager.dart';
import 'package:provider/provider.dart';

class CustomAlertDialog extends StatelessWidget {
  final Contact contact;
  final GlobalKey<ScaffoldState> scaffoldKey;

  CustomAlertDialog({this.contact, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Confirm Delete Contact"),
      content: Text("Are you sure you want to delete this contact?"),
      actions: [
        FlatButton(
          child: Text("Yes"),
            onPressed: () {
              Provider.of<ContactManager>(
                  context, listen: false).deleteContact(contact);
              scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('Contact deleted successfully.'),
              ));
              Navigator.of(context).pop();

            },
        ),

        FlatButton(
          child: Text("No"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
