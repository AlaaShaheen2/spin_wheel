import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:rxdart/rxdart.dart';

class SpinWheel extends StatefulWidget {
  const SpinWheel({Key? key}) : super(key: key);

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}

class _SpinWheelState extends State<SpinWheel> {
  final selected = BehaviorSubject<int>();
  int rewards = 0;
  final List<FortuneItem> items = [
    FortuneItem(
      child: Text(
        '5% خصم',
      ),
      style: FortuneItemStyle(
        borderColor: Colors.black,
        color: Color.fromARGB(249, 117, 112, 112),
      ),
    ),
    FortuneItem(
      child: Text('10% خصم'),
      style: FortuneItemStyle(
        borderColor: Colors.black,
        color: Color.fromRGBO(153, 1, 0, 205),
      ),
    ),
    FortuneItem(
      child: Text('15% خصم'),
      style: FortuneItemStyle(
        borderColor: Colors.black,
        color: Color.fromRGBO(51, 51, 51, 5),
      ),
    ),
    FortuneItem(
      child: Text('20% خصم'),
      style: FortuneItemStyle(
        borderColor: Colors.black,
        color: Color.fromARGB(212, 191, 66, 59),
      ),
    ),
    FortuneItem(
      child: Text('50% خصم'),
      style: FortuneItemStyle(
        borderColor: Colors.black,
        color: Color.fromARGB(250, 125, 133, 147),
      ),
    ),
    FortuneItem(
      child: Text('100% خصم'),
      style: FortuneItemStyle(
        borderColor: Colors.black,
        color: Color.fromARGB(42, 229, 8, 8),
      ),
    ),
  ];

  // animatedEnd() {
  //   setState(() {
  //     rewards = items[selected.value] as int;
  //   });
  // }

  @override
  void dispose() {
    selected.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.topCenter,
          colors: [
            Color.fromARGB(210, 247, 241, 247),
            Color.fromARGB(248, 225, 70, 70),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 300,
                child: FortuneWheel(
                  selected: selected.stream,
                  animateFirst: false,
                  indicators: [
                    FortuneIndicator(
                      alignment: Alignment.topCenter,
                      child: TriangleIndicator(
                        color: Color.fromARGB(248, 237, 3, 3),
                      ),
                    ),
                  ],
                  styleStrategy: UniformStyleStrategy(
                    borderColor: Colors.black,
                    color: Color.fromRGBO(220, 0, 0, 30),
                    borderWidth: 5,
                  ),
                  items: [
                    ...items,
                  ],
                  onAnimationEnd: () {
                    // animatedEnd();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Container(
                          padding: EdgeInsets.all(16),
                          height: 90,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(246, 211, 218, 219),
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'ألف مباارك',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(248, 187, 55, 55),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                " لقد ربحت " + rewards.toString(),
                                style: TextStyle(
                                  color: Color.fromARGB(248, 187, 55, 55),
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selected.add(Fortune.randomInt(0, items.length));
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(250, 107, 5, 5),
                  ),
                  margin: EdgeInsets.all(20),
                  height: 40,
                  width: 120,
                  child: Center(
                    child: Text(
                      "SPIN!",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
