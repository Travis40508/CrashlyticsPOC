import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

void main() {
  Crashlytics.instance.enableInDevMode = true;

  // Pass all uncaught errors from the framework to Crashlytics.
  FlutterError.onError = Crashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Testing Crashlytics',
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            onPressed: () => throw Exception('Null pointer!'),
            child: Text(
              'Null Pointer Exception'
            ),
          ),
          RaisedButton(
            child: Text(
              'Out of Memory'
            ),
          ),
          RaisedButton(
            child: Text(
              'Bad Token Exception'
            ),
          ),
          RaisedButton(
            child: Text(
              'Illegal Argument Exception'
            ),
          ),
          RaisedButton(
            child: Text(
              'Out of Index Exception'
            ),
          ),
        ],
      ),
    );
  }
}
