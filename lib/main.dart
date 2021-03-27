import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(title: 'Flutter '),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
  int _counter = 30;
List datas = [];
@override
  void initState() {
    super.initState();
    
  }

  void _incrementCounter() {
    setState(() {
      _counter--;
    });
  }

void getData(){
   final String host = 'https://jsonplaceholder.typicode.com/posts';

http.get(Uri(host: host)).then((response){
datas = jsonDecode(response.body);
setState(() {
  
});
print(response.body);
});

}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: datas.length,
        itemBuilder:   
       (context,idx){
         var data = datas[idx];
         return ListTile(title: Text(data['title']),subtitle: Text(data['body']),);
       } 
      
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
