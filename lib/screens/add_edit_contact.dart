import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:mcc_project/models/contact.dart';
import 'package:mcc_project/utils/contact_manager.dart';
import 'package:provider/provider.dart';
import 'widgets/input_field.dart';

class AddOrEditContact extends StatefulWidget {
  final String title;
  final Contact contact;
  final GlobalKey<ScaffoldState> scaffoldKey;
  AddOrEditContact({this.title, this.contact, this.scaffoldKey});

  @override
  _AddOrEditContactState createState() => _AddOrEditContactState();
}

class _AddOrEditContactState extends State<AddOrEditContact> {
  final _formKey = GlobalKey<FormState>();

  String _prefix = '+91';
  bool _autoValidate = false;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _numberController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.title == 'Edit Contact') {
      _nameController.text = widget.contact.name;
      _emailController.text = widget.contact.email;
      _numberController.text = widget.contact.phoneNumber.substring(4);
      _addressController.text = widget.contact.address;
    }
  }

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
    return Scaffold(
      backgroundColor: Colors.white,

      /// Appbar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.amberAccent,
          ),
        ),
        centerTitle: true,
      ),

      /// body
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25.0,
            vertical: 50.0,
          ),
          child: buildForm(),
        ),
      ),
    );
  }

  Form buildForm() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[

            /// Name text field
            InputField(
              controller: _nameController,
              autoValidate: _autoValidate,
              validator: validateName,
              hintText: 'Name',
              icon: Icons.person,
            ),

            SizedBox(
              height: 30.0,
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
                  fontWeight: FontWeight.w400),
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
              height: 30.0,
            ),

            /// Email text field
            InputField(
              controller: _emailController,
              autoValidate: _autoValidate,
              validator: validateEmail,
              hintText: 'Email ID',
              icon: Icons.email,
            ),

            SizedBox(
              height: 30.0,
            ),

            /// Address text field
            InputField(
              controller: _addressController,
              hintText: 'Address',
              icon: Icons.add_location,
              maxLines: 4,
            ),

            SizedBox(
              height: 30.0,
            ),

            Center(
              child: FlatButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.blue,
                textColor: Colors.amberAccent,
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0,
                  vertical: 20.0,
                ),
                splashColor: Colors.blueAccent,
                onPressed: () {
                  _validateInputs();
                },
                child: Text(
                  widget.title == 'Edit Contact'
                    ? "Save Contact"
                      :"Add Contact",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Name validator
  String validateName(String name) {
    if (name.length < 2)
      return 'Name must be more than 1 character';
    else
      return null;
  }

  /// phone number validator
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

  /// Email validator
  String validateEmail(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (email.isNotEmpty) if (!regex.hasMatch(email))
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
    widget.contact.name = _nameController.text;
    widget.contact.phoneNumber = _prefix + ' ' + _numberController.text;
    widget.contact.address = _addressController.text;
    widget.contact.email = _emailController.text;

    /// Update existing contact in database
    if (widget.title == 'Edit Contact') {
      final result = Provider.of<ContactManager>(context, listen: false)
          .editContact(widget.contact);
      result.then((value) {
        if (value) {
          log('Updated contact successfully');
          Navigator.pop(context);
          widget.scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('Updated contact successfully'),
          ));
        } else {
          log('Failed to update contact');
          widget.scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('Failed to update contact'),
          ));
        }
      });
    }

    /// Add new contact to database
    else {
      final result = Provider.of<ContactManager>(context, listen: false)
          .addContact(widget.contact);
      result.then((value) {
        if (value) {
          log('Contact added successfully');
          Navigator.pop(context);
          widget.scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('Contact added successfully'),
          ));
        } else {
          log('Failed to add contact');
          widget.scaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text('Failed to add contact'),
          ));
        }
      });
    }
  }
}
