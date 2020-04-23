import 'package:carrosweb/imports.dart';

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
    //_counter = Prefs.getInt('count');
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
