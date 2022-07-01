import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:thirdeye/constant.dart';
import 'package:thirdeye/controlpanelpage.dart';
import 'package:thirdeye/reportpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(28.5279118, 77.2088987);

  Set<Marker> markers = {};
  late BitmapDescriptor markerbitmap;

  void _onMapCreated(GoogleMapController controller) async {
    mapController = controller;
    changeMapMode();
    Position currentposition = await _determinePosition();

    Geolocator.getPositionStream().listen((event) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(currentposition.latitude, currentposition.longitude),
          zoom: 16)));
    });

    markers.clear();

    markers.add(Marker(
      markerId: const MarkerId('cl'),
      position: LatLng(currentposition.latitude, currentposition.longitude),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow),
      //icon: await MarkerIcon.downloadResizePictureCircle('https://i.pinimg.com/564x/7a/51/3f/7a513f287cf3cf242906676fac29e34c.jpg'),
      //icon: BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_AZURE),
    ));

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BitmapDescriptor.fromAssetImage(
      const ImageConfiguration(size: Size(12, 12)),
      'assets/placeholder 1.png',
    ).then((onValue) {
      markerbitmap = onValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 65,
              child: ColorFiltered(
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.3), BlendMode.srcOver),
                child: GoogleMap(
                  onMapCreated: _onMapCreated,
                  mapToolbarEnabled: false,
                  zoomControlsEnabled: false,
                  markers: markers,
                  mapType: MapType.normal,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 15.0,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 30,
              right: 20,
              left: 20,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 66,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: pblack.withOpacity(0.8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SvgPicture.asset('assets/menu.svg'),
                    const Text(
                      'Search for a place',
                      style: TextStyle(
                        color: Color(0xFF4E4E4E),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.1,
                    ),
                    SvgPicture.asset('assets/search.svg'),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 110,
                left: 10,
                right: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: GestureDetector(
                          onTap: () {},
                          child: Image.asset('assets/Group 44.png'),
                        ),
                      ),
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: GestureDetector(
                            onTap: () {},
                            child: Image.asset('assets/Group 45.png')),
                      ),
                    ),
                  ],
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                height: 66,
                decoration: BoxDecoration(
                  color: pblack,
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const ReportPage(),
                                          type: PageTransitionType.rightToLeft));
                                },
                                child: SvgPicture.asset('assets/report.svg')),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          child: const ControlPanel(),
                                          type: PageTransitionType.rightToLeft));
                                },
                                child: SvgPicture.asset('assets/Vector.svg')),
                            Icon(
                              Icons.home,
                              color: pblack,
                            ),
                            SvgPicture.asset(
                                'assets/supervised_user_circle.svg'),
                            SvgPicture.asset('assets/settings.svg'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 15,
              left: 145,
              right: 145,
              child: CircleAvatar(
                radius: 43,
                backgroundColor: pblack,
                child: Icon(
                  Icons.home,
                  color: pyellow,
                  size: 40,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permission denied');
      }
    }

    Position position = await Geolocator.getCurrentPosition();
    return position;
  }
}
