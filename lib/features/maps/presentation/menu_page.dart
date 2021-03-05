import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saudeMentalSus/features/maps/presentation/about_page.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        children: <Widget>[
          DrawerHeader(
            padding: const EdgeInsets.fromLTRB(60, 65, 0, 0),
            child: Text(
              'Saúde Mental SUS',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            decoration: BoxDecoration(

              color: Colors.blue,
            ),
          ),
          ListTile(
            leading: Icon(Icons.assignment),
            title: Text('Pesquisa',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () => {

            },
          ),
          ListTile(
            leading: Icon(Icons.phone_android),
            title: Text('Saúde Mental MS',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () => {
              getUrl('https://mobilems.saude.gov.br/saude-mental')
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Sobre',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () => {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => AboutPage()),
              )
            },
          ),
          ListTile(
            contentPadding: EdgeInsets.only(top: 400, left: 10),
            leading: Icon(Icons.arrow_back),
            title: Text('Fechar',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () => {
              Navigator.pop(context)
            },
          ),
        ],
      ),
    );
  }


  getUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


}
