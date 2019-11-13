import 'package:flutter/material.dart';

class SandGlass {
  int _sand = 0;
  int time() => _sand;
  Future tick() async {
    print('Начало tick()');
    _sand = 100;
    while (0 < --_sand) {
      print('Осталось песчинок: $_sand');
      final delay = Duration(milliseconds: 100);
      await Future.delayed(delay);
    }
    print('Окончание tick()');
  }
}

class MyApp extends StatefulWidget {
  createState() => MyAppState();
}

class MyAppState extends State {
  SandGlass clock = SandGlass();

  _redrawWidget() async {
    final time = clock.time();
    if (time == 0) return;
    await Future.delayed(Duration(seconds: 1));
    setState(() {
      print('_redrawWidget() $time');
    });
  }

  build(BuildContext context) {
    _redrawWidget();
    final time = clock.time();
    print('Осталось $time');
    return Center(
      child: Text('Осталось $time'),
    );
  }

  initState() {
    clock.tick();
    super.initState();
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      body: MyApp(),
    ),
  ),
);