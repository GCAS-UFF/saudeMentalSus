import 'package:flutter/material.dart';
import 'package:saudeMentalSus/features/google/services/callAndMessageService.dart';

class GenerateListTile {
  static Visibility generateListTile(List<String> list, IconData icon) =>
      Visibility(
          visible: (list.length != 0),
          child: ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: list.length,
              itemBuilder: (context, index) => ListTile(
                    leading: (index == 0)
                        ? Icon(
                            icon,
                            color: Colors.blue[400],
                          )
                        : CircleAvatar(
                            backgroundColor: Colors.white,
                          ),
                    title: Text(list[index]),
                    onTap: () {
                      if (list[index].contains('@')) {
                        CallsAndMessageService.sendEmail(list[index]);
                      } else {
                        CallsAndMessageService.call(list[index]);
                      }
                    },
                  )));
}
