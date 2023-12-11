import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:hital_shop/helpers/widgets/appbar_widget.dart';
import 'package:hital_shop/helpers/widgets/button_widget.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({
    super.key,
    required this.onSelected,
  });

  @override
  State<MapPage> createState() => _MapPageState();

  final Function(String latlong) onSelected;
}

class _MapPageState extends State<MapPage> {
  double zoom = 14;

  @override
  void initState() {
    _determinePosition();
    super.initState();
  }

  LatLng? selectedLocation;

  List<Marker> markers = [];
  MapController mapController = MapController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const AppbarWidget(
              title: 'انتخاب آدرس روی نقشه',
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Theme.of(context).dividerColor),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: FlutterMap(
                      mapController: mapController,
                      options: MapOptions(
                        initialCenter: const LatLng(35.7628748, 51.7841747),
                        initialZoom: zoom,
                        zoom: zoom,
                        onTap: (tapPosition, point) {
                          setState(() {
                            markers.clear();
                            markers.add(
                              Marker(
                                point: point,
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.red,
                                  size: 50,
                                ),
                              ),
                            );
                            selectedLocation = point;
                          });
                        },
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName: 'com.example.app',
                        ),
                        MarkerLayer(
                          markers: markers,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 33),
              child: ButtonWidget(
                title: 'ثبت موقعیت مکانی',
                onPressed: () {
                  widget.onSelected(
                      '${selectedLocation?.latitude},${selectedLocation?.longitude}');
                  Get.back();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position position = await Geolocator.getCurrentPosition();

    selectedLocation = LatLng(position.latitude, position.longitude);

    mapController.move(LatLng(position.latitude, position.longitude), 14);

    markers.add(
      Marker(
        point: LatLng(position.latitude, position.longitude),
        child: const Icon(
          Icons.location_on,
          color: Colors.blue,
          size: 50,
        ),
      ),
    );

    setState(() {});
  }
}
