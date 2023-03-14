import 'package:flutter/material.dart';
import 'main.dart';
import 'dart:math';

void main() {
  runApp(Layang());
}

class Layang extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Layang-layang Calculator',
      theme: ThemeData.dark(

      ),
      home: MyHomePage(title: 'Layang-layang'),
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
  TextEditingController _diagonal1Controller = TextEditingController();
  TextEditingController _diagonal2Controller = TextEditingController();
  TextEditingController _sisiPanjangController = TextEditingController();
  TextEditingController _sisiPendekController = TextEditingController();
  double _luas = 0.0;
  double _keliling = 0.0;

  void _hitung() {
    double diagonal1 = double.tryParse(_diagonal1Controller.text) ?? 0.0;
    double diagonal2 = double.tryParse(_diagonal2Controller.text) ?? 0.0;
    double sisiPanjang = double.tryParse(_sisiPanjangController.text) ?? 0.0;
    double sisiPendek = double.tryParse(_sisiPendekController.text) ?? 0.0;

    double keliling = 2 * (sisiPanjang + sisiPendek);
    double luas = 0.5 * diagonal1 * diagonal2;

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
                'Menu Layang-Layang',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.normal),
              ),
              SizedBox(height: 32),
              TextField(
                controller: _diagonal1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Diagonal 1',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _diagonal2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Diagonal 2',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _sisiPanjangController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Sisi Panjang',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _sisiPendekController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Sisi Pendek',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _hitung,
                child: Text('Hitung'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed:_reset,
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