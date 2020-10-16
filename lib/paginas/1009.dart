import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uri_app/paginas/home.dart';

class Salario1009 extends StatefulWidget {
  @override
  _Salario1009State createState() => _Salario1009State();
}

class _Salario1009State extends State<Salario1009> {
  String nome = "";
  double fixo = 0.0;
  double vendas = 0.0;
  String _resultString = "";

  final nomeController = TextEditingController();
  final fixoController = TextEditingController();
  final vendasController = TextEditingController();

  static const platform = const MethodChannel("uri_app");

  Future _actionCalculadora() async {
    //Entrada
    double comissao = 0.0;

    nome = nomeController.text;
    fixo = double.parse(fixoController.text);
    vendas = double.parse(vendasController.text);

    try {
      comissao = await platform
          .invokeMethod("actionSalario", {"fixo": fixo, "vendas": vendas});
    } on PlatformException catch (e) {
      debugPrint("Erro ao acessar o código nativo java " + e.message);
    }

    String retorno = "TOTAL = " + comissao.toStringAsFixed(2);

    setState(() {
      this._resultString = retorno;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("URI 1009"),
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
              //nome
              TextFormField(
                controller: nomeController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Nome",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Digite algum nome",
                    hintStyle: TextStyle(
                      fontSize: 13,
                      height: 2.5,
                      color: Color(0xffe01624E),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),

              SizedBox(height: 45.0),
              //salario
              TextFormField(
                controller: fixoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Salário Fixo",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Informe o sário fixo",
                    hintStyle: TextStyle(
                      fontSize: 13,
                      height: 2.5,
                      color: Color(0xffe01624E),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),
              SizedBox(height: 45.0),

              //vendas
              TextFormField(
                controller: vendasController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Total Vendas",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Digite o valor total de vendas",
                    hintStyle: TextStyle(
                      fontSize: 13,
                      height: 2.5,
                      color: Color(0xffe01624E),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),

              //botão
              SizedBox(height: 45),
              Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(32.0),
                  child: MaterialButton(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      _actionCalculadora();
                      print("Calculando..");
                    },
                    child: Text(
                      "Calcular Total a Receber",
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
