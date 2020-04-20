import 'package:carrosweb/web/debug_widget_size.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body(),
    );
  }

  _body() {
    return GridView.builder(
      itemCount: 100,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 1.5,
      ),
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                'http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png',
              ),
              Text('Renault Megane RS Trophy'),
            ],
          ),
        );
      },
    );
  }
}
