class Contact{
  int _id;
  String _name;
  String _phoneNumber;
  String _email;
  String _address;

  Contact(this._name, this._phoneNumber, this._address, [this._email]);

  Contact.withId(this._id, this._name, this._phoneNumber, this._address, [this._email]);

  int get id => _id;
  String get name => _name;
  String get phoneNumber => _phoneNumber;
  String get address => _address;
  String get email => _email;

  set name (String newName) {
    if (newName.length <= 255) {
      this._name = newName;
    }
  }

  set phoneNumber (String newNumber) {
    this._phoneNumber = newNumber;
  }

  set address (String newAddress) {
    this._address = newAddress;
  }

  set email (String newEmail) {
    this._email = newEmail;
  }

  // Convert a Contact object into a Map object
  Map<String, dynamic> toMap() {

    var map = Map<String, dynamic>();
    if (id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['phone_number'] = _phoneNumber;
    map['address'] = _address;
    map['email'] = _email;

    return map;
  }

  // Extract a Contact object from a Map object
  Contact.fromMapObject(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._phoneNumber = map['phone_number'];
    this._address = map['address'];
    this._email = map['email'];
  }
}