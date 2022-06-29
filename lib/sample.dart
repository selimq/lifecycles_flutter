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
  void didChangeAppLifecycleState(AppLifecycleState state) {
    debugPrint("State -> ${state.name}");
    if (state == AppLifecycleState.detached) {
      for (var i = 0; i < 100; i++) {
        debugPrint("closing $i");
      }
      A.test();
      debugPrint("App closing");
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        actions: [
          IconButton(
            icon: const Icon(Icons.sailing),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Scaffold(
                    appBar: AppBar(backgroundColor: Colors.blueGrey),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class A {
  final String s;

  A(this.s);

  static test() {
    debugPrint("test ");
  }
}
