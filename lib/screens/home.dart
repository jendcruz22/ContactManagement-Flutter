import 'package:flutter/material.dart';
import 'package:mcc_project/screens/about_us.dart';
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
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    color: Colors.white,
                  ),
                  margin: EdgeInsets.only(
                    top: 150.0,
                  ),
                  height: 500.0,

                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: new Wrap(
                      children: <Widget>[

                        Center(
                          child: Text(
                            "New Contacts",
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey[800],
                            ),
                          ),
                        ),

                        SizedBox(height: 40.0,),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            cursorColor: Colors.amber,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              icon: Icon(
                                Icons.account_circle_rounded,
                                color: Colors.blue,
                              ),
                              hintText: 'Name',
                              focusColor: Colors.blue,
                              ),
                            ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            cursorColor: Colors.amber,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                    color: Colors.blue,
                                    style: BorderStyle.solid,
                                ),
                              ),
                              icon: Icon(
                                Icons.phone,
                                color: Colors.blue,
                              ),
                              hintText:  'Number',
                              focusColor: Colors.blue,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            cursorColor: Colors.amber,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              icon: Icon(
                                Icons.email,
                                color: Colors.blue,
                              ),
                              hintText:  'Email ID',
                              focusColor: Colors.blue,
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            cursorColor: Colors.amber,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: BorderSide(
                                  color: Colors.blue,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              icon: Icon(
                                Icons.add_location_sharp,
                                color: Colors.blue,
                              ),
                              hintText:  'Address',
                              focusColor: Colors.blue,
                            ),
                          ),
                        ),

                        SizedBox(height: 80.0,),

                        Center(
                            child: FlatButton(
                              color: Colors.blue,
                              textColor: Colors.white,
                              disabledColor: Colors.grey,
                              disabledTextColor: Colors.black,
                              padding: EdgeInsets.all(8.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                /*...*/
                              },
                              child: Text(
                                "Add to Contacts",
                                style: TextStyle(fontSize: 20.0),
                              ),
                            )
                        ),

                      ],
                    ),
                  ),
                );
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
