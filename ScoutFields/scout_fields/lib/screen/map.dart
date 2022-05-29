// ignore_for_file: unnecessary_const, unnecessary_new
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();

  // ignore: prefer_const_declarations
  static final CameraPosition anitKabir = const CameraPosition(
    target: const LatLng(39.925080, 32.837086),
    zoom: 16.4746,
  );

  // ignore: prefer_const_constructors
  static final CameraPosition _fakulte = CameraPosition(
      //bearing: 192.8334901395799, verilen derece ile konum saat yönünde döndürülür
      target: const LatLng(40.742208, 30.3257),
      //tilt: 45.440717697143555, verilen konumun kamera acısı
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.hybrid,
        initialCameraPosition: anitKabir,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _fakulteyeGit,
        label: const Text('Fakülteye Git'),
        icon: const Icon(Icons.school),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Future<void> _fakulteyeGit() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_fakulte));
  }
}
