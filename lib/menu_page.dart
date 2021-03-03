import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:saudeMentalSus/about_page.dart';
import 'package:url_launcher/url_launcher.dart';

class NavDrawer extends StatelessWidget {
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
              openUrl_ProfessorResearch()
            },
          ),
          ListTile(
            leading: Icon(Icons.account_balance),
            title: Text('Página do governo',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () => {
              openUrl_GovernamentPage()
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

  openUrl_GovernamentPage() async {
    const url = 'https://flutterando.com.br/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  openUrl_ProfessorResearch() async {
    const url = 'https://www.facebook.com/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
