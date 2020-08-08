import 'dart:async';

import 'package:carousel_demo/model/slide.dart';
import 'package:carousel_demo/slide_dot.dart';
import 'package:carousel_demo/slide_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  // debugPaintSizeEnabled=true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int _currentPage = 0;

  final _pageController = PageController(
    initialPage: 0
  );

  @override
  void initState(){
    super.initState();
    // Timer.periodic(Duration(seconds: 5), (Timer timer){
    //   if (_currentPage < 2){
    //     _currentPage++;
    //   } else {
    //     _currentPage = 0;
    //   }
      
    //   _pageController.animateToPage(_currentPage, duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    // });
  }

  @override
  void dispose(){
    super.dispose();
    _pageController.dispose();
  }

  void onChange (int index){
    setState((){
      _currentPage = index;
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                PageView.builder(
                  scrollDirection: Axis.horizontal,
                  controller: _pageController,
                  itemCount: slideList.length,
                  onPageChanged: onChange,
                  itemBuilder: (context, int index){
                    return SlideItem(index);
                  }
                ),
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: <Widget>[
                    Container(
                      margin: const EdgeInsets.only(bottom: 35),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          for(int i =  0; i < slideList.length; i++)
                            if ( i == _currentPage)
                              SlideDot(true)
                            else 
                              SlideDot(false)
                        ],
                      )
                    )
                  ],
                )
              ]
            )
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Have account?"),
                  FlatButton(
                    child: Text("Sign up", style: TextStyle(color: Colors.blue,)),
                    onPressed: (){

                    },
                  )
                ],
              )
            ],
          )
        ]
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
