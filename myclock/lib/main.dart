import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black,
        child: WordLayout(),
      ),
    );
  }
}

class WordLayout extends StatefulWidget {
  @override
  _WordLayoutState createState() => _WordLayoutState();
}

class _WordLayoutState extends State<WordLayout> {
  WordClock _now = WordClock();

  @override
  void initState() {
    Timer.periodic(Duration(seconds: 1), (v) {
      setState(() {
        _now = WordClock();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Word("IT", _now.itis),
              Word("T", false),
              Word("IS", _now.itis),
              Word("I", false),
              Word("TWENTY", _now.twenty)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Word("QUARTER", _now.quarter),
              Word("HALF", _now.half),
              Word("M", false),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Word("TEN", _now.ten1),
              Word("FIVE", _now.five1),
              Word("E", false),
              Word("PAST", _now.past),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Word("TO", _now.to),
              Word("A", false),
              Word("TWELVE", _now.twelve),
              Word("ONE", _now.one),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Word("TWO", _now.two),
              Word("THREE", _now.three),
              Word("FOUR", _now.four),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Word("FIVE", _now.five),
              Word("SIX", _now.six),
              Word("SEVEN", _now.seven),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Word("EIGHT", _now.eight),
              Word("NINE", _now.nine),
              Word("TEN", _now.ten),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Word("N", false),
              Word("ELEVEN", _now.eleven),
              Word("D", false),
              Word("DATE", false),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Word("O'CLOCK", _now.clock),
              Word("TIME", false),
              Word("A", false),
            ],
          ),
        ),
      ],
    );
  }
}

class Word extends StatelessWidget {
  String txt;
  bool clr;

  Word(this.txt, this.clr);

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: MediaQuery.of(context).size.height * 0.025,
        letterSpacing: 20,
        fontFamily: 'DroidSansMono',
        color: clr ? Colors.yellow : Colors.grey[900],
      ),
    );
  }
}

class WordClock {
  bool itis = true;
  bool twenty = false;
  bool quarter = false;
  bool half = false;
  bool ten1 = false;
  bool five1 = false;
  bool past = false;
  bool to = false;
  bool twelve = false;
  bool one = false;
  bool two = false;
  bool three = false;
  bool four = false;
  bool five = false;
  bool six = false;
  bool seven = false;
  bool eight = false;
  bool nine = false;
  bool ten = false;
  bool eleven = false;
  bool clock = false;

  WordClock() {
    DateTime now = DateTime.now();
    String hhmmss = DateFormat("Hms").format(now).replaceAll(':', ' ');

    var time = hhmmss.split(' ').map((str) => int.parse(str)).toList();
    //print(time);
    if (time[1] >= 0 && time[1] < 5) {
      clock = true;
      hour(time[0]);
    } else if (time[1] >= 5 && time[1] < 10) {
      five1 = true;
      past = true;
      hour(time[0]);
    } else if (time[1] >= 10 && time[1] < 15) {
      ten1 = true;
      past = true;
      hour(time[0]);
    } else if (time[1] >= 15 && time[1] < 20) {
      quarter = true;
      past = true;
      hour(time[0]);
    } else if (time[1] >= 20 && time[1] < 25) {
      twenty = true;
      past = true;
      hour(time[0]);
    } else if (time[1] >= 25 && time[1] < 30) {
      twenty = true;
      five1 = true;
      past = true;
      hour(time[0]);
    } else if (time[1] >= 30 && time[1] < 35) {
      half = true;
      past = true;
      hour(time[0]);
    } else if (time[1] >= 35 && time[1] < 40) {
      twenty = true;
      five1 = true;
      to = true;
      hour(time[0] + 1);
    } else if (time[1] >= 40 && time[1] < 45) {
      twenty = true;
      to = true;
      hour(time[0] + 1);
    } else if (time[1] >= 45 && time[1] < 50) {
      quarter = true;
      to = true;
      hour(time[0] + 1);
    } else if (time[1] >= 50 && time[1] < 55) {
      ten1 = true;
      to = true;
      hour(time[0] + 1);
    } else if (time[1] >= 55) {
      five1 = true;
      to = true;
      hour(time[0] + 1);
    }
  }

  void hour(int hr) {
    hr = hr > 12 ? hr - 12 : hr;
    switch (hr) {
      case 1:
        one = true;
        break;
      case 2:
        two = true;
        break;
      case 3:
        three = true;
        break;
      case 4:
        four = true;
        break;
      case 5:
        five = true;
        break;
      case 6:
        six = true;
        break;
      case 7:
        seven = true;
        break;
      case 8:
        eight = true;
        break;
      case 9:
        nine = true;
        break;
      case 10:
        ten = true;
        break;
      case 11:
        eleven = true;
        break;
      case 12:
        twelve = true;
        break;
      case 0:
        twelve = true;
        break;
    }
  }
}
