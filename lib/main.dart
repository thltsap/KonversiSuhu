import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //variabel berubah
  double _inputUSer = 0;
  double _kelvin = 0;
  double _reamur = 0;
  double _farenheit = 0;
  final inputController = TextEditingController();

  void hitungSuhu() {
    setState(() {
      _inputUSer = double.parse(inputController.text);
      _kelvin = _inputUSer + 273;
      _reamur = (4 / 5) * _inputUSer;
      _farenheit = (9 / 5) * _inputUSer + 32;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget input() {
      return Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              controller: inputController,
              decoration:
                  InputDecoration(hintText: 'Masukkan Suhu Dalam Celcius'),
              keyboardType: TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
            ),
          ],
        ),
      );
    }

    Widget result() {
      return Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Suhu Dalam Kelvin',
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    '$_kelvin',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Suhu dalam Reamor',
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    '$_reamur',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget convert() {
      return Row(
        children: [
          Expanded(
            child: Container(
              child: RaisedButton(
                color: Colors.blue, // background
                textColor: Colors.white, // foreground
                onPressed: () {
                  hitungSuhu();
                },
                child: Text('Konversi Suhu'),
              ),
            ),
          ),
        ],
      );
    }

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Konverter Suhu"),
          ),
          body: GestureDetector(
            child: Column(
              children: [
                input(),
                result(),
                convert(),
              ],
            ),
          )),
    );
  }
}
