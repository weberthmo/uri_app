import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uri_app/paginas/home.dart';

class Calulas1018 extends StatefulWidget {
  @override
  _Calulas1018State createState() => _Calulas1018State();
}

class _Calulas1018State extends State<Calulas1018> {
  int valor = 0;
  List<dynamic> _resultString;

  @override
  void initState() {
    super.initState();
    _resultString = [
      "0 nota(s) de R\$ 100,00",
      "0 nota(s) de R\$ 50,00",
      "0 nota(s) de R\$ 20,00",
      "0 nota(s) de R\$ 10,00",
      "0 nota(s) de R\$ 5,00",
      "0 nota(s) de R\$ 2,00",
      "0 nota(s) de R\$ 1,00",
    ];
  }

  final valorController = TextEditingController();

  static const platform = const MethodChannel("uri_app");

  Future _actionCelulas() async {
    //Entrada
    List celulas;
    valor = (int.parse(valorController.text));

    try {
      celulas = await platform.invokeMethod("actionCelulas", {
        "valor": valor,
      });
    } on PlatformException catch (e) {
      debugPrint("Erro ao acessar o código nativo java " + e.message);
    }

    List retorno = celulas;

    setState(() {
      this._resultString = retorno;
    });
  }

  @override
  Widget build(BuildContext context) {
    AppBar appBar = AppBar(
      title: Text("URI 1018"),
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

              //valor
              TextFormField(
                controller: valorController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Valor",
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    hintText: "Digite um valor inteiro",
                    hintStyle: TextStyle(
                      fontSize: 13,
                      height: 2.5,
                      color: Color(0xffe01624E),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32.0))),
              ),

              SizedBox(height: 45),

              //botão
              Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(32.0),
                  child: MaterialButton(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    onPressed: () {
                      print("Calculando..");
                      //_actionCelulas();
                      print("$_resultString");
                      _actionCelulas();
                    },
                    child: Text(
                      "Calcular quantidade minima de notas",
                      textAlign: TextAlign.center,
                    ),
                  )),

              Container(
                padding: EdgeInsets.all(10.0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue),
                ),
                height: 300,
                child: ListView(
                  children: [
                    ListTile(
                      title: Text("${_resultString[0]}"),
                    ),
                    ListTile(
                      title: Text("${_resultString[1]}"),
                    ),
                    ListTile(
                      title: Text("${_resultString[2]}"),
                    ),
                    ListTile(
                      title: Text("${_resultString[3]}"),
                    ),
                    ListTile(
                      title: Text("${_resultString[4]}"),
                    ),
                    ListTile(
                      title: Text("${_resultString[5]}"),
                    ),
                    ListTile(
                      title: Text("${_resultString[6]}"),
                    ),
                  ],
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
