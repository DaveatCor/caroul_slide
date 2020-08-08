import 'package:carousel_demo/model/slide.dart';
import 'package:flutter/material.dart';

class SlideItem extends StatelessWidget{

  final index;

  SlideItem(this.index);
  
  Widget build(BuildContext context){

    final size = MediaQuery.of(context).size;

    return Column(
      // Column is also a layout widget. It takes a list of children and
      // arranges them vertically. By default, it sizes itself to fit its
      // children horizontally, and tries to be as tall as its parent.
      //
      // Invoke "debug painting" (press "p" in the console, choose the
      // "Toggle Debug Paint" action from the Flutter Inspector in Android
      // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
      // to see the wireframe for each widget.
      //
      // Column has various properties to control how it sizes itself and
      // how it positions its children. Here we use mainAxisAlignment to
      // center the children vertically; the main axis here is the vertical
      // axis because Columns are vertical (the cross axis would be
      // horizontal).
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Image.asset(slideList[index].image, height: 200),
        Text(
          slideList[index].title, 
          style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        Text(
          slideList[index].description,
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}