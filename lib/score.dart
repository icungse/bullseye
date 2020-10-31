import 'package:flutter/material.dart';

class Score extends StatefulWidget {
  Score({
    Key key,
    @required this.totalScore,
    @required this.round,
  }) : super(key: key);

  final int totalScore;
  final int round;

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlatButton(
          child: Text('Start Over'),
          onPressed: () {},
        ),
        Text("Score:"),
        Text("999"),
        Text("Round"),
        Text("9999"),
        FlatButton(
          child: Text('Info'),
          onPressed: () {},
        )
      ],
    );
  }
}
