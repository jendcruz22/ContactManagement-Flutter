import 'dart:async';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:mcc_project/models/contact.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapScreen extends StatefulWidget {
  final Contact contact;

  MapScreen({this.contact});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var location = Location();
  Completer<GoogleMapController> _controller = Completer();
  static LatLng _initialPosition;
  final Set<Marker> _markers = {};
  final _key = GlobalKey<ScaffoldState>();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  /// Gets user location
  void getLocation() async {
    try {
      /// Requests user location from device using GPS
      var userLocation = await location.getLocation();

      setState(() {
        /// Sets the initial position of the center of the map
        _initialPosition =
            LatLng(userLocation.latitude, userLocation.longitude);

        /// Adds a marker of the current location to the map
        _markers.add(Marker(
          markerId: MarkerId('You'),
          position: _initialPosition,
          infoWindow: InfoWindow(
            title: 'Your current position',
            snippet: 'Latitude: ${userLocation.latitude},'
                ' Longitude: ${userLocation.longitude}',
          ),
          icon: BitmapDescriptor.defaultMarker,
        ));
      });
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      
      /// Appbar
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue,
        title: Text(
          'Map',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w700,
            color: Colors.amberAccent,
          ),
        ),
        centerTitle: true,
      ),

      /// Body
      body: _initialPosition == null
          ? Container()
          : Stack(
              children: [

                /// Full screen Google map widget
                GoogleMap(
                  onMapCreated: _onMapCreated,
                  markers: _markers,
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 18.0,
                  ),
                ),

                /// Cards
                Align(
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.0,
                      ),

                      /// Your location card
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 20,
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Text(
                                'is your current location.',
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Colors.grey[800],
                                  fontWeight: FontWeight.w500,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 5.0,
                      ),

                      /// Tap to navigate to address card
                      Card(
                        child: InkWell(
                          splashColor: Colors.blue.withOpacity(0.05),

                          /// Opens google maps
                          onTap: () {
                            _launchURL('https://www.google.com/maps/search/?api=1&query=${widget.contact.address}');
                          },

                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              'Tap to navigate to : ${widget.contact.address}',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.grey[800],
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }

  /// launches url
  _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      );
    } else {
      showSnackbar('Cannot launch url: $url');
    }
  }

  /// shows snackbar on url launch error
  showSnackbar(String message) {
    _key.currentState.showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 5),
    ));
  }
}
