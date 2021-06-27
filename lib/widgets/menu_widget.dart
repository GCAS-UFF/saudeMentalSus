import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:saudeMentalSus/pages/about_page/about_page.dart';
import 'package:saudeMentalSus/pages/equipe_pesquisa_page/equipe_pesquisa_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MenuWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          DrawerHeader(
              child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/Sabegra.uff.jpg"),
                  fit: BoxFit.fill),
              color: Colors.blue,
            ),
          )),
          ListTile(
            leading: Icon(Icons.group, color: Colors.blue, size: 30.0),
            title: Text(
              'Equipe da Pesquisa',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EquipePesquisaPage()),
              )
            },
          ),
          Divider(),
          ListTile(
              leading: Icon(FontAwesomeIcons.instagram,
                  color: Colors.blue, size: 30.0),
              title: Text(
                'Saúde Mental e Bem Estar UFF',
                style: TextStyle(fontSize: 16),
              ),
              onTap: () => {
                    getUrl(
                        'https://www.instagram.com/sabegra.uff/?igshid=183qk8kjht0wc')
                  }),
          Divider(),
          ListTile(
            leading: Icon(Icons.phone_android, color: Colors.blue, size: 30.0),
            title: Text(
              'Aplicativo Saúde Mental',
              style: TextStyle(fontSize: 16),
            ),
            subtitle: Text(
              "Ministério da Saúde",
              style: TextStyle(fontSize: 16.5),
            ),
            onTap: () => {getUrl('https://mobilems.saude.gov.br/saude-mental')},
          ),
          Divider(),
          ListTile(
            leading: ImageIcon(
              AssetImage("assets/images/avaliacao.png"), 
              color: Colors.blue, size: 30.0),
            title: Text(
              'Avalie-nos',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () => {
               launch('https://docs.google.com/forms/d/e/1FAIpQLSczikDb2q0U3maX8v1nerGNRlzIh9BlCwOQbxhMz1ZkX9d9kw/closedform')
              
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.info, color: Colors.blue, size: 30.0),
            title: Text(
              'Sobre',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutPage()),
              )
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.close, color: Colors.blue, size: 30.0),
            title: Text(
              'Fechar',
              style: TextStyle(fontSize: 16),
            ),
            onTap: () => {Navigator.pop(context)},
          ),
        ],
      ),
    ));
  }

  getUrl(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
