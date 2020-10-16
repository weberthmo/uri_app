import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uri_app/paginas/home.dart';

class Basico1001 extends StatefulWidget {
  @override
  _Basico1001State createState() => _Basico1001State();
}

class _Basico1001State extends State<Basico1001> {
  int numero1 = 0;
  int numero2 = 0;
  String _resultString = "";

  final num1Controller = TextEditingController();
  final num2Controller = TextEditingController();

  static const platform = const MethodChannel("uri_app");

  Future _actionCalculadora() async {
    //Entrada
    int soma = 0;
    numero1 = (int.parse(num1Controller.text));
    numero2 = (int.parse(num2Controller.text));
    print('Numero: $numero1 e $numero2');

    try {
      soma = await platform.invokeMethod("actionSomar", {
        "numero1": numero1,
        "numero2": numero2,
      });
    } on PlatformException catch (e) {
      debugPrint("Erro ao acessar o código nativo java " + e.message);
    }

    String retorno = "X = " + soma.toString();

    setState(() {
      this._resultString = retorno;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("URI 1001"),
      leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          }),
      centerTitle: true,
    );

    Scaffold scaffold = Scaffold(
      appBar: appBar,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 45.0),
              TextFormField(
                controller: num1Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Numero 1",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Digite o 1º Numero",
                    hintStyle: TextStyle(
                      fontSize: 13,
                      height: 2.5,
                      color: Color(0xffe01624E),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(height: 45.0),
              TextFormField(
                controller: num2Controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Numero 2",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Digite o 2º Numero",
                    hintStyle: TextStyle(
                      fontSize: 13,
                      height: 2.5,
                      color: Color(0xffe01624E),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(height: 45.0),
              Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(32.0),
                  child: MaterialButton(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      _actionCalculadora();

                      print("Calculando.. ");
                    },
                    child: Text(
                      "Calcular Soma",
                      textAlign: TextAlign.center,
                    ),
                  )),
              Container(
                margin: EdgeInsets.all(20),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.blue)),
                alignment: Alignment.topCenter,
                padding: EdgeInsets.all(10.0),
                height: 50,
                width: 150,
                child: Text("$_resultString"),
              )
            ],
          ),
        ),
      ),
    );

    return scaffold;
  }
}
