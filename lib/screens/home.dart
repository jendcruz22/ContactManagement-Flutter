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

      /// Body
      body: PageView(
        controller: _myPage,
        onPageChanged: (int) {},
        children: <Widget>[
          /// Page 1
          Center(
            child: Contacts(),
          ),

          /// Page 2
          Padding(
          padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 100.0,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 40.0,),

                      CircleAvatar(
                        backgroundImage: AssetImage('images/jen.jpg'),
                        radius: 80.0,
                      ),

                      SizedBox(width: 30.0,),

                      CircleAvatar(
                        backgroundImage: AssetImage('images/dan.jpg'),
                        radius: 80.0,
                      ),
                    ],
                  ),

                  Divider(
                    height: 50.0,
                    color: Colors.grey[800],
                  ),

                  //Names
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 50.0,),
                      SizedBox(width: 5.0,),
                      Text(
                        'Jenny Dcruz',
                        style: TextStyle(
                          color: Colors.amber,
                          letterSpacing: 2.0,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(width: 35.0,),

                      Text(
                        'Daniel Lobo',
                        style: TextStyle(
                          color: Colors.amber,
                          letterSpacing: 2.0,
                          fontSize: 28.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(width: 15.0,),

                      Icon(
                        Icons.account_circle,
                        size: 18.0,
                        color:Colors.grey[800],
                      ),

                      SizedBox(width: 5.0,),

                      Text(
                          'BE CMPN A - 16',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                          )
                      ),

                      SizedBox(width: 30.0,),

                      Icon(
                        Icons.account_circle,
                        size: 18.0,
                        color:Colors.grey[800],
                      ),

                      SizedBox(width: 5.0,),

                      Text(
                          'BE CMPN A - 07',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 20.0,
                            letterSpacing: 1.0,
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 10.0,),

                  Row(
                    children: <Widget>[
                      SizedBox(width: 40.0,),

                      Icon(
                        Icons.work_rounded,
                        size: 18.0,
                        color:Colors.grey[800],
                      ),

                      SizedBox(width: 10.0,),

                      Text(
                          'PID 172047',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 18.0,
                            letterSpacing: 1.0,
                          )
                      ),

                      SizedBox(width: 80.0,),

                      Icon(
                        Icons.work_rounded,
                        size: 18.0,
                        color:Colors.grey[800],
                      ),

                      SizedBox(width: 10.0,),

                      Text(
                          'PID 172047',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 18.0,
                            letterSpacing: 1.0,
                          )
                      ),
                    ],
                  ),

                  SizedBox(height: 10.0,),

                  Row(
                    children: <Widget>[
                      SizedBox(width: 30.0,),
                      Icon(
                        Icons.email,
                        size: 12.0,
                        color:Colors.grey[800],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                          'jendcruz23@gmail.com',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12.0,
                            letterSpacing: 1.0,
                          )
                      ),

                      SizedBox(width: 20.0,),

                      Icon(
                        Icons.email,
                        size: 12.0,
                        color:Colors.grey[800],
                      ),
                      SizedBox(
                        width: 10.0,
                      ),
                      Text(
                          'danlobo1999@gmail.com',
                          style: TextStyle(
                            color: Colors.grey[800],
                            fontSize: 12.0,
                            letterSpacing: 1.0,
                          )
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ),
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
                  // height: 500.0,
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
