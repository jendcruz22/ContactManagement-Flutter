import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';

class Contacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      /// Appbar
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Contacts',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),

      /// Body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [

          /// Search bar
          SizedBox(
            height: 90,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SearchBar(
                shrinkWrap: true,
              ),
            ),
          ),

          /// List view
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 4.0,
                    ),
                    child: buildCard(),
                  );
                }),
          ),
        ],
      ),
    );
  }

  /// Card
  Card buildCard() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(90),
                color: Colors.red,
              ),
              width: 70,
              height: 70,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              'Name',
              style: TextStyle(
                color: Colors.grey[800],
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
            Spacer(),
            Icon(
              Icons.info_outline,
            ),
          ],
        ),
      ),
    );
  }
}
