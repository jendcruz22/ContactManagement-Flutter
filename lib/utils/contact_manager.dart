import 'package:flutter/material.dart';
import 'package:mcc_project/models/contact.dart';
import 'package:sqflite/sqflite.dart';

import 'database_helper.dart';

class ContactManager extends ChangeNotifier {
  List<Contact> _contacts = List<Contact>();
  DatabaseHelper databaseHelper = DatabaseHelper();

  List<Contact> get contacts => _contacts;

  void updateContactsList() {
    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {
      Future<List<Contact>> contactListFuture = databaseHelper.getContactList();
      contactListFuture.then((contactList) {
        _contacts = contactList;
        notifyListeners();
      });
    });
  }

  Future<bool> addContact(Contact contact) async {
    int result = await databaseHelper.insertContact(contact);
    if (result != 0){
      updateContactsList();
      return true;
    } else {
      return false;
    }
  }

  void deleteContact(Contact contact) async {
    int result = await databaseHelper.deleteContact(contact.id);
    if (result != 0) {
      updateContactsList();
    }
  }
}