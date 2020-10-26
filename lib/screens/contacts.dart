import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:mcc_project/models/contact.dart';
import 'package:mcc_project/utils/contact_manager.dart';
import 'package:provider/provider.dart';

import 'widgets/contact_card.dart';

class Contacts extends StatefulWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  Contacts({this.scaffoldKey});

  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

  @override
  void initState() {
    super.initState();
    /// Fetch contacts from the database
    Provider.of<ContactManager>(
        context, listen: false).updateContactsList();
  }

  @override
  Widget build(BuildContext context) {
    /// List of contacts - Listens for changes in the database
    List<Contact> _contactList = Provider.of<ContactManager>(
        context, listen: true).contacts;

    return Scaffold(
      backgroundColor: Colors.white,

      /// Appbar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          'Contacts',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.amberAccent,
          ),
        ),
        centerTitle: true,
      ),

      /// Body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [

          /// List view
          Expanded(
            child: ListView.builder(
                itemCount: _contactList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: Column(
                      children: [
                        ContactCard(
                          context: context,
                          contact: _contactList[index],
                          scaffoldKey: widget.scaffoldKey,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Divider(
                            height: 5.0,
                            color: Colors.grey[800],
                            thickness: 0.3,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
