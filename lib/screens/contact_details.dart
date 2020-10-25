import 'package:flutter/material.dart';
import 'package:mcc_project/models/contact.dart';
import 'package:mcc_project/screens/map_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/contact_detail_card.dart';

class ContactDetails extends StatelessWidget {
  final Contact contact;
  final _key = GlobalKey<ScaffoldState>();

  ContactDetails({this.contact});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,

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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              /// Phone number card
              ContactDetailCard(
                icon: Icons.phone,
                text: contact.phoneNumber,
                function: () {
                  _launchURL(
                      'tel:${contact.phoneNumber}'
                  );
                },
              ),

              SizedBox(
                height: 10,
              ),

              if(contact.email != null)
                /// Email card
                ContactDetailCard(
                  icon: Icons.email,
                  text: contact.email,
                  function: () {
                    _launchURL(
                      'mailto:${contact.email}'
                    );
                  },
                ),

              SizedBox(
                height: 10,
              ),

              if(contact.address != null)
                /// Address card
                ContactDetailCard(
                  icon: Icons.location_city,
                  text: contact.address,
                  function: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MapScreen(
                            contact: contact,
                          )
                      ),
                    );
                  },
                ),
            ],
          ),
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
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      );
  }

  /// launches url
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      showSnackbar('Cannot launch url: $url');
    }
  }

  /// shows snackbar on url launch error
  showSnackbar(String message) {
    _key.currentState.showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 5),
    ));
  }
}
