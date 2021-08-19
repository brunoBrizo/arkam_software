import 'package:arkam_software/utilities/helpers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:arkam_software/providers/utility_provider.dart';
import 'package:arkam_software/utilities/strings.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ServicesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopServicesPage();
        } else if (constraints.maxWidth > 700 && constraints.maxWidth <= 1200) {
          return TabletServicesPage();
        } else {
          return MobileServicesPage();
        }
      },
    );
  }
}

class DesktopServicesPage extends StatefulWidget {
  @override
  _DesktopServicesPageState createState() => _DesktopServicesPageState();
}

class _DesktopServicesPageState extends State<DesktopServicesPage> {
  var width;
  var height;
  var utilityProvider;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    utilityProvider = Provider.of<UtilityProvider>(context);
    String language = getLanguage(context);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.1 * width),
      width: width,
      //height: height * 1.25,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: whatIDoWidget(45, language)),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              whatIDoCard(
                  Colors.amber.withOpacity(0.4),
                  Icon(
                    FontAwesome5Solid.user_edit,
                    size: 65.0,
                    color: Colors.white,
                  ),
                  kCard1title,
                  kCard1Descrption(language),
                  width,
                  height,
                  0.24 * width,
                  450,
                  18,
                  14),
              whatIDoCard(
                  Colors.red[900].withOpacity(0.4),
                  Icon(
                    FontAwesome5Solid.mobile_alt,
                    size: 65.0,
                    color: Colors.white,
                  ),
                  kCard2title(language),
                  kCard2Descrption(language),
                  width,
                  height,
                  0.24 * width,
                  450,
                  18,
                  14),
              whatIDoCard(
                  Colors.teal[600].withOpacity(0.4),
                  Icon(
                    FontAwesome5Solid.desktop,
                    size: 65.0,
                    color: Colors.white,
                  ),
                  kCard3title(language),
                  kCard3Descrption(language),
                  width,
                  height,
                  0.24 * width,
                  450,
                  18,
                  14),
            ],
          ),
          SizedBox(
            height: 40.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              whatIDoCard(
                  Colors.blueAccent.withOpacity(0.4),
                  Icon(
                    FontAwesome5Solid.globe,
                    size: 65.0,
                    color: Colors.white,
                  ),
                  kCard4title,
                  kCard4Descrption(language),
                  width,
                  height,
                  0.24 * width,
                  450,
                  18,
                  14),
              whatIDoCard(
                  Colors.green.withOpacity(0.4),
                  Icon(
                    FontAwesome5Solid.exchange_alt,
                    size: 65.0,
                    color: Colors.white,
                  ),
                  kCard5title,
                  kCard5Descrption(language),
                  width,
                  height,
                  0.24 * width,
                  450,
                  18,
                  14),
              whatIDoCard(
                  Colors.orange[800].withOpacity(0.4),
                  Icon(
                    FontAwesome5Solid.tools,
                    size: 65.0,
                    color: Colors.white,
                  ),
                  kCard6title(language),
                  kCard6Descrption(language),
                  width,
                  height,
                  0.24 * width,
                  450,
                  18,
                  14),
            ],
          ),
          SizedBox(
            height: 80.0,
          ),
          /*        Row(
            mainAxisSize: MainAxisSize.max,
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 40.0),
                  child: whoIAmWidget(45),
                ),
              ),
              SizedBox(
                width: 0.20 * width,
              ),
              whoIamDetailsWidget(80)
            ],
          ),            */
        ],
      ),
    );
  }
}

class TabletServicesPage extends StatefulWidget {
  @override
  _TabletServicesPageState createState() => _TabletServicesPageState();
}

class _TabletServicesPageState extends State<TabletServicesPage> {
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    String language = getLanguage(context);
    double heightContainer = height > 780 ? height + 180.0 : height + 340.0;
    return Container(
      width: width,
      height: heightContainer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(child: whatIDoWidget(30, language)),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              whatIDoCard(
                  Colors.amber.withOpacity(0.4),
                  Icon(
                    FontAwesome5Solid.user_edit,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  kCard1title,
                  kCard1Descrption(language),
                  width,
                  height,
                  0.3 * width,
                  400,
                  14,
                  12),
              whatIDoCard(
                  Colors.red[900].withOpacity(0.4),
                  Icon(
                    FontAwesome5Solid.mobile_alt,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  kCard2title(language),
                  kCard2Descrption(language),
                  width,
                  height,
                  0.3 * width,
                  400,
                  14,
                  12),
              whatIDoCard(
                  Colors.teal[600].withOpacity(0.4),
                  Icon(
                    FontAwesome5Solid.desktop,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  kCard3title(language),
                  kCard3Descrption(language),
                  width,
                  height,
                  0.3 * width,
                  400,
                  14,
                  12),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              whatIDoCard(
                  Colors.blueAccent.withOpacity(0.4),
                  Icon(
                    FontAwesome5Solid.globe,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  kCard4title,
                  kCard4Descrption(language),
                  width,
                  height,
                  0.3 * width,
                  400,
                  14,
                  12),
              whatIDoCard(
                  Colors.green.withOpacity(0.4),
                  Icon(
                    FontAwesome5Solid.exchange_alt,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  kCard5title,
                  kCard5Descrption(language),
                  width,
                  height,
                  0.3 * width,
                  400,
                  14,
                  12),
              whatIDoCard(
                  Colors.orange[800].withOpacity(0.4),
                  Icon(
                    FontAwesome5Solid.tools,
                    size: 60.0,
                    color: Colors.white,
                  ),
                  kCard6title(language),
                  kCard6Descrption(language),
                  width,
                  height,
                  0.3 * width,
                  400,
                  14,
                  12),
            ],
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class MobileServicesPage extends StatefulWidget {
  @override
  _MobileServicesPageState createState() => _MobileServicesPageState();
}

class _MobileServicesPageState extends State<MobileServicesPage> {
  var width;
  var height;

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    String language = getLanguage(context);
    //double heighContainer = height + 150.0;
    return Container(
      //color: Colors.red,
      padding: EdgeInsets.only(left: 20, right: 20),
      width: width,
      // height: heighContainer,
      child: Column(
        children: [
          whatIDoWidget(30, language),
          SizedBox(
            height: 30,
          ),
          whatIdoCardMobile(
            height,
            width,
            Colors.amber.withOpacity(0.4),
            Icon(
              FontAwesome5Solid.user_edit,
              size: 50.0,
              color: Colors.white,
            ),
            kCard1title,
            kCard1Descrption(language),
          ),
          whatIdoCardMobile(
            height,
            width,
            Colors.red[900].withOpacity(0.4),
            Icon(
              FontAwesome5Solid.mobile_alt,
              size: 50.0,
              color: Colors.white,
            ),
            kCard2title(language),
            kCard2Descrption(language),
          ),
          whatIdoCardMobile(
            height,
            width,
            Colors.teal[600].withOpacity(0.4),
            Icon(
              FontAwesome5Solid.desktop,
              size: 50.0,
              color: Colors.white,
            ),
            kCard3title(language),
            kCard3Descrption(language),
          ),
          whatIdoCardMobile(
            height,
            width,
            Colors.blueAccent.withOpacity(0.4),
            Icon(
              FontAwesome5Solid.globe,
              size: 50.0,
              color: Colors.white,
            ),
            kCard4title,
            kCard4Descrption(language),
          ),
          whatIdoCardMobile(
            height,
            width,
            Colors.green.withOpacity(0.4),
            Icon(
              FontAwesome5Solid.exchange_alt,
              size: 50.0,
              color: Colors.white,
            ),
            kCard5title,
            kCard5Descrption(language),
          ),
          whatIdoCardMobile(
            height,
            width,
            Colors.orange[800].withOpacity(0.4),
            Icon(
              FontAwesome5Solid.tools,
              size: 50.0,
              color: Colors.white,
            ),
            kCard6title(language),
            kCard6Descrption(language),
          ),

          //      whoIAmWidget(30),
          //    whoIamDetailsWidget(5)
        ],
      ),
    );
  }
}

Widget whatIDoWidget(double fontSize, String language) {
  return Text(kWhatIdo(language),
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600));
}

Widget whatIDoCard(
    Color color,
    Icon icon,
    String title,
    String description,
    double devWidth,
    double devHeight,
    double cardWidth,
    double cardHeight,
    double cardTitleTextSize,
    double cardDescriptionTextSize) {
  return Material(
    //color: Colors.white54,
    //shadowColor: Colors.tealAccent,
    borderRadius: BorderRadius.all(Radius.circular(8)),
    elevation: 20,
    child: Container(
      width: cardWidth,
      height: cardHeight,
      decoration: BoxDecoration(
          border: Border.all(
              width: 0.2, color: Colors.white12, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 140,
                height: 140,
                color: color,
                child: Center(
                  child: icon,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 60,
          ),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: cardTitleTextSize, fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                letterSpacing: 0.5,
                fontSize: cardDescriptionTextSize,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget whatIdoCardMobile(double height, double width, Color color, Icon icon,
    String title, String description) {
  return Column(
    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Container(
        //color: Colors.black,
        height: 160,
        width: width,
        child: Material(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          elevation: 20,
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: color,
                ),
                width: 120,
                //height: height / 7,
                child: Center(
                  child: icon,
                ),
              ),
              Flexible(
                fit: FlexFit.loose,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, top: 16),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          description,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            letterSpacing: 0.5,
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );
}
