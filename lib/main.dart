import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated Switcher Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selected;

  @override
  void initState() {
    selected = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> body = [
      _buildBody(),
      _buildCorrect(),
      _buildIncorrect(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Switcher'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(32.0),
              width: double.infinity,
              alignment: Alignment.center,
              child: AnimatedSwitcher(
                duration: Duration(milliseconds: 500),
                child: body[selected]),
            ),
          ),
          if (selected != 0) ...[
            const SizedBox(height: 20.0),
            Center(
              child: RaisedButton(
                child: Text("Play Again"),
                onPressed: () {
                  setState(() {
                    selected = 0;
                  });
                },
              ),
            )
          ]
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "Flutter's stable version was released on December 5, 2018?",
          style: TextStyle(
              color: Colors.black, fontSize: 22.0, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 20.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              textColor: Colors.white,
              color: Colors.green,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text("True"),
              onPressed: () {
                setState(() {
                  selected = 1;
                });
              },
            ),
            const SizedBox(width: 20.0),
            RaisedButton(
              textColor: Colors.white,
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)),
              child: Text("False"),
              onPressed: () {
                setState(() {
                  selected = 2;
                });
              },
            )
          ],
        )
      ],
    );
  }

  Widget _buildCorrect() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.green,
            radius: 100,
            child: Icon(
              Icons.check,
              size: 100,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            "You are correct!",
            style: TextStyle(
                color: Colors.green, fontWeight: FontWeight.bold, fontSize: 30.0),
          )
        ],
      ),
    );
  }

  Widget _buildIncorrect() {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.red,
            radius: 100,
            child: Icon(
              Icons.clear,
              size: 100,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            "Incorrect!",
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30.0),
          )
        ],
      ),
    );
  }
}
