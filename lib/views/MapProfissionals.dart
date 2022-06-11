import '../Utils/export.dart';

class MapProfissionals extends StatefulWidget {
  @override
  _MapProfissionalsState createState() => _MapProfissionalsState();
}

class _MapProfissionalsState extends State<MapProfissionals> {

  Users? _users;
  Completer<GoogleMapController> _controller = Completer();
  double? lat=-23.609368350995943;
  double? lon= -48.05764021588343;

  CameraPosition _positionCamera= CameraPosition(target: LatLng(-23.609368350995943,-48.05764021588343));
  Set<Marker> _markers={};

  _onMapCreated(GoogleMapController controller){
    _controller.complete(controller);
  }
  _locationProfessional(double lat, double lon)async{
    setState(() {
      _positionCamera = CameraPosition(
          target: LatLng(lat,lon),
          zoom: 16
      );
      _animationCamera(_positionCamera);
      _showMarkers(lat,lon);
    });
  }

  _showMarkers(double lat, double lon)async{

    Marker local = Marker(
        markerId:MarkerId("local"),
        position: LatLng(lat,lon),
        infoWindow: InfoWindow(title: "Local do profissional"),
        icon: BitmapDescriptor.defaultMarker
    );

    setState(() {
      _markers.add(local);
    });

  }

  _animationCamera(CameraPosition cameraPosition)async{

    GoogleMapController googleMapController = await _controller.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(cameraPosition)
    );

  }

  @override
  void initState() {
    super.initState();
    _users;
    _locationProfessional(lat!,lon!);
  }

  @override
  Widget build(BuildContext context) {

    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: PaletteColor.scaffold,
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: PaletteColor.primaryColor,
          title: Text('Profissionais'),
          titleTextStyle: TextStyle(
              fontFamily: 'Nunito',
              fontSize: 24,
              fontWeight: FontWeight.bold
          ),
      ),
      bottomSheet: MenuSheet(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Card(
                child: Container(
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition: _positionCamera,
                    onMapCreated: _onMapCreated,
                    markers: _markers,
                  ),
                  width: width,
                  height: height*0.55,
                  color: Colors.white,
                ),
              ),
              Container(
                  height: height*0.16,
                  padding: EdgeInsets.only(right: 4,left: 4,top: 4,bottom: 5),
                  child: ListView.builder(
                    itemCount: allUsers.length,
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return CarrosselProfessionals(
                          onTap: () {
                            setState(() {
                              _markers.clear();
                              lat = allUsers[index].lat;
                              lon = allUsers[index].lon;
                              _locationProfessional(lat!,lon!);
                            });
                          },
                          name: allUsers[index].name,
                          title: allUsers[index].title,
                          photo: allUsers[index].photo,
                        );
                      },
                  ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
