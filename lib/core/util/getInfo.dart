import 'package:saude_mental_sus/core/util/converter.dart';

class GetInfo {
  static String getValueFromEnum(Object o) {
    String value = Converter.convertEnumToString(o);

    switch (value) {
      case 'AMB':
        return 'Ambulatório';
      case 'CT':
        return 'Centro de Tratamento';
      case 'CAPS':
        return 'Centro de Atenção Psicossocial';
      case 'GERAL':
        return 'Coord. Geral';
      case 'TECNICA':
        return 'Coord. Técnica';

      default:
        return 'Não encontrado';
    }
  }

  static String getWeekday(int weekDay) {
    switch (weekDay) {
      case 1:
        return 'Domingo';
      case 2:
        return 'Segunda-Feira';
      case 3:
        return 'Terça-Feira';
      case 4:
        return 'Quarta-Feira';
      case 5:
        return 'Quinta-Feira';
      case 6:
        return 'Sexta-Feira';
      case 7:
        return 'Sábado';
      default:
        return 'Dia não encontrado';
    }
  }
}
