import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'constant.dart';

class ControlPanel extends StatefulWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  State<ControlPanel> createState() => _ControlPanelState();
}

class _ControlPanelState extends State<ControlPanel> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(28.60055781858006, 77.03883377926601);

  Set<Marker> markers = {};
  late BitmapDescriptor markerbitmap;

  List<Marker> pmarkers = [
    Marker(
      markerId: const MarkerId('1'),
      position: const LatLng(28.59731133033196, 77.027904968663),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ),
    Marker(
      markerId: const MarkerId('2'),
      position: const LatLng(28.60672742691892, 77.03551260967092),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ),
    Marker(
      markerId: const MarkerId('3'),
      position: const LatLng(28.601860248258706, 77.04208872455753),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ),
    Marker(
      markerId: const MarkerId('4'),
      position: const LatLng(28.59262777483025, 77.03447272539219),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    ),
    Marker(
      markerId: const MarkerId('5'),
      position: const LatLng(28.59669072197715, 77.04992653590496),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
    )
  ];

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    changeMapMode();
    //Position currentposition = await _determinePosition();

    Geolocator.getPositionStream().listen((event) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(
          const CameraPosition(
              target: LatLng(28.60055781858006, 77.03883377926601),
              zoom: 14.3)));
    });

    markers.clear();

    markers.addAll(pmarkers);

    setState(() {});
  }

  changeMapMode() {
    getJsonFile('assets/darkmap.json').then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapstyle) {
    mapController.setMapStyle(mapstyle);
  }

  // Future<Position> _determinePosition() async {
  //   bool serviceEnabled;
  //   LocationPermission permission;
  //
  //   serviceEnabled = await Geolocator.isLocationServiceEnabled();
  //
  //   if (!serviceEnabled) {
  //     return Future.error('Location services are disabled');
  //   }
  //
  //   permission = await Geolocator.checkPermission();
  //
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //
  //     if (permission == LocationPermission.denied) {
  //       return Future.error('Location permission denied');
  //     }
  //   }
  //
  //   Position position = await Geolocator.getCurrentPosition();
  //   return position;
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: pblack,
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: CircleAvatar(
                    radius: 33,
                    backgroundColor: pyellow,
                    child: SvgPicture.asset('assets/Vector (1).svg'),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Control Panel',
                  style: TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Text(
                  'Welcome to Sherlock',
                  style: TextStyle(
                    fontSize: 16,
                    color: pyellow,
                    fontWeight: FontWeight.normal,
                  ),
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height*0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(
                        'Camera Control',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          color: Colors.transparent,
                          fontWeight: FontWeight.normal,
                          shadows: [
                            Shadow(color: pyellow, offset: const Offset(0, -15))
                          ],
                          decorationColor: pyellow,
                          decorationThickness: 2,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Text(
                        'Sherlock Queue',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          color: Colors.transparent,
                          fontWeight: FontWeight.normal,
                          shadows: [
                            Shadow(
                                color: Color(0xFF989793), offset: Offset(0, -15))
                          ],
                          decorationColor: Colors.transparent,
                          decorationThickness: 2,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                        maxLines: 2,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Text(
                        'High Alert',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontSize: 16,
                          color: Colors.transparent,
                          fontWeight: FontWeight.normal,
                          shadows: [
                            Shadow(
                                color: Color(0xFF989793), offset: Offset(0, -15))
                          ],
                          decorationColor: Colors.transparent,
                          decorationThickness: 2,
                          decorationStyle: TextDecorationStyle.solid,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width*0.9,
                width: MediaQuery.of(context).size.width,
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  mapToolbarEnabled: false,
                  zoomControlsEnabled: false,
                  markers: markers,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 14.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Container(
                  height: MediaQuery.of(context).size.height*0.27,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: const Color(0xFF262931),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                    image: AssetImage('assets/sector5.jpg'),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            SizedBox(
                              height: 80,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30.0),
                                    child: Text(
                                      'Sector 5',
                                      style: TextStyle(
                                        fontSize: 32,
                                        color: pyellow,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 40.0),
                                    child: Text(
                                      'Sector 5, Dwarka, Delhi, 110078',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.normal,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(right: 70.0),
                                    child: Text(
                                      '26th June | Sunday | 3:30 PM',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Color(0xFF777575),
                                        fontWeight: FontWeight.normal,
                                      ),
                                      maxLines: 2,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        RichText(
                          text: TextSpan(
                              text: 'Vehicles Detected Today: ',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF777575),
                                fontSize: 12,
                              ),
                              children: [
                                TextSpan(
                                  text: '3,427',
                                  style: TextStyle(
                                    color: pyellow,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                  ),
                                ),
                              ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: 'Unregistered Vehicles Detected : ',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xFF777575),
                                    fontSize: 14,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: '7',
                                      style: TextStyle(
                                        color: pyellow,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ]),
                            ),
                            const Text('Get More Details', style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.underline
                            ),),
                            Image.asset('assets/image 15 (Traced).png',width: 27, height: 27,),
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(pyellow),
                              ),
                              child: SizedBox(
                                height: 35,
                                width: MediaQuery.of(context).size.width*0.3,
                                child: const Center(
                                  child: Text(
                                    'Add Vehicle to Sherlock',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 9,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width*0.03,
                            ),
                            ElevatedButton(
                              onPressed: () {
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF191C22)),
                              ),
                              child: SizedBox(
                                height: 35,
                                width: MediaQuery.of(context).size.width*0.3,
                                child: const Center(
                                  child: Text(
                                    'Find Data for Missing Car',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 9,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
