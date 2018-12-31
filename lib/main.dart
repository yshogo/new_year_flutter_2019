import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter 2019'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin<MyHomePage> {

  AnimationController _animationController;
  Animation<double> _tweenAnimation;

  var image = AssetImage("images/1.png");

  @override
  void initState() {
    super.initState();

    _setAnimation();
  }

  _setAnimation() async {
    _animationController =
        AnimationController(duration: Duration(milliseconds: 1000), vsync: this);
    _tweenAnimation =
        Tween(begin: 100.0, end: 200.0).animate(_animationController);
    _tweenAnimation.addListener(() => setState(() {}));
    await _animationController.forward();

    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Shimmer.fromColors(
                baseColor: Colors.red,
                highlightColor: Colors.yellow,
                child: Text(
              "2019年",
              style: const TextStyle(fontSize: 50, color: Colors.black),
            )),
            SizedBox(
              height: 100,
            ),
            Container(
              width: _tweenAnimation.value,
              height: _tweenAnimation.value,
              child: Image(
                  image: image,
                  width: 200,
                  height: 200,
                ),
            ),
            SizedBox(
              height: 100,
            ),
            Shimmer.fromColors(
                baseColor: Colors.red,
                highlightColor: Colors.yellow,
                child: Text(
                  "あけおめ〜",
                  style: const TextStyle(fontSize: 30, color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}
