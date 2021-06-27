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
                      "O Sabegra Saúde Mental é um aplicativo que fornece a localização e informações referentes aos centros de atendimento de saúde mental no Estado do Rio de Janeiro. Através de uma simples pesquisa, o usuário pode pesquisar por uma cidade, por exemplo, e visualizar no mapa as localizações marcadas dos postos de atendimento de saúde mental naquele local pesquisado e, assim, ao clicar em um determinado marcador do mapa, visualizar todas as informações pertinentes à aquele determinado posto de atendimento.",
                      style: TextStyle(fontSize: 18))),
              Padding(padding: const EdgeInsets.only(top: 20.0)),
              Container(
                  child: Column(children: [
                Text("Versão:",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("1.1", style: TextStyle(fontSize: 18))
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
