import 'package:flutter/material.dart';
import 'package:uri_app/paginas/1001.dart';
import 'package:uri_app/paginas/1009.dart';
import 'package:uri_app/paginas/1018.dart';
import 'package:uri_app/paginas/2344.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text('Home'),
      centerTitle: true,
    );
    Scaffold scaffold = Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Basico1001()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 100,
                    child: Text(
                      '1001	Extremamente Básico',
                    ),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Salario1009()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 100,
                    child: Text('1009 - Salário com Bônus'),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Calulas1018()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 100,
                    child: Text('1018 - Cédulas'),
                  ),
                ),
              ),
              Card(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {
                    print('Card tapped.');
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Notas2344()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 300,
                    height: 100,
                    child: Text('2344 - Notas da Prova'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    return scaffold;
  }
}
