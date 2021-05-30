class Converter {
  static List<String>? convertListDynamicToListString(List<dynamic>? inputs) {
    if (inputs == null) return null;
    List<String> result = [];
    for (String string in inputs) {
      result.add(string);
    }
    return result;
  }

  static String convertEnumToString<T>(T o) => o.toString().split('.').last;

  static T convertStringToEnum<T>(String value, List<T> values) =>
      values.firstWhere((element) => value == convertEnumToString(element));
}
