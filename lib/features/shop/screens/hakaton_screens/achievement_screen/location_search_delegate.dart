import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  // late GoogleMapController mapController;
  // final LatLng _center = const LatLng(45.521563, -122.677433); // Default location
  // LatLng _lastMapPosition = const LatLng(45.521563, -122.677433);

  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  // void _onCameraMove(CameraPosition position) {
  //   _lastMapPosition = position.target;
  // }

  void _onAddMarkerButtonPressed() {
    // setState(() {
    //   // Add a marker to the map
    //   mapController.addMarker(
    //     MarkerOptions(
    //       position: _lastMapPosition,
    //       infoWindowText: InfoWindowText('Your Location', 'This is your selected location'),
    //     ),
    //   );
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
    // return new Scaffold(
    //   body: GoogleMap(
    //     onMapCreated: _onMapCreated,
    //     initialCameraPosition: CameraPosition(
    //       target: _center,
    //       zoom: 11.0,
    //     ),
    //     onCameraMove: _onCameraMove,
    //     markers: Set<Marker>.of(
    //       <Marker>[
    //         Marker(
    //           // This marker id can be anything that uniquely identifies each marker.
    //           markerId: MarkerId('selected-location'),
    //           position: _lastMapPosition,
    //           infoWindow: InfoWindow(title: 'Selected Location', snippet: 'This is a snippet'),
    //           icon: BitmapDescriptor.defaultMarker,
    //         ),
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _onAddMarkerButtonPressed,
    //     tooltip: 'Add Marker',
    //     child: Icon(Icons.add_location),
    //   ),
    // );
  }
}
