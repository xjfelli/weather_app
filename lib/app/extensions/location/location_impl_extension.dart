import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:result_dart/result_dart.dart';
import 'package:weather_app/app/extensions/location/location_entity.dart';
import 'package:weather_app/app/extensions/location/location_extension.dart';

class LocationImplExtension implements LocationExtension {
  @override
  AsyncResult<LocationEntity, Exception> determinePosition() async {
    bool isServiceEnabled;
    LocationPermission permission;

    isServiceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!isServiceEnabled) {
      return Failure(Exception('Location services are disabled.'));
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

    final result = await Geolocator.getCurrentPosition();
    final address = await getPositionAddress(result.latitude, result.longitude)
        .map((success) => LocationEntity(position: result, placemark: success))
        .mapError((error) => error);

    return address;
  }

  @override
  AsyncResult<Placemark, Exception> getPositionAddress(
      double latitude, double longitude) async {
    final response = await placemarkFromCoordinates(latitude, longitude);

    if (response.isEmpty) {
      return Failure(Exception('Address not found'));
    }

    return Success(response[0]);
  }
}
