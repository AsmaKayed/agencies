
import 'dart:async';

import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'moreDetails.dart';


class MapLusail extends StatefulWidget {
  const MapLusail({Key? key}) : super(key: key);

  @override
  _MapLusailState createState() => _MapLusailState();
}

class _MapLusailState extends State<MapLusail> {
  StreamSubscription? _locationSubscription;
  Location _locationTracker = Location();
  Marker? marker;
  Circle? circle;
  GoogleMapController? _controller;

  static final CameraPosition initialLocation = CameraPosition(
    target: LatLng(25.391450, 51.517370),
    zoom: 14.4746,
  );

  Future<Uint8List> getMarker() async {
    ByteData byteData = await DefaultAssetBundle.of(context).load("assets/logo.jpg");
    return byteData.buffer.asUint8List();
  }

  void updateMarkerAndCircle(LocationData newLocalData, Uint8List imageData) {
    LatLng latlng = LatLng(newLocalData.latitude!, newLocalData.longitude!);
    this.setState(() {
      marker = Marker(
          markerId: MarkerId("home"),
          position: latlng,
          rotation: newLocalData.heading!,
          draggable: false,
          zIndex: 2,
          flat: true,
          anchor: Offset(0.5, 0.5),
          icon: BitmapDescriptor.fromBytes(imageData));
      circle = Circle(
          circleId: CircleId("car"),
          radius: newLocalData.accuracy!,
          zIndex: 1,
          strokeColor: Colors.blue,
          center: latlng,
          fillColor: Colors.blue.withAlpha(70));
    });
  }

  void getCurrentLocation() async {
    try {

      if (_locationSubscription != null) {
        _locationSubscription!.cancel();
      }


      _locationSubscription = _locationTracker.onLocationChanged.listen((newLocalData) async {
        if (_controller != null) {
          Uint8List imageData = await getMarker();
          _controller!.animateCamera(CameraUpdate.newCameraPosition(new CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(newLocalData.latitude!, newLocalData.longitude!),
              tilt: 0,
              zoom: 18.00)));
          updateMarkerAndCircle(newLocalData, imageData);
        }
      });

      // ignore: nullable_type_in_catch_clause
    } on PlatformException catch (e) {
      if (e.code == 'PERMISSION_DENIED') {
        debugPrint("Permission Denied");
      }
    }
  }
  @override
  void dispose() {
    if (_locationSubscription != null) {
      _locationSubscription!.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(children:[Padding(
          padding: const EdgeInsets.only(left: 0,right: 10,top: 7.0),
          child: Container(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                if (Platform.isAndroid) {
                  Navigator.pop( context, MaterialPageRoute(builder: (context)=>MoreDetails()),);
                } else if (Platform.isIOS) {
                  exit(0);
                }
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
            ),),
        ),




        ]),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: initialLocation,
        markers: Set.of((marker != null) ? [marker!] : []),
        circles: Set.of((circle != null) ? [circle!] : []),
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
        },

      ),
      // floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.location_searching),
      //     onPressed: () {
      //       getCurrentLocation();
      //     }),

    );
  }
}
