import 'package:arkam_software/providers/language_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

sendWhatsAppMessage(String phone, String message) async {
  await launch("https://wa.me/$phone?text=$message");
}

sendMessengerMessage() async {
  await launch("https://m.me/bbrizolara/");
}

sendSkypeMessage() async {
  await launch('skype:live:.cid.d14580b3b89b7fb');
}

String dateParsed(DateTime date) {
  var formatedDate = DateFormat("dd-MM-yyyy").format(date);
  return formatedDate;
}

String getLanguage(BuildContext context) {
  final languageProvider = Provider.of<LanguageProvider>(context);
  return languageProvider.getLang;
}
