import 'package:flutter/material.dart';
import 'package:week5/Exercise1/repository/mock/mock_locations_repository.dart';
import 'package:week5/Exercise1/repository/mock/mock_rides_repository.dart';
import 'package:week5/Exercise1/service/locations_service.dart';
import 'package:week5/Exercise1/service/rides_service.dart';

import 'repository/mock/mock_ride_preferences_repository.dart';
import 'screens/ride_pref/ride_pref_screen.dart';
import 'service/ride_prefs_service.dart';
import 'theme/theme.dart';

void main() {
  // 1 - Initialize the services
  RidePrefService.initialize(MockRidePreferencesRepository());
  LocationsService.initialize(MockLocationsRepository());
  RidesService.initialize(MockRidesRepository());

  // 2- Run the UI
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen()),
    );
  }
}
