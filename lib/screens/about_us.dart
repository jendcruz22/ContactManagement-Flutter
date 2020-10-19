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

      /// Body
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 100.0,
            ),

            /// Images
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // SizedBox(
                //   width: 40.0,
                // ),
                CircleAvatar(
                  backgroundImage: AssetImage('images/jen.jpg'),
                  radius: 80.0,
                ),
                // SizedBox(
                //   width: 30.0,
                // ),
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

            /// Names
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'Jenny Dcruz',
                  style: TextStyle(
                    color: Colors.amber,
                    letterSpacing: 2.0,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 35.0,
                ),
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

            /// Class
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 15.0,
                ),
                Icon(
                  Icons.account_circle,
                  size: 18.0,
                  color: Colors.grey[800],
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'BE CMPN A - 16',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(
                  width: 30.0,
                ),
                Icon(
                  Icons.account_circle,
                  size: 18.0,
                  color: Colors.grey[800],
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  'BE CMPN A - 07',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 20.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 10.0,
            ),

            /// PIDs
            Row(
              children: <Widget>[
                SizedBox(
                  width: 40.0,
                ),
                Icon(
                  Icons.work,
                  size: 18.0,
                  color: Colors.grey[800],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'PID 172047',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
                SizedBox(
                  width: 80.0,
                ),
                Icon(
                  Icons.work,
                  size: 18.0,
                  color: Colors.grey[800],
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text(
                  'PID 172047',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 18.0,
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: 10.0,
            ),

            /// Emails
            Row(
              children: <Widget>[
                SizedBox(
                  width: 30.0,
                ),
                Icon(
                  Icons.email,
                  size: 12.0,
                  color: Colors.grey[800],
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
                  ),
                ),
                SizedBox(
                  width: 20.0,
                ),
                Icon(
                  Icons.email,
                  size: 12.0,
                  color: Colors.grey[800],
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
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
