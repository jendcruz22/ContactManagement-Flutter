import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'widgets/about_us_card.dart';

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
            color: Colors.amberAccent,
          ),
        ),
        centerTitle: true,
      ),

      /// Body
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// Card for Daniel Lobo
            AboutUsCard(
              image: 'images/dan.jpg',
              name: 'Daniel Lobo',
              year: 'BE CMPN A - 07',
              pid: 'PID: 172028',
              email: 'danlobo1999@gmail.com',
            ),

            /// Card for Jenny Dcruz
            AboutUsCard(
              image: 'images/jen.jpg',
              name: 'Jenny Dcruz',
              year: 'BE CMPN A - 16',
              pid: 'PID: 172047',
              email: 'jendcruz23@gmail.com',
            ),
          ],
        ),
      ),
    );
  }
}
