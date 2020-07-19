import 'package:flutter/material.dart';

class GenerateListTile {
  static Visibility generateListTile(List list, Icon icon) => Visibility(
      visible: (list.length != 0),
      child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: list.length,
          itemBuilder: (context, index) => ListTile(
                leading: (index == 0) ? icon : null,
                title: Text(list[index]),
              )));
}
