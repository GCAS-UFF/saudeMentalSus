class Converter {
  static List<String> convertListDynamicToListString(List<dynamic> inputs) {
    if (inputs == null) return null;
    List<String> result = List<String>();
    for (String string in inputs) {
      result.add(string);
    }
    return result;
  }
}
