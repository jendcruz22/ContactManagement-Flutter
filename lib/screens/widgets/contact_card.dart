import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mcc_project/models/contact.dart';
import 'package:mcc_project/utils/contact_manager.dart';
import 'package:provider/provider.dart';
import '../contact_details.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    Key key,
    @required this.context,
    @required this.contact,
  }) : super(key: key);

  final BuildContext context;
  final Contact contact;

  @override
  Widget build(BuildContext context) {
    /// Slidable card
    return Slidable(
      actionPane: SlidableScrollActionPane(),
      actionExtentRatio: 0.20,
      secondaryActions: <Widget>[

        /// Edit Button
        SlideAction(
          color: Colors.white,
          child: Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue,
            ),
            child: Icon(
              Icons.edit,
              size: 25.0,
              color: Colors.white,
            ),
          ),
          onTap: () {
            // TODO edit functionality
          },
        ),

        /// Delete Button
        SlideAction(
          color: Colors.white,
          child: Container(
            height: 60.0,
            width: 60.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.red,
            ),
            child: Icon(
              Icons.delete,
              size: 25.0,
              color: Colors.white,
            ),
          ),
          onTap: () {
            Provider.of<ContactManager>(
                context, listen: false).deleteContact(contact);
          },
        ),
      ],

      /// card
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: InkWell(
          splashColor: Colors.blue.withOpacity(0.05),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ContactDetails(contact: contact)
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(90),
                    color: Colors.amberAccent,
                  ),
                  child: Icon(
                    Icons.person,
                    size: 35,
                    color: Colors.grey[800],
                  ),
                  width: 70,
                  height: 70,
                ),

                SizedBox(
                  width: 20,
                ),
                Text(
                  contact.name,
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Spacer(),
                Icon(
                  Icons.info_outline,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
