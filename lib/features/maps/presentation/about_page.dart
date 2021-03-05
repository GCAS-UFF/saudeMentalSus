import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(
        "Sobre"
        ),
    centerTitle: true
    ),
      body: Container(
        padding: EdgeInsets.all(20),
      child: Text(
          "Texto aqui!"
        ),
      )
    );
  }
}