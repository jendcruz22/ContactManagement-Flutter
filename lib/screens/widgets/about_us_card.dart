import 'package:flutter/material.dart';

class AboutUsCard extends StatelessWidget {
  const AboutUsCard({
    Key key,
    @required this.image,
    @required this.name,
    @required this.year,
    @required this.pid,
    @required this.email,
  }) : super(key: key);

  final String image;
  final String name;
  final String year;
  final String pid;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                backgroundImage: AssetImage(image),
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
                  name,
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
                      year,
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
                      pid,
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
                      email,
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
    );
  }
}
