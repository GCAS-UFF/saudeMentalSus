import 'package:flutter/material.dart';

class AppBarSearch extends StatefulWidget implements PreferredSizeWidget {
  @override
  _AppBarSearchState createState() => _AppBarSearchState();

  @override
  Size get preferredSize => const Size.fromHeight(50);
}

class _AppBarSearchState extends State<AppBarSearch> {
  String city = 'Niterói';
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(city),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              print("cliquei");
            }),
      ],
    );
  }
}
