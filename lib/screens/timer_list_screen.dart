import 'dart:async';
import 'package:flutter/material.dart';
import 'package:timer/screens/new_timer_screen.dart';
import 'package:timer/services/timer.dart';

class TimerListScreen extends StatefulWidget {
  const TimerListScreen({Key? key}) : super(key: key);

  @override
  _TimerListScreenState createState() => _TimerListScreenState();
}

class _TimerListScreenState extends State<TimerListScreen> {
  List<MyTimer> timers = [];
  int tap = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TIMERS LIST'),
      ),
      floatingActionButton: myFloatingActionButton(),
      body: ListView.builder(
        itemCount: timers.where((element) => element.seconds != 0).length,
        itemBuilder: ((context, index) {
          var newList =
              timers.where((element) => element.seconds != 0).toList();
          return SizedBox(
            height: 65,
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  title: Text('Timer ${newList[index].index + 1}'),
                  trailing: Text(newList[index].active
                      ? newList[index].seconds.toString() + ' sec'
                      : 'paused'),
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  color: Colors.black,
                )
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget myFloatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Text(
            'TOTAL: ' +
                timers
                    .where((element) => element.seconds != 0)
                    .toList()
                    .length
                    .toString(),
          ),
        ),
        FloatingActionButton(
          onPressed: onPressed,
          backgroundColor: Colors.red,
          child: const Icon(Icons.add),
        ),
      ],
    );
  }

  void onPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NewTimerScreen(
          addTimer: (time) {
            setState(() {
              if (timers.where((element) => element.active).length < 4) {
                timers.add(
                  MyTimer(true, tap, time, false),
                );
                timer(tap);
              } else {
                timers.add(
                  MyTimer(false, tap, time, false),
                );
                timer(tap);
              }
              tap++;
            });
          },
        ),
      ),
    );
  }

  void timer(index) {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      var newList = timers
          .where((element) => element.active == false && element.isEnd == false)
          .isNotEmpty;
      if (timers[index].seconds > 0) {
        if (timers[index].active) {
          setState(() {
            timers[index].seconds = timers[index].seconds - 1;
          });
        }
      } else {
        timer.cancel();
        setState(() {
          timers[index].isEnd = true;
          timers.where((element) => element.seconds == 0).forEach((element) {
            element.active = false;
          });
        });
      }
      if (timers.where((element) => element.active == true).isNotEmpty &&
          newList) {
        if (timers.where((element) => element.active).length < 4) {
          setState(() {
            timers
                .firstWhere(
                    (element) => element.active == false && !element.isEnd)
                .active = true;
          });
        }
      }
    });
  }
}
