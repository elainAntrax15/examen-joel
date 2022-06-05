import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double temperatura = 30;
  String clima = 'Nublado';
  IconData icon = Icons.thermostat;
  bool isCelcius = true;
  int viento = 10;
  int humedad = 10;
  void refresh() {
    isCelcius = !isCelcius;
    setState(() {});
  }

  double convertFarenheit() {
    return (temperatura * (9 / 5)) + 32;
  }

  void estado() {
    temperatura = Random().nextDouble() * 40;
    viento = Random().nextInt(25);
    humedad = Random().nextInt(20);
    setState(() => {
          if (temperatura >= 30) {clima = "Caluroso", icon = Icons.thermostat},
          if (temperatura <= 10)
            {clima = "Nevado", icon = Icons.cloudy_snowing},
          if (temperatura > 10 && temperatura < 18)
            {clima = "Nublado", icon = Icons.cloud},
          if (temperatura >= 25 && temperatura <= 29)
            {clima = "Soleado", icon = Icons.sunny},
          if (temperatura > 10 &&
              temperatura < 25 &&
              humedad < 10 &&
              viento >= 15 &&
              viento <= 20)
            {
              {clima = 'Ventoso', icon = CupertinoIcons.wind}
            },
          if (temperatura > 10 &&
              temperatura < 25 &&
              humedad >= 15 &&
              viento > 20)
            {
              {clima = 'Tormenta', icon = CupertinoIcons.cloud_bolt_rain_fill}
            },
          if (temperatura > 10 &&
              temperatura < 25 &&
              humedad >= 10 &&
              humedad < 15)
            {
              {clima = 'Lluvioso', icon = CupertinoIcons.cloud_drizzle_fill}
            }
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
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
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
            Text(
              isCelcius
                  ? '${temperatura.toStringAsFixed(2)}°C'
                  : '${convertFarenheit().toStringAsFixed(2)}°F',
              style: const TextStyle(fontSize: 50),
            ),
            Icon(
              icon,
              size: 150,
            ),
            Text(clima, style: const TextStyle(fontSize: 35))
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: refresh,
        tooltip: !isCelcius ? 'Celcius' : 'Farenheit',
        child: const Icon(CupertinoIcons.refresh),
      ), // This trailing comma makes auto-formatting nicer for build methods.
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            onPressed: () => estado(),
            child: const Text('Mexico'),
          ),
          TextButton(
            onPressed: () => estado(),
            child: const Text('USA'),
          ),
          TextButton(
            onPressed: () => estado(),
            child: const Text('Canada'),
          ),
          TextButton(
            onPressed: () => estado(),
            child: const Text('NZ'),
          ),
          TextButton(
            onPressed: () => estado(),
            child: const Text('FR'),
          ),
        ],
      ),
    );
  }
}
