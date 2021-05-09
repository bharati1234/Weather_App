import 'package:geolocator/geolocator.dart'
    show Geolocator, LocationAccuracy, Position;

class Location {
  double lattitude;
  double longitude;
  Future<void> getLCurrentocation() async {
    try {
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      lattitude = position.latitude;
      longitude = position.longitude;
      //print('hello');
    } catch (e) {
      print(e);
    }
  }
}
