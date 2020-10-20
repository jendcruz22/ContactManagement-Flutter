import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          'About Us',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),

        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,

            children: <Widget>[
              /// Images
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Column(
                  children: [

                    SizedBox(height: 30.0,),

                    Container(
                      child: new Stack(
                        children: <Widget>[
                          Card(
                            child: Container(
                              height: 200.0,
                              color: Colors.blue,
                            ),
                          ),
                          FractionalTranslation(
                            translation: Offset(0.0, -0.4),
                            child: Align(
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/dan.jpg'),
                                radius: 50.0,
                              ),
                              alignment: FractionalOffset(0.5, 0.0),
                            ),
                          ),

                          Center(
                            child:
                            Column(
                              children: [

                                SizedBox(height: 70.0,),

                                Text(
                                  'Daniel Lobo',
                                  style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w900,
                                    letterSpacing: 3.0
                                  ),
                                ),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: 120.0,
                                      height: 40.0,),

                                    Icon(
                                      Icons.person,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),

                                    SizedBox(width: 5.0,),

                                    Text(
                                      'BE CMPN A - 07',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: 130.0,
                                      ),

                                    Icon(
                                      Icons.work,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),

                                    SizedBox(width: 5.0,),

                                    Text(
                                      'PID: 172047',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: 90.0,
                                      height: 40.0,),

                                    Icon(
                                      Icons.email,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),

                                    SizedBox(width: 5.0,),

                                    Text(
                                      'danlobo1999@gmail.com',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),

                    SizedBox(height: 50.0,),
                    Container(
                      child: new Stack(
                        children: <Widget>[
                          Card(
                            child: Container(
                              height: 200.0,
                              color: Colors.blue,
                            ),
                          ),
                          FractionalTranslation(
                            translation: Offset(0.0, -0.4),
                            child: Align(
                              child: CircleAvatar(
                                backgroundImage: AssetImage('images/jen.jpg'),
                                radius: 50.0,
                              ),
                              alignment: FractionalOffset(0.5, 0.0),
                            ),
                          ),

                          Center(
                            child:
                            Column(
                              children: [

                                SizedBox(height: 70.0,),

                                Text(
                                  'Jenny Dcruz',
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w900,
                                      letterSpacing: 3.0
                                  ),
                                ),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: 120.0,
                                      height: 40.0,),

                                    Icon(
                                      Icons.person,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),

                                    SizedBox(width: 5.0,),

                                    Text(
                                      'BE CMPN A -16',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: 130.0,
                                    ),

                                    Icon(
                                      Icons.work,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),

                                    SizedBox(width: 5.0,),

                                    Text(
                                      'PID: 172047',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    SizedBox(
                                      width: 100.0,
                                      height: 40.0,),

                                    Icon(
                                      Icons.email,
                                      size: 15.0,
                                      color: Colors.white,
                                    ),

                                    SizedBox(width: 5.0,),

                                    Text(
                                      'jendcruz23@gmail.com',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15.0,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
        ),
      ),
    );
  }
}
