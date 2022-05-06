import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:minidiary/services/sharedPref.dart';
import 'screens/home.dart';
import 'data/theme.dart';


class SecondRoute extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  ThemeData theme = appThemeLight;
  @override
  void initState() {
    super.initState();
    updateThemeFromSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notes',
      theme: theme,
      home: MyHomePage(title: 'Home', changeTheme: setTheme),
      debugShowCheckedModeBanner: false,
    );
  }

  setTheme(Brightness brightness) {
    if (brightness == Brightness.dark) {
      setState(() {
        theme = appThemeDark;
      });
    } else {
      setState(() {
        theme = appThemeLight;
      });
    }
  }

  void updateThemeFromSharedPref() async {
    String themeText = await getThemeFromSharedPref();
    if (themeText == 'light') {
      setTheme(Brightness.light);
    } else {
      setTheme(Brightness.dark);
    }
  }
}