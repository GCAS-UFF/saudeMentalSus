import 'package:flutter/material.dart';
import 'package:saudeMentalSus/features/maps/presentation/data_search.dart';

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
              final newCity =
                  await showSearch(context: context, delegate: DataSearch());
              print(newCity);
            }),
      ],
    );
  }
}
