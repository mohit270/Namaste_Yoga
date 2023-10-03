import 'dart:async';

import 'package:flutter/material.dart';
import 'package:namaste_yoga/Screens/WorkOutDet.dart';
import 'package:namaste_yoga/model/model.dart';
import 'package:namaste_yoga/services/yogadb.dart';
import 'package:provider/provider.dart';
import "dart:math";

class RUready extends StatelessWidget {
  final String YogaTableName;
  RUready({Key? key, required this.YogaTableName}) : super(key: key);

  T getRandomElement<T>(List<T> list) {
    final random = Random();
    var i = random.nextInt(list.length);
    return list[i];
  }

  var list = [
    'Create a comfortable spot for your yoga practice',
    'Yoga can ease arthritis symptoms.',
    'Yoga benefits heart health.',
    'Yoga relaxes you, to help you sleep better.',
    'Yoga can mean more energy and brighter moods.',
    'Yoga helps you manage stress.'
  ];

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TimerModel>(
      create: (context) => TimerModel(context, YogaTableName: YogaTableName),
      child: Scaffold(
        body: Center(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2 - 100,
                ),
                const Text(
                  "ARE YOU READY?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                Consumer<TimerModel>(builder: (context, myModel, child) {
                  return Text(
                    myModel.countdown.toString(),
                    style: const TextStyle(fontSize: 48),
                  );
                }),
                const Spacer(),
                const Divider(
                  thickness: 2,
                ),
                Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 25),
                      child: Text(
                        "Tip: ${getRandomElement(list)}",
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TimerModel with ChangeNotifier {
  String YogaTableName;
  TimerModel(context, {required this.YogaTableName}) {
    FetchAllYoga(YogaTableName);
    MyTimer(context);
  }
  int countdown = 5;
  late List<Yoga> AllYoga;
  MyTimer(context) async {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      countdown--;
      if (countdown == 0) {
        timer.cancel();
        timer.cancel();
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => WorkOutDet(
                      ListOfYoga: AllYoga,
                      yogaindex: 0,
                    )));
      }
      notifyListeners();
    });
  }

  Future<List<Yoga>> FetchAllYoga(String yogaTableName) async {
    await YogaDatabase.instance.readAllYogaSum();
    AllYoga = await YogaDatabase.instance.readAllYoga(yogaTableName);
    print(AllYoga.length);
    notifyListeners();
    return AllYoga;
  }
}
