import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key key,
    @required TextEditingController controller,
    @required String hintText,
    @required IconData icon,
    bool autoValidate,
    Function validator,
    int maxLines,
  })  : _controller = controller,
        _autoValidate = autoValidate,
        _hintText = hintText,
        _icon = icon,
        _validator = validator,
        _maxLines = maxLines,
        super(key: key);

  final TextEditingController _controller;
  final bool _autoValidate;
  final String _hintText;
  final IconData _icon;
  final Function _validator;
  final int _maxLines;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      /// text controller
      controller: _controller,

      autovalidate: _autoValidate?? false,

      /// input validator
      validator: _validator,

      cursorColor: Colors.amber,

      /// text style
      style: TextStyle(
        color: Colors.grey[800],
        fontSize: 18.0,
        fontWeight: FontWeight.w400,
      ),

      /// max lines for input
      maxLines: _maxLines?? 1,

      /// text field decoration
      decoration: InputDecoration(
        hintText: _hintText,

        icon: Icon(
          _icon,
          color: Colors.blue,
          size: 25.0,
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[500],
          ),
        ),

        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),

        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
