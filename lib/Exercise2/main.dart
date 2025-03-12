import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:week5/Exercise2/provider/counter_notifier.dart';
import 'package:week5/Exercise2/screen/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ColorCounters(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
      ),
    ),
  );
}
