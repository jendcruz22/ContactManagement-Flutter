import 'package:flutter/material.dart';

class ContactDetailCard extends StatelessWidget {
  const ContactDetailCard({
    Key key,
    @required Function function,
    @required IconData icon,
    @required String text,
  }) : _function = function, _icon = icon, _text = text, super(key: key);

  final Function _function;
  final IconData _icon;
  final String _text;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        /// Function to be called when the card is tapped
        onTap: _function,

        splashColor: Colors.blue.withOpacity(0.05),

        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              /// Icon for the card
              Icon(
                _icon,
                color: Colors.grey[800],
                size: 25,
              ),

              SizedBox(
                width: 20,
              ),

              /// Text of the card
              Expanded(
                child: Text(
                  _text,
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.grey[750],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
