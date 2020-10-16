import 'package:flutter/material.dart';

class ContactDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(150.0),
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: 20.0,
            ),
            child: Column(
              children: [
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

                Text(
                  'Daniel Lobo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 30.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.phone,
                      color: Colors.grey[800],
                      size: 25,
                    ),

                    SizedBox(
                      width: 20,
                    ),

                    Text(
                      '+91 98089998989',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[750],
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),

            SizedBox(
              height: 10,
            ),

            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.email,
                      color: Colors.grey[750],
                      size: 25,
                    ),

                    SizedBox(
                      width: 20,
                    ),

                    Text(
                      'email@email.com',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey[750],
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}
