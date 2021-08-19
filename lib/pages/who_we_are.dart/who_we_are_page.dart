import 'package:arkam_software/providers/language_provider.dart';
import 'package:arkam_software/providers/utility_provider.dart';
import 'package:arkam_software/utilities/helpers.dart';
import 'package:arkam_software/utilities/strings.dart';
import 'package:arkam_software/widgets/icon_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhoWeArePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return WhoWeAreDesktop();
        } else if (constraints.maxWidth > 700 && constraints.maxWidth <= 1200) {
          return WhoWeAreTablet();
        } else {
          return WhoWeAreMobile();
        }
      },
    );
  }
}

class WhoWeAreDesktop extends StatefulWidget {
  WhoWeAreDesktop({Key key}) : super(key: key);

  @override
  _WhoWeAreDesktopState createState() => _WhoWeAreDesktopState();
}

class _WhoWeAreDesktopState extends State<WhoWeAreDesktop> {
  var utilityProvider;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    utilityProvider = Provider.of<UtilityProvider>(context);
    scrollController = utilityProvider.getScrollController();
    final size = MediaQuery.of(context).size;
    String language = getLanguage(context);

    return Material(
      type: MaterialType.card,
      elevation: 20.0,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: Container(
        width: size.width * 0.65,
        padding: EdgeInsets.all(35.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            whoIAmWidget(30, language),
            // SizedBox(
            //   width: 0.20 * width,
            // ),
            whoIamDetailsWidget(size.width * 0.55, scrollController, language),
          ],
        ),
      ),
    );
  }
}

class WhoWeAreTablet extends StatefulWidget {
  WhoWeAreTablet({Key key}) : super(key: key);

  @override
  _WhoWeAreTabletState createState() => _WhoWeAreTabletState();
}

class _WhoWeAreTabletState extends State<WhoWeAreTablet> {
  var utilityProvider;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    utilityProvider = Provider.of<UtilityProvider>(context);
    scrollController = utilityProvider.getScrollController();
    final size = MediaQuery.of(context).size;
    String language = getLanguage(context);

    return Material(
      type: MaterialType.card,
      elevation: 20.0,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: Container(
        width: size.width * 0.9,
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            whoIAmWidget(30, language),
            // SizedBox(
            //   width: 0.20 * width,
            // ),
            whoIamDetailsWidget(size.width * 0.6, scrollController, language),
          ],
        ),
      ),
    );
  }
}

class WhoWeAreMobile extends StatefulWidget {
  WhoWeAreMobile({Key key}) : super(key: key);

  @override
  _WhoWeAreMobileState createState() => _WhoWeAreMobileState();
}

class _WhoWeAreMobileState extends State<WhoWeAreMobile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String language = getLanguage(context);

    return Material(
      type: MaterialType.card,
      elevation: 20.0,
      borderRadius: BorderRadius.all(Radius.circular(8)),
      child: Container(
        width: size.width * 0.9,
        padding: EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            whoIAmWidget(30, language),
            // SizedBox(
            //   width: 0.20 * width,
            // ),
            whoIamDetailsWidgetMobile(size.width * 0.8, context),
          ],
        ),
      ),
    );
  }
}

Widget whoIAmWidget(double fontSize, String language) {
  return Text(kWhoWeAre(language),
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600));
}

Widget whoIamDetailsWidget(
    double width, ScrollController scrollController, String language) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 80.0, vertical: 15.0),
    width: width,
    //height: 80,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kWhoWeAreDetails(language),
          textAlign: TextAlign.left,
          style: TextStyle(
            letterSpacing: 0.5,
            fontSize: 15,
            color: Colors.blueGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                hoverElevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40)),
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                color: Colors.red[400],
                child: Text(
                  kWhoWeAreButton(language),
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  scrollController.animateTo(
                    0.9 * scrollController.position.maxScrollExtent,
                    duration: Duration(seconds: 2),
                    curve: Curves.ease,
                  );
                }),
            SizedBox(
              width: 40,
            ),
            iconWidget('linkedin'),
            SizedBox(
              width: 10,
            ),
            iconWidget('twitter'),
            SizedBox(
              width: 10,
            ),
            iconWidget('github'),
          ],
        )
      ],
    ),
  );
}

Widget whoIamDetailsWidgetMobile(double width, BuildContext context) {
  final languageProvider = Provider.of<LanguageProvider>(context);
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
    width: width,
    //height: 80,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          kWhoWeAreDetails(languageProvider.getLang),
          textAlign: TextAlign.left,
          style: TextStyle(
            letterSpacing: 0.5,
            fontSize: 14,
            color: Colors.blueGrey,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: MaterialButton(
                  hoverElevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40)),
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  color: Colors.red[400],
                  child: Text(
                    'Contact us!',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {}),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                iconWidget('linkedin'),
                SizedBox(
                  width: 10,
                ),
                iconWidget('twitter'),
                SizedBox(
                  width: 10,
                ),
                iconWidget('github'),
              ],
            ),
          ],
        )
      ],
    ),
  );
}
