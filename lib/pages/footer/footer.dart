import 'package:arkam_software/providers/theme_provider.dart';
import 'package:arkam_software/providers/utility_provider.dart';
import 'package:arkam_software/utilities/helpers.dart';
import 'package:arkam_software/utilities/strings.dart';
import 'package:arkam_software/widgets/icon_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FooterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final utilityProvider = Provider.of<UtilityProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final scrollController = utilityProvider.getScrollController();
    String language = getLanguage(context);

    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth >= 1200) {
        return footerWidgetDesktop(themeProvider, scrollController, language);
      } else if (constraints.maxWidth > 600 && constraints.maxWidth < 1200) {
        return footerWidgetDesktop(themeProvider, scrollController, language);
      } else {
        return footerWidgetMobile(themeProvider, scrollController, language);
      }
    });
  }
}

Widget footerWidgetDesktop(ThemeProvider themeProvider,
    ScrollController scrollController, String language) {
  return Container(
    height: 250,
    color: Colors.grey.withOpacity(0.1),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _iconBarWidget(),
        SizedBox(
          height: 60,
        ),
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
                      icon: Icon(Icons.lightbulb_outline),
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

Widget footerWidgetMobile(ThemeProvider themeProvider,
    ScrollController scrollController, String language) {
  return Container(
    height: 250,
    color: Colors.grey.withOpacity(0.1),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _iconBarWidget(),
        SizedBox(
          height: 60,
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    kRightsReservedMobile(language),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Row(
                //mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                      icon: Icon(Icons.lightbulb_outline),
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

Widget _iconBarWidget() {
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
