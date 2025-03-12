import 'package:flutter/material.dart';
import 'package:week5/Exercise2/provider/counter_notifier.dart';
import 'package:provider/provider.dart';

enum CardType { red, blue }

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("Building Home Widget");
    return Scaffold(
      body: _currentIndex == 0 ? ColorTapsScreen() : StatisticsScreen(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.tap_and_play),
            label: 'Taps',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
        ],
      ),
    );
  }
}

class ColorTapsScreen extends StatelessWidget {
  const ColorTapsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building ColorTapsScreen Widget");
    return Scaffold(
      appBar: AppBar(title: Text('Color Taps')),
      body: Column(
        children: [
          Consumer<ColorCounters>(
            builder: (context, counters, child) => ColorTap(
              type: CardType.red,
              tapCount: counters.redTapCount,
              onTap: counters.incrementRed,
            ),
          ),
          Consumer<ColorCounters>(
            builder: (context, counters, child) => ColorTap(
              type: CardType.blue,
              tapCount: counters.blueTapCount,
              onTap: counters.incrementBlue,
            ),
          ),
        ],
      ),
    );
  }
}

class ColorTap extends StatelessWidget {
  final CardType type;
  final int tapCount;
  final VoidCallback onTap;

  const ColorTap({
    super.key,
    required this.type,
    required this.tapCount,
    required this.onTap,
  });

  Color get backgroundColor => type == CardType.red ? Colors.red : Colors.blue;

  @override
  Widget build(BuildContext context) {
    print("Building ColorTap Widget");
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 100,
        child: Center(
          child: Text(
            'Taps: $tapCount',
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class StatisticsScreen extends StatelessWidget {
  const StatisticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("Building StatisticsScreen Widget");
    return Scaffold(
      appBar: AppBar(title: Text('Statistics')),
      body: Consumer<ColorCounters>(
        builder: (context, counters, child) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Red Taps: ${counters.redTapCount}', style: TextStyle(fontSize: 24)),
              Text('Blue Taps: ${counters.blueTapCount}', style: TextStyle(fontSize: 24)),
            ],
          ),
        ),
      ),
    );
  }
}