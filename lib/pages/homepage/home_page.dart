import 'package:arkam_software/pages/aboutpage/about_page.dart';
import 'package:arkam_software/pages/contactpage/contact_page.dart';
import 'package:arkam_software/pages/footer/footer.dart';
import 'package:arkam_software/pages/navbar/navbar.dart';
import 'package:arkam_software/pages/portfoliopage/portfolio_page.dart';
import 'package:arkam_software/pages/servicespage/services_page.dart';
import 'package:arkam_software/pages/who_we_are.dart/who_we_are_page.dart';
import 'package:arkam_software/providers/theme_provider.dart';
import 'package:arkam_software/providers/utility_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var utilityProvider;
  var width;
  var height;
  var themeProvider;
  ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    utilityProvider = Provider.of<UtilityProvider>(context);
    themeProvider = Provider.of<ThemeProvider>(context);
    scrollController = utilityProvider.getScrollController();
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    //String language = getLanguage(context);

    return Scaffold(
      body: SingleChildScrollView(
          controller: utilityProvider.getScrollController(),
          //physics: PageScrollPhysics(),
          child: Column(
            children: [
              TopNavbar(),
              AboutPage(),
              ServicesPage(),
              SizedBox(
                height: 5.0,
              ),
              WhoWeArePage(),
              SizedBox(
                height: 30.0,
              ),
              PortfolioPage(),
              SizedBox(
                height: 30.0,
              ),
              ContactPage(),
              SizedBox(
                height: 30.0,
              ),
              FooterPage()
            ],
          )),
    );
  }
}
