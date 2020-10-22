import 'package:flutter/material.dart';
import 'package:mcc_project/models/contact.dart';

import 'widgets/contact_detail_card.dart';

class ContactDetails extends StatelessWidget {
  final Contact contact;

  ContactDetails({this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      /// Appbar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        bottom: buildHeader(),
      ),

      /// Body
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            /// Phone number card
            ContactDetailCard(
              icon: Icons.phone,
              text: contact.phoneNumber,
              function: () {},
            ),

            SizedBox(
              height: 10,
            ),

            /// Email card
            ContactDetailCard(
              icon: Icons.email,
              text: contact.email,
              function: () {},
            ),

            SizedBox(
              height: 10,
            ),

            /// Address card
            ContactDetailCard(
              icon: Icons.location_city,
              text: contact.address,
              function: () {},
            ),
          ],
        ),
      ),
    );
  }

  /// Header in the appbar
  PreferredSize buildHeader() {
    return PreferredSize(
        preferredSize: Size.fromHeight(160.0),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 20.0,
          ),
          child: Column(
            children: [
              /// Icon
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  color: Colors.amberAccent,
                ),
                child: Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.grey[800],
                ),
                width: 100.0,
                height: 100.0,
              ),

              SizedBox(
                height: 20.0,
              ),

              /// Contact's name
              Text(
                contact.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      );
  }
}
