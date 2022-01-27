import 'dart:math';

import 'package:flutter/material.dart';

class NewTimerScreen extends StatefulWidget {
  const NewTimerScreen({Key? key, required this.addTimer}) : super(key: key);
  final Function(int time) addTimer;

  @override
  _NewTimerScreenState createState() => _NewTimerScreenState();
}

class _NewTimerScreenState extends State<NewTimerScreen> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NEW TIMER'),
      ),
      body: Container(
        height: 60,
        width: double.infinity,
        color: Colors.red,
        margin: const EdgeInsets.fromLTRB(20, 40, 20, 0),
        child: InkWell(
            onTap: () {
              widget.addTimer(Random().nextInt(10) + 10);
            },
            child: Center(
              child: Text(
                'Start Random Timer',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )),
      ),
    );
  }
}
