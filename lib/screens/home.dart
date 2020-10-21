import 'package:flutter/material.dart';
import 'package:mcc_project/models/contact.dart';
import 'package:mcc_project/screens/add_edit_contact.dart';
import 'about_us.dart';
import 'contacts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _myPage = PageController(initialPage: 0);
  final _homeScaffoldKey = GlobalKey<ScaffoldState>();
  Color _color1 = Colors.amberAccent;
  Color _color2 = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeScaffoldKey,
      resizeToAvoidBottomPadding: false,

      /// Body
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {},
        children: <Widget>[
          /// Page 1
          Contacts(scaffoldKey: _homeScaffoldKey,),

          /// Page 2
          AboutUs(),
        ],

        physics:
            NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),

      /// Floating action button
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.amberAccent,
        child: const Icon(
          Icons.add,
          color: Colors.blue,
          size: 30,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddOrEditContact(
                  title: 'Create Contact',
                  contact: Contact('','',''),
                  scaffoldKey: _homeScaffoldKey,
                )
            ),
          );
        },
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      /// Bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 60),
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              /// Contacts button
              IconButton(
                icon: Icon(Icons.contacts),
                color: _color1,
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(0);
                    _color1 = Colors.amberAccent;
                    _color2 = Colors.white;
                  });
                },
              ),

              /// Profile button
              IconButton(
                icon: Icon(Icons.person),
                color: _color2,
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(1);
                    _color2 = Colors.amberAccent;
                    _color1 = Colors.white;
                  });
                },
              ),
            ],
          ),
        ),
        color: Colors.blue,
      ),
    );
  }
}
