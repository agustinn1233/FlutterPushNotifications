import 'package:flutter/material.dart';
import 'package:flutter_pushnofitications_app/src/pages/home.dart';
import 'package:flutter_pushnofitications_app/src/pages/message.dart';
import 'package:flutter_pushnofitications_app/src/providers/pushNotifications.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();

    final pushProvider = new PushNotifications();
    pushProvider.initNotifications();

    pushProvider.mensajesStream.listen((data) {
      // print('argumento desde main: $argumento');
      // Navigator.pushNamed(context, 'mensaje');
      navigatorKey.currentState.pushNamed('mensaje', arguments: data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      title: 'Material App',
      initialRoute: 'home',
      routes: {
        'home': (BuildContext c) => HomePage(),
        'mensaje': (BuildContext c) => MessagePage(),
      },
    );
  }
}
