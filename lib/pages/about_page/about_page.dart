import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sobre"), centerTitle: true),
        body: Container(
            padding: EdgeInsets.all(20),
            child: Column(children: <Widget>[
              Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                      "O um aplicativo fornece a localização e informaçõs referente aos centros de atendimento de saúde mental no estado do Rio de Janeiro, permitindo assim a identificação do posto de atendimento procurado pelo usuário. ",
                      style: TextStyle(fontSize: 18))),
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              Container(
                  child: Column(children: [
                Text("Versão:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("1.0", style: TextStyle(fontSize: 18))
              ])),
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              Container(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(children: [
                    Text("Créditos:",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Text(
                        "Os créditos de desenvolvimento tecnológico estão atribuídos aos graduandos Eduardo de Oliveira Câmara, Karina Pereira de Lemos, Kelly Maria Augusta Tavares Bentes e Ricardo de Monteiro e Tavares, sob a orientação do professor Flávio Luiz Seixas (MIDIACOM/IC/UFF).",
                        style: TextStyle(fontSize: 18))
                  ]))
            ])));
  }
}
