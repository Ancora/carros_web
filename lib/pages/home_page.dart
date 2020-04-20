import 'package:carrosweb/web/debug_widget_size.dart';
import 'package:carrosweb/web/web_utils.dart';
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
        return LayoutBuilder(
          builder: (context, constraints) {
            double fontSize = size(
              constraints.maxWidth * 0.1,
              min: 10,
              max: Theme.of(context).textTheme.bodyText1.fontSize,
            );

            return Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: 250,
                    ),
                    child: Image.network(
                      'http://www.livroandroid.com.br/livro/carros/esportivos/Renault_Megane_Trophy.png',
                    ),
                  ),
                  Text(
                    '$fontSize - Renault Megane RS Trophy',
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: fontSize),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
