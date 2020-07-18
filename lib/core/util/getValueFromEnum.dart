import 'package:saudeMentalSus/core/util/converter.dart';

String getValueFromEnum(Object o) {
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
