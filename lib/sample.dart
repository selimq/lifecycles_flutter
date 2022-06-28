import 'package:flutter/material.dart';

class Sample extends StatefulWidget {
  const Sample({Key? key}) : super(key: key);

  @override
  State<Sample> createState() => _SampleState();
}

class _SampleState extends State<Sample> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  Future<void> didChangeAppLifecycleState(AppLifecycleState state) async {
    debugPrint("State -> ${state.name}");
    if (state == AppLifecycleState.detached) {
      for (var i = 0; i < 1000; i++) {
        debugPrint("closing $i");
      }

      debugPrint("App closing");
    }
    super.didChangeAppLifecycleState(state);
  }

  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
      ),
    );
  }
}

class A {
  final String s;

  A(this.s);

  void test() {
    debugPrint("tes");
  }
}
