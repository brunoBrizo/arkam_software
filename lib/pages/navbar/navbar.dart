import 'package:arkam_software/providers/language_provider.dart';
import 'package:arkam_software/utilities/helpers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:arkam_software/providers/utility_provider.dart';
import 'package:arkam_software/utilities/strings.dart';

class TopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return DesktopNavbar();
        } else if (constraints.maxWidth > 750 && constraints.maxWidth < 1200) {
          return TabletNavbar();
        } else {
          return MobileNavbar();
        }
      },
    );
  }
}

class DesktopNavbar extends StatefulWidget {
  @override
  _DesktopNavbarState createState() => _DesktopNavbarState();
}

class _DesktopNavbarState extends State<DesktopNavbar> {
  var utilityProvider;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    utilityProvider = Provider.of<UtilityProvider>(context);
    scrollController = utilityProvider.getScrollController();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 32),
        child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Flexible(child: websiteIcon()),
              Flexible(
                  child: navBarItems(scrollController, height, width, context)),
              Container(
                width: 45.0,
                child: DropdownButton(
                  isExpanded: true,
                  iconSize: 25.0,
                  hint: Text('Language'),
                  value: languageProvider.getLang,
                  items: getDropDownLanguageItems(),
                  onChanged: (selectedLanguage) {
                    final languageProvider =
                        Provider.of<LanguageProvider>(context, listen: false);
                    languageProvider.changeLanguage(selectedLanguage);
                  },
                ),
              )
            ])));
  }
}

class TabletNavbar extends StatefulWidget {
  @override
  _TabletNavbarState createState() => _TabletNavbarState();
}

class _TabletNavbarState extends State<TabletNavbar> {
  var utilityProvider;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    utilityProvider = Provider.of<UtilityProvider>(context);
    scrollController = utilityProvider.getScrollController();
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final languageProvider = Provider.of<LanguageProvider>(context);
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32),
        child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
              Flexible(child: websiteIcon()),
              Flexible(
                  child: navBarItems(scrollController, height, width, context)),
              Container(
                width: 45.0,
                child: DropdownButton(
                  isExpanded: true,
                  iconSize: 25.0,
                  hint: Text('Language'),
                  value: languageProvider.getLang,
                  items: getDropDownLanguageItems(),
                  onChanged: (selectedLanguage) {
                    final languageProvider =
                        Provider.of<LanguageProvider>(context, listen: false);
                    languageProvider.changeLanguage(selectedLanguage);
                  },
                ),
              )
            ])));
  }
}

class MobileNavbar extends StatefulWidget {
  @override
  _MobileNavbarState createState() => _MobileNavbarState();
}

class _MobileNavbarState extends State<MobileNavbar> {
  var utilityProvider;
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    utilityProvider = Provider.of<UtilityProvider>(context);
    scrollController = utilityProvider.getScrollController();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16),
            child: websiteIconMobile(context)),
        SizedBox(
          height: 20,
        ),
        navBarItems(scrollController, height, width, context),
      ],
    ));
  }
}

Widget websiteIcon() {
  return GestureDetector(
    onTap: () {},
    child: Row(
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
              style: GoogleFonts.poppins(
                  color: Colors.red, fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Text(
          kIconRemainingLetters,
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ],
    ),
  );
}

Widget websiteIconMobile(BuildContext context) {
  final languageProvider = Provider.of<LanguageProvider>(context);
  return GestureDetector(
    onTap: () {},
    child: Row(
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
              style: GoogleFonts.poppins(
                  color: Colors.red, fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Text(
          kIconRemainingLetters,
          style: GoogleFonts.poppins(fontSize: 25, fontWeight: FontWeight.w600),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Container(
            width: 45.0,
            child: DropdownButton(
              isExpanded: true,
              iconSize: 25.0,
              hint: Text('Language'),
              value: languageProvider.getLang,
              items: getDropDownLanguageItems(),
              onChanged: (selectedLanguage) {
                final languageProvider =
                    Provider.of<LanguageProvider>(context, listen: false);
                languageProvider.changeLanguage(selectedLanguage);
              },
            ),
          ),
        )
      ],
    ),
  );
}

Widget navBarItems(ScrollController scrollController, double height,
    double width, BuildContext context) {
  String language = getLanguage(context);
  //double animateTo = _getAnimateToServices(height);
  double padding = _getNavBarItemsPadding(width);
  //final languageProvider = Provider.of<LanguageProvider>(context);
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: padding),
    child: Row(
      // mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        navBarOptions(kServices(language), 2, () {
          scrollController.animateTo(
            _getAnimateToServices(height) *
                scrollController.position.maxScrollExtent,
            duration: Duration(seconds: 2),
            curve: Curves.ease,
          );
        }),
        navBarOptions(kPortfolio(language), 3, () {
          scrollController.animateTo(
            0.60 * scrollController.position.maxScrollExtent,
            duration: Duration(seconds: 2),
            curve: Curves.ease,
          );
        }),
        navBarOptions(kContact(language), 4, () {
          scrollController.animateTo(
            _getAnimateToContact(height) *
                scrollController.position.maxScrollExtent,
            duration: Duration(seconds: 2),
            curve: Curves.ease,
          );
        }),
      ],
    ),
  );
}

Widget navBarOptions(String title, int position, Function function) {
  return InkWell(
    onTap: function,
    // hoverColor: Colors.grey[200],
    borderRadius: BorderRadius.circular(16),
    child: Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Text(
        title,
        // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
      ),
    ),
  );
}

double _getAnimateToServices(double height) {
  //print('height ' + height.toString());
  double ret = 0;
  if (height < 800) {
    ret = 0.23;
  } else if (height >= 800 && height <= 860) {
    ret = 0.25;
  } else {
    ret = 0.26;
  }
  return ret;
}

double _getAnimateToContact(double height) {
  print('height ' + height.toString());
  double ret = 0;
  if (height < 800) {
    ret = 0.77;
  } else if (height >= 800 && height <= 860) {
    ret = 0.8;
  } else {
    ret = 0.911;
  }
  return ret;
}

double _getNavBarItemsPadding(double width) {
  double ret = 0;
  if (width > 1200) {
    ret = 80.0;
  } else if (width > 950 && width <= 1200) {
    ret = 30.0;
  } else if (width > 750 && width <= 950) {
    ret = 17.0;
  } else {
    ret = 50.0;
  }
  return ret;
}

final List<String> languages = [
  'EN',
  'ES',
  'PT',
];

List<DropdownMenuItem<String>> getDropDownLanguageItems() {
  List<DropdownMenuItem<String>> items = [];
  for (String language in languages) {
    items.add(new DropdownMenuItem(value: language, child: new Text(language)));
  }
  return items;
}

void changedDropDownLanguageItem(
    String selectedLanguage, BuildContext context) {
  final languageProvider = Provider.of<LanguageProvider>(context);
  languageProvider.changeLanguage(selectedLanguage);
}
