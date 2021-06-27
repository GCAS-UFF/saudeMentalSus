import 'package:flutter/material.dart';
import 'package:saudeMentalSus/data/entities/reception.dart';
import 'package:saudeMentalSus/services/call_and_message_service.dart';

class GenerateListItems {
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

  static ListTile generateOpeningHours(List<Reception> list) => ListTile(
      leading: Icon(
        Icons.access_time,
        color: Colors.blue[400],
      ),
      title: Text("Horário de atendimento: ",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
      subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(
              list.length, (index) => Text(list[index].toString()))));
}
