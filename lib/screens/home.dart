import 'package:flutter/material.dart';

import 'about_us.dart';
import 'contacts.dart';
import 'widgets/bottom_sheet.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      /// Body
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {},
        children: <Widget>[
          /// Page 1
          Contacts(),

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
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              isScrollControlled: true,
              enableDrag: true,
              builder: (BuildContext bc) {
                return CustomBottomSheet();
              });
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
                color: Colors.amberAccent,
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(0);
                  });
                },
              ),

              /// Profile button
              IconButton(
                icon: Icon(Icons.person),
                color: Colors.amberAccent,
                iconSize: 30,
                onPressed: () {
                  setState(() {
                    _myPage.jumpToPage(1);
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
