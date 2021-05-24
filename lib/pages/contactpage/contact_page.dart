import 'package:arkam_software/pages/contactpage/contact_form.dart';
import 'package:arkam_software/pages/contactpage/socal_card.dart';
import 'package:arkam_software/providers/theme_provider.dart';
import 'package:arkam_software/providers/utility_provider.dart';
import 'package:arkam_software/themes/themes.dart';
import 'package:arkam_software/utilities/constants.dart';
import 'package:arkam_software/utilities/helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:arkam_software/utilities/strings.dart';
import 'package:arkam_software/widgets/icon_widgets.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return DesktopContactPage();
      } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200) {
        return TabletContactPage();
      } else {
        return MobileContactPage();
      }
    });

    /*   return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return DesktopContactPage();
      } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200) {
        return TabletContactPage();
      } else {
        return MobileContactPage();
      }
    });     */
  }
}

class DesktopContactPage extends StatefulWidget {
  @override
  _DesktopContactPageState createState() => _DesktopContactPageState();
}

class _DesktopContactPageState extends State<DesktopContactPage> {
  var width;
  var height;
  var utilityProvider;
  var themeProvider;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    utilityProvider = Provider.of<UtilityProvider>(context);
    themeProvider = Provider.of<ThemeProvider>(context);
    scrollController = utilityProvider.getScrollController();
    String language = getLanguage(context);

    return Container(
      // color: Colors.white,
      width: width,
      //height: height,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 60,
          ),
          emailContactWidgetDesktop(
              height, 0.7 * width, 24, 35, themeProvider, language),
          SizedBox(
            height: 60,
          ),
          websiteIcon(),
          SizedBox(
            height: 60,
          ),
          navBarItems(scrollController, context),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class TabletContactPage extends StatefulWidget {
  @override
  _TabletContactPageState createState() => _TabletContactPageState();
}

class _TabletContactPageState extends State<TabletContactPage> {
  var width;
  var height;
  var utilityProvider;
  var themeProvider;
  ScrollController scrollController;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    utilityProvider = Provider.of<UtilityProvider>(context);
    themeProvider = Provider.of<ThemeProvider>(context);
    scrollController = utilityProvider.getScrollController();
    String language = getLanguage(context);

    return Container(
      width: width,
      //height: height,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 60,
          ),
          emailContactWidgetTablet(
              200, 0.9 * width, 24, 28, themeProvider, language),
          SizedBox(
            height: 60,
          ),
          websiteIcon(),
          SizedBox(
            height: 60,
          ),
          navBarItems(scrollController, context),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class MobileContactPage extends StatefulWidget {
  @override
  _MobileContactPageState createState() => _MobileContactPageState();
}

class _MobileContactPageState extends State<MobileContactPage> {
  var width;
  var height;
  var utilityProvider;
  var themeProvider;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    utilityProvider = Provider.of<UtilityProvider>(context);
    themeProvider = Provider.of<ThemeProvider>(context);
    scrollController = utilityProvider.getScrollController();
    String language = getLanguage(context);
    return Container(
      width: width,
      //height: height,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 60,
          ),
          emailContactWidgetMobile(
              200, 0.9 * width, 22, 20, themeProvider, language),
          SizedBox(
            height: 60,
          ),
          websiteIcon(),
          SizedBox(
            height: 60,
          ),
          navBarItems(scrollController, context),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

Widget emailContactWidget(double height, double width, double sayHelloFontSize,
    double emailIDFontSize, ThemeProvider themeProvider, String language) {
  return Material(
    elevation: 15,
    //color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      height: height,
      width: width,
      //color: Colors.white,
      padding: EdgeInsets.all(20),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            kContactCardTitle(language),
            style: TextStyle(
                fontSize: sayHelloFontSize,
                color: themeProvider.getTheme == Themes.lightTheme
                    ? Colors.grey
                    : Colors.black),
          ),
          MaterialButton(
              hoverElevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 25),
              color: Colors.red[400],
              child: Text(
                kContact(language),
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                final url = '';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              }),
        ],
      ),
    ),
  );
}

Widget emailContactWidgetDesktop(
    double height,
    double width,
    double sayHelloFontSize,
    double emailIDFontSize,
    ThemeProvider themeProvider,
    String language) {
  double containerPadding =
      width > 1300 ? kDefaultPadding * 2 : kDefaultPadding * 2;
  return Material(
    elevation: 15,
    // color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      constraints: BoxConstraints(maxWidth: width),
      margin: EdgeInsets.only(top: kDefaultPadding),
      padding: EdgeInsets.all(containerPadding),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            kContactCardTitle(language),
            style: TextStyle(
              fontSize: sayHelloFontSize,
              /*  color: themeProvider.getTheme == Themes.lightTheme
                    ? Colors.black
                    : Colors.grey[100]*/
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SocalCard(
                color: Color(0xFFE4FFC7),
                iconSrc: "lib/images/whatsapp.png",
                name: 'WhatsApp',
                press: _sendWhatsAppMsg,
              ),
              SocalCard(
                color: Color(0xFFE8F0F9),
                iconSrc: "lib/images/messanger.png",
                name: 'Messenger',
                press: sendMessengerMessage,
              ),
              SocalCard(
                color: themeProvider.getTheme == Themes.lightTheme
                    ? Colors.blue[100]
                    : Colors.blue[100], //Color(0xFFD9FFFC),
                iconSrc: "lib/images/skype.png",
                name: '  Skype    ',
                press: sendSkypeMessage,
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 2),
          ContactForm(),
        ],
      ),
    ),
  );
}

Widget emailContactWidgetTablet(
    double height,
    double width,
    double sayHelloFontSize,
    double emailIDFontSize,
    ThemeProvider themeProvider,
    String language) {
  return Material(
    elevation: 15,
    // color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      constraints: BoxConstraints(maxWidth: width),
      margin: EdgeInsets.only(top: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding * 2),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            kContactCardTitle(language),
            style: TextStyle(
              fontSize: sayHelloFontSize,
              /*  color: Colors.black */
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SocalCard(
                color: Color(0xFFE4FFC7),
                iconSrc: "lib/images/whatsapp.png",
                name: 'WhatsApp',
                press: _sendWhatsAppMsg,
              ),
              SizedBox(
                height: 30.0,
              ),
              SocalCard(
                color: Color(0xFFE8F0F9),
                iconSrc: "lib/images/messanger.png",
                name: 'Messenger',
                press: sendMessengerMessage,
              ),
              SizedBox(
                height: 30.0,
              ),
              SocalCard(
                color: themeProvider.getTheme == Themes.lightTheme
                    ? Colors.blue[100]
                    : Colors.blue[100], //Color(0xFFD9FFFC),
                iconSrc: "lib/images/skype.png",
                name: '  Skype    ',
                press: sendSkypeMessage,
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 2),
          ContactForm(),
        ],
      ),
    ),
  );
}

Widget emailContactWidgetMobile(
    double height,
    double width,
    double sayHelloFontSize,
    double emailIDFontSize,
    ThemeProvider themeProvider,
    String language) {
  return Material(
    elevation: 15,
    // color: Colors.white,
    borderRadius: BorderRadius.circular(10),
    child: Container(
      constraints: BoxConstraints(maxWidth: width),
      margin: EdgeInsets.only(top: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding * 1.5),
      decoration: BoxDecoration(
        //   color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Text(
            kContactCardTitle(language),
            style: TextStyle(
              fontSize: sayHelloFontSize,
              //  color: Colors.black
            ),
          ),
          SizedBox(
            height: 30.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SocalCard(
                color: Color(0xFFE4FFC7),
                iconSrc: "lib/images/whatsapp.png",
                name: 'WhatsApp',
                press: _sendWhatsAppMsg,
              ),
              SizedBox(
                height: 30.0,
              ),
              SocalCard(
                color: Color(0xFFE8F0F9),
                iconSrc: "lib/images/messanger.png",
                name: 'Messenger',
                press: sendMessengerMessage,
              ),
              SizedBox(
                height: 30.0,
              ),
              SocalCard(
                color: themeProvider.getTheme == Themes.lightTheme
                    ? Colors.blue[100]
                    : Colors.blue[100], //Color(0xFFD9FFFC),
                iconSrc: "lib/images/skype.png",
                name: '  Skype    ',
                press: sendSkypeMessage,
              ),
            ],
          ),
          SizedBox(height: kDefaultPadding * 2),
          ContactForm(),
        ],
      ),
    ),
  );
}

Widget footerWidget2(
    ThemeProvider themeProvider, ScrollController scrollController, String language) {
  return Container(
    height: 100,
    color: Colors.grey.withOpacity(0.1),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          //crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      kRightsReserved(language),
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Row(
                //mainAxisSize: MainAxisSize.max,
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: Icon(Icons.border_left_outlined),
                      onPressed: () async {
                        await scrollController.animateTo(
                            scrollController.position.minScrollExtent,
                            duration: Duration(seconds: 1),
                            curve: Curves.ease);
                        themeProvider.toggleTheme();
                      }),
                ],
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget iconBarWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    mainAxisSize: MainAxisSize.max,
    children: [
      iconWidget('linkedin'),
      SizedBox(
        width: 20,
      ),
      iconWidget('twitter'),
      SizedBox(
        width: 20,
      ),
      iconWidget('github'),
    ],
  );
}

Widget websiteIcon() {
  return GestureDetector(
    onTap: () {},
    child: Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              border: Border(
                  left: BorderSide(width: 2),
                  right: BorderSide(width: 2),
                  bottom: BorderSide(width: 2),
                  top: BorderSide(width: 2)),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
                bottomRight: Radius.circular(40),
              )),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              kIconFirstLetter,
              // style: TextStyle(
              //     fontSize: 20,
              //     color: Colors.redAccent,
              //     fontWeight: FontWeight.bold),
              style: GoogleFonts.poppins(
                  color: Colors.red, fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Text(
          kIconRemainingLetters,
          // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget navBarItems(ScrollController scrollController, BuildContext context) {
  String language = getLanguage(context);
  return Row(
    // mainAxisSize: MainAxisSize.max,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      /* navBarOptions(kAbout, 1, () {
        scrollController.animateTo(
          scrollController.position.minScrollExtent + 120,
          duration: Duration(seconds: 1),
          curve: Curves.ease,
        );
      }),*/
      SizedBox(
        width: 40,
      ),
      navBarOptions(kServices(language), 2, () {
        scrollController.animateTo(
          0.30 * scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.ease,
        );
      }),
      SizedBox(
        width: 40,
      ),
      navBarOptions(kPortfolio(language), 3, () {
        scrollController.animateTo(
          0.60 * scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.ease,
        );
      }),
      SizedBox(
        width: 40,
      ),
      navBarOptions(kContact(language), 4, () {
        scrollController.animateTo(
          1 * scrollController.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.ease,
        );
      }),
    ],
  );
}

Widget navBarOptions(String title, int position, Function function) {
  return InkWell(
    onTap: function,
    //hoverColor: Colors.grey[200],
    borderRadius: BorderRadius.circular(16),
    child: Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

_sendWhatsAppMsg() async {
  await sendWhatsAppMessage('+59899057586', 'Mensaje arkam web');
}
