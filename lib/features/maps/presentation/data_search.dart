import 'package:flutter/material.dart';

class DataSearch extends SearchDelegate {
  List<String> cities = ['NIterói', 'Campos', 'Araruama'];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: BackButtonIcon(),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: modifica o DataSearch.buildSuggestions para fazer aparecer o que foi feito de busca no back
    List<String> results = (query.isEmpty)
        ? cities
        : cities.where((element) => element.startsWith(query)).toList();
    return ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) => ListTile(
              leading: Icon(Icons.location_city),
              title: Text(results[index]),
              onTap: () {
                close(context, results[index]);
              },
            ));
  }
}
