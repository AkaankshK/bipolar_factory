import 'package:bipolarfactory/Views/cats_screen.dart';
import 'package:bipolarfactory/Views/items_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> screens = [FirstScreen(), SecondScreen()];
  final appBar = AppBar(
    backgroundColor: CupertinoColors.tertiarySystemFill,
    title: const Text("Bipolar Factory"),
    centerTitle: true,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      body: getBody(),
    );
  }

  getBody() {
    return Column(children: [
      Expanded(
        flex: 1,
        child: Center(
          child: CupertinoSlidingSegmentedControl(
            padding: const EdgeInsets.all(5),
            groupValue: currentIndex,
            onValueChanged: (val) {
              setState(() {
                currentIndex = val;
              });
            },
            children: {0: Text("Cats"), 1: Text("    White Background    ")},
          ),
        ),
      ),
      Expanded(
        flex: 9,
        child: screens[currentIndex],
      ),
    ]);
  }
}
