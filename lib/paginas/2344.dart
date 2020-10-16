import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uri_app/paginas/home.dart';

class Notas2344 extends StatefulWidget {
  @override
  _Notas2344State createState() => _Notas2344State();
}

class _Notas2344State extends State<Notas2344> {
  int nota = 0;
  String _resultString = "";

  final notaController = TextEditingController();

  static const platform = const MethodChannel("uri_app");

  Future actionCalcular() async {
    //Entrada
    String conceito = '';
    nota = (int.parse(notaController.text));

    try {
      conceito = await platform.invokeMethod("actionCalcular", {
        "nota": nota,
      });
    } on PlatformException catch (e) {
      debugPrint("Erro ao acessar o código nativo java " + e.message);
    }

    String retorno = conceito;

    setState(() {
      this._resultString = retorno;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("URI 2344"),
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
              SizedBox(
                height: 35,
              ),

              //campo nota
              TextFormField(
                controller: notaController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Nota",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Digite uma nota",
                    hintStyle: TextStyle(
                      fontSize: 13,
                      height: 2.5,
                      color: Color(0xffe01624E),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),

              SizedBox(
                height: 35,
              ),

              //botão

              Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(32.0),
                  child: MaterialButton(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      actionCalcular();
                      print("Calculando..");
                    },
                    child: Text(
                      "Converter Nota",
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
