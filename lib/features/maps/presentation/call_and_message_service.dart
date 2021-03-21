import 'package:url_launcher/url_launcher.dart';

class CallsAndMessageService {
  static void call(String number) => launch("tel:$number");
  static void sendEmail(String email) => launch("mailto:$email");
}