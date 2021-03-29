import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:flutter_study/mainUI/login/Custom_route.dart';
import 'package:flutter_study/mainUI/login/DashboardScreen.dart';
import 'package:flutter_study/mainUI/login/constants.dart';
import 'Users.dart';

class LoginScreen extends StatelessWidget {
  static const routeName = '/auth';

  Duration get loginTime => Duration(milliseconds: timeDilation.ceil() * 2250);

  ///login 체크 부분
  Future<String> _loginUser(LoginData data) {
    return Future.delayed(loginTime).then((value) {
      if(!mockUsers.containsKey(data.name)) {
        return 'Username not Exits';
      }
      if(mockUsers[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String> _recoverPassword(String name) {
    return Future.delayed(loginTime).then((value) {
      if(!mockUsers.containsKey(name)) {
        return 'Username not exists';
      }
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: Constants.appName,
      logo: 'assets/images/img-sample1.png',//logo Image
      titleTag: Constants.titleTag,
      //
      emailValidator: (value) {
        if(!value.contains('@') || !value.endsWith('.com')) {
          return "Email must contain '@' and end with .com";
        }
        return null;
      },
      passwordValidator: (value) {
        if(value.isEmpty) {
          return 'Password is empty';
        }
        return null;
      },
      onLogin: (loginData) {
        print('Login info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSignup: (loginData) {
        print('Signup info');
        print('Name: ${loginData.name}');
        print('Password: ${loginData.password}');
        return _loginUser(loginData);
      },
      onSubmitAnimationCompleted: () {
        Navigator.of(context).pushReplacement(FadePageRoute(
          builder: (context) => DashboardScreen(),
        ));
      },
      onRecoverPassword: (name) {
        print('Recover password info');
        print('Name: $name');
        return _recoverPassword(name);
      },
      showDebugButtons: false,//debug Button
    );
  }

}