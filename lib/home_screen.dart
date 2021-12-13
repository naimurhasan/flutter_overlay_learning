
import 'package:flutter/material.dart';
import 'package:overlay_test/widgets.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Name',
                fillColor: Colors.teal.withOpacity(0.3),
                filled: true,
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              decoration: InputDecoration(
                hintText: 'Age',
                fillColor: Colors.teal.withOpacity(0.3),
                filled: true,
              ),
            ),
            SizedBox(height: 10.0,),
            CountryPicker(),
            ElevatedButton(onPressed: (){}, child: Text('Submit')),
            SizedBox(height: 10.0,),
          ]
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}