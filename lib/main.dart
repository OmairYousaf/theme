import 'dart:ui';
import 'package:theme_project/theme/custom_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:theme_project/theme/config.dart';
import 'package:provider/provider.dart';
import 'package:theme_project/theme_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: CustomTheme.lightTheme, //3
      darkTheme: CustomTheme.darkTheme, //4
      themeMode: currentTheme.currentTheme, //5
      home: const MyHomePage(title: 'Flutter Demo Homw Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    currentTheme.addListener(() {
      //2
      setState(() {});
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  decoration: BoxDecoration(),
                  child: RaisedButton(
                    child: Text('Light Theme'),
                    onPressed: () => currentTheme.toggleTheme(),
                  )),
              Spacer(),
              RaisedButton(
                child: Text('Dark Theme'),
                onPressed: () => currentTheme.toggleTheme(),
              ),
            ],
          ),
          Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getImage('images/omair.png'),
                  ],
                ),
                Divider(
                  color: Colors.teal.shade300,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getHeading('Name of Country'),
                        getData('Pakistan'),
                        getHeading('Designation'),
                        getData('Employee'),
                        getHeading('Contact'),
                        getData('0333-8465067'),
                      ]),
                ),
              ],
            ),
          ),
        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

Widget getImage(String str) {
  return CircleAvatar(
    radius: 50.0,
    backgroundImage: AssetImage(str),
  );
}

Widget getHeading(String heading) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      heading,
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}

Widget getData(String data) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Text(
      data,
      style: TextStyle(
        fontSize: 25,
      ),
    ),
  );
}
