import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mcc_project/models/contact.dart';
import 'package:mcc_project/utils/contact_manager.dart';
import 'package:provider/provider.dart';

class CustomBottomSheet extends StatefulWidget {
  @override
  _CustomBottomSheetState createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  final _formKey = GlobalKey<FormState>();

  bool _autoValidate = false;
  String _prefix = '+91';
  Contact _contact = new Contact('', '', '');

  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();


  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _numberController.dispose();
    _emailController.dispose();
    _addressController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        decoration: BoxDecoration(
          /// Rounded corners for the bottom sheet
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),

          /// Color of the bottom sheet
          color: Colors.white,
        ),

        margin: const EdgeInsets.only(top: 150.0),

        child: LayoutBuilder(
          builder: (context, constraint) {
            return SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraint.maxHeight),
                child: IntrinsicHeight(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      25.0,
                      25.0,
                      25.0,
                      50.0,
                    ),
                    child: Form(
                      key: _formKey,

                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 30.0,
                          ),

                          /// Title
                          Center(
                            child: Text(
                              "Create a New Contact",
                              style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.grey[800],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 30.0,
                          ),

                          /// Name text field
                          TextFormField(
                            controller: _nameController,

                            autovalidate: _autoValidate,

                            validator: validateName,

                            cursorColor: Colors.amber,

                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400
                            ),

                            decoration: InputDecoration(
                              hintText: 'Name',

                              icon: Icon(
                                Icons.account_circle,
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
                          ),

                          SizedBox(
                            height: 15.0,
                          ),

                          /// Phone number text field
                          TextFormField(
                            controller: _numberController,

                            autovalidate: _autoValidate,

                            validator: validateNumber,

                            cursorColor: Colors.amber,

                            keyboardType: TextInputType.number,

                            maxLength: 10,

                            maxLengthEnforced: true,

                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400
                            ),

                            decoration: InputDecoration(
                              hintText: 'Phone Number',

                              counterText: '',

                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: DropdownButton(
                                  value: _prefix,
                                  items: [
                                    DropdownMenuItem(
                                      child: Text(
                                        '022',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      value: '022',
                                      onTap: () {},
                                    ),
                                    DropdownMenuItem(
                                      child: Text(
                                        '+91',
                                        style: TextStyle(
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                      value: '+91',
                                      onTap: () {},
                                    ),
                                  ],
                                  onChanged: (value) {
                                    setState(() {
                                      _prefix = value;
                                    });
                                  },
                                ),
                              ),

                              icon: Icon(
                                Icons.phone,
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
                          ),

                          SizedBox(
                            height: 15.0,
                          ),

                          /// Email text field
                          TextFormField(
                            controller: _emailController,

                            autovalidate: _autoValidate,

                            validator: validateEmail,

                            cursorColor: Colors.amber,

                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400
                            ),

                            decoration: InputDecoration(
                              hintText: 'Email ID',

                              icon: Icon(
                                Icons.email,
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
                          ),

                          SizedBox(
                            height: 15.0,
                          ),

                          /// Address text field
                          TextFormField(
                            controller: _addressController,

                            autovalidate: _autoValidate,

                            cursorColor: Colors.amber,

                            style: TextStyle(
                                color: Colors.grey[800],
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400
                            ),

                            maxLines: 4,

                            decoration: InputDecoration(
                              hintText: 'Address',

                              icon: Icon(
                                Icons.add_location,
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
                          ),

                          SizedBox(
                            height: 50.0,
                          ),

                          Center(
                            child: FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              color: Colors.blue,
                              textColor: Colors.amberAccent,
                              padding: EdgeInsets.all(20.0),
                              splashColor: Colors.blueAccent,
                              onPressed: () {
                                _validateInputs();
                              },
                              child: Text(
                                "Add to Contacts",
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),

                          Spacer(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        ),
      ),
    );
  }

  String validateName(String name) {
    if (name.length < 2)
      return 'Name must be more than 1 character';
    else
      return null;
  }

  String validateNumber(String phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return 'Enter a phone number';
    }

    if (_prefix == '022') {
      if (phoneNumber.length < 8) {
        return 'Enter a valid phone number';
      }
      return null;
    } else {
      if (phoneNumber.length < 10) {
        return 'Enter a valid phone number';
      }
      return null;
    }
  }

  String validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (email.isNotEmpty)
      if(!regex.hasMatch(email))
        return 'Enter a valid email ID';
      else
        return null;
    else
      return null;
  }

  void _validateInputs() {
    if (_formKey.currentState.validate()) {
      _addToDatabase();
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }

  void _addToDatabase() {
    _contact.name = _nameController.text;
    _contact.phoneNumber = _prefix + ' ' + _numberController.text;
    _contact.address = _addressController.text;
    _contact.email = _emailController.text;

    final result = Provider.of<ContactManager>(
        context, listen: false).addContact(_contact);
    result.then((value) {
      if (value) {
        log('Contact added successfully');
        Navigator.pop(context);
      } else {
        log('Failed to add contact');
      }
    });
  }
}
