import 'package:carrosweb/utils/web/prefs.dart';
import 'package:flutter/material.dart';

int _counter = 0;

class CountPage extends StatefulWidget {
  @override
  _CountPageState createState() => _CountPageState();
}

class _CountPageState extends State<CountPage> {
  //int _counter = 0;

  @override
  void initState() {
    super.initState();
    _initCounter();
  }

  _initCounter() async {
    Future<int> future = Prefs.getInt('count');
    future.then((int count) {
      _counter = count;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      Prefs.setInt("count", _counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Contagem de cliques no botão flutuante:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
