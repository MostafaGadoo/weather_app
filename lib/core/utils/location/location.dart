import 'package:location/location.dart';

Location location = Location();


Future<LocationData?> getLocation() async{
  bool serviceEnabled;
  PermissionStatus permissionStatus;
  LocationData locationData;

  serviceEnabled = await location.serviceEnabled();
  if(serviceEnabled) {
    serviceEnabled = await location.requestService();
    if(!serviceEnabled){
      return null;
    }
  }
  // location.onLocationChanged.listen((LocationData currentLocation){});
  locationData = (await location.getLocation()) as LocationData;
  return locationData;
}

class LocationData{
  final double latitude;
  final double longitude;
  final double accuracy;
  final double altitude;
  final double speed;
  final double speedAccuracy;
  final double heading;
  final double time;
  final bool isMock;

  LocationData(
      {required this.latitude,
      required this.longitude,
      required this.accuracy,
      required this.altitude,
      required this.speed,
      required this.speedAccuracy,
      required this.heading,
      required this.time,
      required this.isMock,
      });
}

