import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/services.dart';
import 'package:Bullseye/prompt.dart';
import 'package:Bullseye/control.dart';
import 'package:Bullseye/score.dart';
import 'package:Bullseye/gamemodel.dart';

void main() => runApp(BullsEyeApp());

class BullsEyeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: 'BullsEye',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: GamePage(title: 'BullsEye'),
    );
  }
}

class GamePage extends StatefulWidget {
  GamePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _GamePageState createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  bool _alertIsVisible = false;
  GameModel _model;

  @override
  void initState() {
    super.initState();
    _model = GameModel(Random().nextInt(100) + 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Prompt(targetValue: _model.target),
            Control(
              model: _model,
            ),
            FlatButton(
              child: Text(
                'Hit Me',
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                _alertIsVisible = true;
                _showAler(context);
                print("Button clicked!");
              },
            ),
            Score(totalScore: _model.totalScore, round: _model.totalScore),
          ],
        ),
      ),
    );
  }

  int _pointsForCurrentRound() {
    int maximumScore = 100;
    int sliderValue = _model.current;
    int difference = _model.target - sliderValue;
    if (difference < 0) {
      difference *= -1;
    }
    return maximumScore - difference;
  }

  void _showAler(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("Awesome"),
      onPressed: () {
        Navigator.of(context).pop();
        _alertIsVisible = false;
        print("Awesome pressed! $_alertIsVisible");
      },
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Hello there"),
            content: Text("The slider's value is ${_model.current}. \n" +
                "You scored ${_pointsForCurrentRound()} pints this round."),
            actions: <Widget>[okButton],
            elevation: 5,
          );
        });
  }
}
