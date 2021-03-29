import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study/mainUI/login/DashboardScreen.dart';
import 'package:flutter_study/mainUI/login/Login_Screen.dart';
import 'package:flutter_study/mainUI/login/Transition_route_observer.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor:
          SystemUiOverlayStyle.dark.systemNavigationBarColor,
      ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp (
      title: '전통시장 시장 관리자',
      theme: ThemeData(//Theme 설정
        // brightness: Brightness.light,
        // backgroundColor: Colors.white,
        primarySwatch: MaterialColor(0xffffffff, {
          50: Color(0xaaffffff),
          100: Color(0xbbffffff),
          200: Color(0xccffffff),
          300: Color(0xddffffff),
          400: Color(0xeeffffff),
          500: Color(0xffffffff),
          600: Color(0xffffffff),
          700: Color(0xffffffff),
          800: Color(0xffffffff),
          900: Color(0xffffffff),
        }),
        // scaffoldBackgroundColor: const Color(0xffffffff),
        // accentColor: Colors.white,
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.orange),//텍스트 선택 테마
        //fontFamily: 'SourceSansPro'
        textTheme: TextTheme(
          headline3: TextStyle(
            fontFamily: 'OpnSans',
            fontSize: 45.0,
            fontWeight: FontWeight.w900,
            color: Color.fromARGB(255, 22, 22, 255),
          ),
          button: TextStyle(
            //OpenSans is similar to NotoSans but the uppercases look a bit better IMO
            fontFamily: 'OpenSans'
          ),
          caption: TextStyle(
            fontFamily: 'NotoSans',
            fontSize: 12.0,
            fontWeight: FontWeight.normal,
            color: Colors.deepPurple[300],
          ),
          headline1: TextStyle(fontFamily: 'Quicksand'),
          headline2: TextStyle(fontFamily: 'Quicksand'),
          headline4: TextStyle(fontFamily: 'Quicksand'),
          headline5: TextStyle(fontFamily: 'NotoSans'),
          headline6: TextStyle(fontFamily: 'NotoSans'),
          subtitle1: TextStyle(fontFamily: 'NotoSans'),
          bodyText1: TextStyle(fontFamily: 'NotoSans'),
          bodyText2: TextStyle(fontFamily: 'NotoSans'),
          subtitle2: TextStyle(fontFamily: 'NotoSans'),
          overline: TextStyle(fontFamily: 'NotoSans'),
        ),
      ),
      home: LoginScreen(),
      navigatorObservers: [TransitionRouteObserver()],
      //페이지 이동 등록(Router)
      initialRoute: LoginScreen.routeName,
        routes: {
          LoginScreen.routeName: (context) => LoginScreen(),
          DashboardScreen.routeName: (context) => DashboardScreen(),
        },
    );
  }
}








