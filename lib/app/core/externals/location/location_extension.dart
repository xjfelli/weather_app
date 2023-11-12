import 'package:geocoding/geocoding.dart';
import 'package:result_dart/result_dart.dart';
import 'package:weather_app/app/core/externals/location/location_entity.dart';

abstract class LocationExtension {
  AsyncResult<LocationEntity, Exception> determinePosition();
  AsyncResult<Placemark, Exception> getPositionAddress(
      double latitude, double longitude);
}
