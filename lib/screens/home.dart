import 'package:flutter/material.dart';
import 'package:mcc_project/screens/contacts.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController _myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// Page viewer
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {
        },
        children: <Widget>[
          /// Page 1
          Center(
            child: Contacts(),
          ),

          /// Page 2
          Center(
            child: Container(
              color: Colors.green,
              child: Text('Empty Body 1'),
            ),
          ),
        ],

        physics: NeverScrollableScrollPhysics(), // Comment this if you need to use Swipe.
      ),


      /// Floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amberAccent,
        child: const Icon(
          Icons.add,
          color: Colors.blue,
          size: 30,
        ),
        onPressed: () {},
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      /// Bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 60
          ),
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
