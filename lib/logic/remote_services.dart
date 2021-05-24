import 'package:arkam_software/models/project_email.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RemoteServices {
  static var client = http.Client();
  //urls
  static final Uri _emailUrl = Uri.parse('https://arkamsupport.com/api/email/');

  static Future<String> sendEmail(Email email) async {
    try {
      var body = json.encode(email);
      var response = await client.post(_emailUrl,
          body: body, headers: {"Content-Type": "application/json"});

      if (response.statusCode == 200) {
        return "Email enviado!";
      } else {
        return response.body;
      }
    } on Exception catch (e) {
      return e.toString();
    }
  }
}
