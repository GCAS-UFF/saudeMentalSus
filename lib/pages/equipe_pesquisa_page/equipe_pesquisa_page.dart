import 'package:flutter/material.dart';

class EquipePesquisaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Equipe da pesquisa"), centerTitle: true),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Padding(padding: const EdgeInsets.only(top: 20.0)),
          Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(children: <Widget>[
                Text('Coordenadora',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(
                    'Sandra Mara Silva Brignol - Professora/Pesquisadora do MEB/ISC/UFF',
                    style: TextStyle(fontSize: 18.0))
              ])),
          Padding(padding: const EdgeInsets.only(top: 10.0)),
          Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(children: <Widget>[
                Text('Vice coordenadora',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(
                    'Vilma Aparecida da Silva Fonseca - Instituto Biomédico UFF CRM: 52553051',
                    style: TextStyle(fontSize: 18.0)),
              ])),
          Padding(padding: const EdgeInsets.only(top: 10.0)),
          Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(children: <Widget>[
                Text('Pesquisadoras',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(
                    'Adriana Pinho - IESC/UFRJ\n'
                    'Diana Ramos de Oliveira - PROPSICS-Universidade Católica de Petrópolis',
                    style: TextStyle(fontSize: 18.0))
              ])),
          Padding(padding: const EdgeInsets.only(top: 10.0)),
          Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(children: <Widget>[
                Text('Apoio na gestão',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(
                    'Janaína Rosenburg Gioseffi - MBA em Gestão -FGV Mestranda PPSC-UFF',
                    style: TextStyle(fontSize: 18.0))
              ])),
          Padding(padding: const EdgeInsets.only(top: 10.0)),
          Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(children: <Widget>[
                Text('Psicólogos(as)',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(
                    'Ana Paula M. Bernardo - Psicóloga CRP:/05\n'
                    'Carolina Feitosa - Psicóloga CRP: 05/34763\n'
                    'Carolina Ruggeri - Psicóloga CRP: 05/43013 Professora UVA\n'
                    'Clara Lobo Bello - Psicóloga CRP: 05/48090 Mestranda Psi-UFF\n'
                    'Julia Passos Rufino - Psicóloga CRP: 05/51860 Psicóloga clínica\n'
                    'Mariana Martins Almeida - Psicóloga CRP: 05/49198 Mestranda PPSC-UFF\n'
                    'Paula Cruz Azevedo da silva - Psicóloga CRP: 05/44450 Mestranda Psi-UFF\n'
                    'Paulo Ricardo Licar Gois - Psicólogo CRP 01/21092 Mestranda PPGSC-UFF\n'
                    'Viviane Gouvea - Psicóloga CRP: 05/38362 Mestranda PPSC-UFF\n'
                    'Alan Teixeira Lima - Psicólogo CRP: 05/29878 SPA/IPS/UFF\n'
                    'Cesar Vinicius Alves Afonso - Psicólogo CRP: 05/24593 DSP/CASQ/PROGEPE/UFF\n'
                    'Paloma Lima Ramos Jashar - Psicóloga CRP: 05/53066 SPA/IPS/UFF',
                    style: TextStyle(fontSize: 18.0)),
              ])),
          Padding(padding: const EdgeInsets.only(top: 10.0)),
          Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(children: <Widget>[
                Text('Médicas Psiquiátricas',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text(
                    'Cintia Andrade - Médica psiquiatra CRM: 52 96738-6 MSSISC/UFF\n'
                    'Fernanda Blanco - Médica psiquiatra CRM: 2.0108140-3 Mestranda PPSC-UFF',
                    style: TextStyle(fontSize: 18.0)),
              ])),
          Padding(padding: const EdgeInsets.only(top: 10.0)),
          Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(children: <Widget>[
                Text('Estudantes Bolsistas de Iniciação Científica',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Padding(padding: const EdgeInsets.only(left: 10.0)),
                Text(
                    'Marina Christine Rio Branco - Medicina Ramaiene Pereira Batista - Medicina\nMarcela Fischer - Medicina \nLarissa Wermelinger - Medicina',
                    style: TextStyle(fontSize: 18.0)),
              ])),
          Padding(padding: const EdgeInsets.only(top: 10.0)),
          Container(
              padding: const EdgeInsets.only(left: 20.0),
              child: Column(children: <Widget>[
                Text('Equipe de Computação - APP',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Text('Coordenador:',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Padding(padding: const EdgeInsets.only(left: 10.0)),
                Text('Flávio Luiz Seixas – Docente Ciência da Computação-UFF',
                    style: TextStyle(fontSize: 18.0)),
                Text('Voluntários:',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                Container(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: Text(
                        'Karina Pereira de Lemos,  Ricardo de Monteiro Tavares, Kelly Maria Augusta Tavares Bentes e Eduardo de Oliveira Câmara',
                        style: TextStyle(fontSize: 18.0))),
              ])),
          Padding(padding: const EdgeInsets.only(bottom: 40.0))
        ])));
  }
}
