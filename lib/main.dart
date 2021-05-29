import 'dart:async';
import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';/// This is the main method of app, from here execution starts.
import 'package:minidiary/ThirdRoute.dart';
import 'package:minidiary/todoui.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'SecondRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splash Screen',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Splash2(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class Splash2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      navigateAfterSeconds: new App(),
      title: new Text('YOURS MINIDIARY',textScaleFactor: 2,),
      image: new Image.asset('assets/images/splash.jpg'),
      loadingText: Text("Here you go"),
      photoSize: 250.0,
      loaderColor: Colors.blue,
    );
  }
}
class App extends StatelessWidget {
  final pages = [
    PageViewModel(
      pageBackground: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated,
            colors: [
              Colors.blue,
              Colors.pinkAccent,
            ],
          ),
        ),
      ),
      iconImageAssetPath: 'assets/images/diary.png',
      body: const Text(
        'An application to maintain your todolist,diary,expenses',
      ),
      title: const Text('YOURS MINIDIARY'),
      mainImage: Image.asset(
        'assets/images/diary.png',
        height: 400.0,
        width: 400.0,
        alignment: Alignment.center,
      ),
      titleTextStyle:
      const TextStyle(fontFamily: 'MyFont', color: Colors.red),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.amber),
    ),
    PageViewModel(
      pageBackground: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated,
            colors: [
              Colors.white12,
              Colors.greenAccent,
            ],
          ),
        ),
      ),
      iconImageAssetPath: 'assets/images/todo.jpg',
      body: const Text(
        'Listdown your TODO Of the day',
      ),
      title: const Text('TODO LIST'),
      mainImage: Image.asset(
        'assets/images/todo.jpg',
        height: 400.0,
        width: 400.0,
        alignment: Alignment.center,
      ),
      titleTextStyle:
      const TextStyle(fontFamily: 'MyFont', color: Colors.red),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.blueAccent),
    ),
    PageViewModel(
      pageBackground: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated,
            colors: [
              Colors.black,
              Colors.black87,
            ],
          ),
        ),
      ),
      iconImageAssetPath: 'assets/images/diary1.gif',
      body: const Text(
        'Write your experience and plannings of your day',
      ),
      title: const Text('DIARY'),
      mainImage: Image.asset(
        'assets/images/diary1.gif',
        height: 400.0,
        width: 400.0,
        alignment: Alignment.center,
      ),
      titleTextStyle:
      const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),

    PageViewModel(
      pageBackground: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            stops: [0.0, 1.0],
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            tileMode: TileMode.repeated,
            colors: [
              Colors.orange,
              Colors.pinkAccent,
            ],
          ),
        ),
      ),
      iconImageAssetPath: 'assets/images/expenses.gif',
      body: const Text(
        'Record your expenses',
      ),
      title: const Text('EXPENSE TRACKER'),
      mainImage: Image.asset(
        'assets/images/expenses.gif',
        height: 400.0,
        width: 400.0,
        alignment: Alignment.center,
      ),
      titleTextStyle:
      const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      bodyTextStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MINIDIARY',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          showNextButton: true,
          showBackButton: true,
          onTapDoneButton: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) =>MyHomePage()),
            );
          },
          pageButtonTextStyles: const TextStyle(
            color: Colors.white,
            fontSize: 18.0,),
        ),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black45,
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.done), text: "TODO",),
              Tab(icon: Icon(Icons.calendar_today_outlined), text: "DIARY"),
              Tab(icon: Icon(Icons.money_outlined), text: "EXPENSES",),
            ],
          ),
          title: Text('MINIDIARY'),
        ),
        body: TabBarView(
          children: [

            //Center( child: Text("Page 2")),
            Container(
               //Text("Hello! I am in the container widget", style: TextStyle(fontSize: 25)),
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/pointer.png'),
                  fit: BoxFit.fill,
                ),
                //shape: BoxShape.circle,
              ),
              margin: EdgeInsets.all(25),
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                child: Text('ADD TODO', style: TextStyle(fontSize: 20.0),),
                color: Colors.black,
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.red, width: 3),
                ),
                //alignment:Alignment.bottomCenter,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => todoui()),
                  );
                },
              ),
            ),

            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/pointer.png'),
                  fit: BoxFit.fill,
                ),
                //shape: BoxShape.circle,
              ),
              margin: EdgeInsets.all(25),
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                child: Text('DIARY', style: TextStyle(fontSize: 20.0),),
                color: Colors.black,
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.red, width: 3),
                ),
                //alignment:Alignment.bottomCenter,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );
                },
              ),
            ),
            Container(
              // child:Image.network('https://images.shiksha.com/mediadata/images/1595847039phpTRsobh.jpeg');
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/pointer.png'),
                  fit: BoxFit.fill,
                ),
                //shape: BoxShape.circle,
              ),
              margin: EdgeInsets.all(25),
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                child: Text('ADD EXPENSES', style: TextStyle(fontSize: 20.0),),
                color: Colors.black,
                shape: StadiumBorder(
                  side: BorderSide(color: Colors.red, width: 3),
                ),
                //alignment:Alignment.bottomCenter,
                textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdRoute()),
                  );
                },
              ),
            ),
          ],
        ),
      ),


);

  }
}

