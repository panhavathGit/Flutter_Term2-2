import 'package:week5/Exercise1/model/ride/ride_filter.dart';
import 'package:week5/Exercise1/model/ride/ride_pref.dart';
import 'package:week5/Exercise1/repository/rides_repository.dart';

import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
///
///

class RidesService {
  // Private instance
  static RidesService? _instance;

  // Repository
  final RidesRepository repository;

  /// Private constructor
  RidesService._internal(this.repository);


  /// Initialize
  static void initialize(RidesRepository repository) {
    if (_instance == null) {
      _instance = RidesService._internal(repository);
    } else {
      throw Exception("Rides Service is already initialized.");
    }
  }

  /// Singleton accessor
  static RidesService get instance {
    if (_instance == null) {
      throw Exception(
          "Rides service is not initialized. Call initialize() first.");
    }
    return _instance!;
  }

  ///
  ///  Return the relevant rides, given the passenger preferences
  ///
  List<Ride> getRidesFor(RidePreference pref, RideFilter? filter) {
    return repository.getRidesFor(pref, filter);
  }

}

