import 'dart:math';
import 'main.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Segitiga());
}

class Segitiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Segitiga Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(

      ),
      home: MyHomePage(title: 'Segitiga'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController _alasController = TextEditingController();
  TextEditingController _tinggiController = TextEditingController();
  double _luas = 0.0;
  double _keliling = 0.0;

  void _hitung() {
    double alas = double.tryParse(_alasController.text) ?? 0.0;
    double tinggi = double.tryParse(_tinggiController.text) ?? 0.0;

    double sisiMiring = sqrt(pow(alas, 2) + pow(tinggi, 2));
    double keliling = alas + tinggi + sisiMiring;
    double luas = 0.5 * alas * tinggi;

    setState(() {
      _keliling = keliling;
      _luas = luas;
    });
  }

  void _reset(){
    double keliling = 0;
    double luas = 0;

    setState(() {
      _keliling = keliling;
      _luas = luas;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
          actions: [
            IconButton(
              icon: Icon(Icons.add_business_outlined),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp()));
              },
            )
          ]
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Menu Segitiga',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 32),
              TextField(
                controller: _alasController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Alas',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _tinggiController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Tinggi',
                ),
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: _hitung,
                child: Text('Hitung'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _reset,
                child: Text('Reset'),
              ),
              SizedBox(height: 16),
              Text(
                'Luas: $_luas',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 16),
              Text(
                'Keliling: $_keliling',
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
        ),
      ),
    );
  }
}