import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


  void getHttp() async {
  try {
    Response response = await Dio().get("https://programming-quotes-api.herokuapp.com/quotes");
    print(response.data[0]["en"]);
  } catch (e) {
    print(e);
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
           
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getHttp,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

}

// class DisplayData extends StatefulWidget {
//   @override
//   _DisplayDataState createState() => _DisplayDataState();
// }

// class _DisplayDataState extends State<DisplayData> {


//   Future<>  getdata() async{
// try {
//     Response response = await Dio().get("https://programming-quotes-api.herokuapp.com/quotes");
//     print(response);
//     return response;
//   } catch (e) {
//     print(e);
//   }
//   }


//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<List>(
//            future: getdata(),
//            builder: (context,snapshot){
//             if(snapshot.hasData){
//               return(Text(response.en));
//             }
//            },
//     );
//   }
// }
