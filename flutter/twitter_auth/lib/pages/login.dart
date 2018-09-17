import 'package:flutter/material.dart';
import 'package:flutter_twitter_login/flutter_twitter_login.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  var _twitterLogin = new TwitterLogin(
    consumerKey: '',
    consumerSecret: ''
  );
  TwitterSession session;

  @override
  Widget build(BuildContext context) =>
    Scaffold(
      appBar: AppBar(title: Text('Twitter Auth Sample')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(session?.username ?? ''),
            Text(session?.userId ?? ''),
            RaisedButton(
              onPressed: _onClick,
              child: Text('Twitter Login')
            )
          ],
        )
      )
    );

  _onClick() async {
    // token, secret, userid, usernameがsesionに格納される
    var result = await _twitterLogin.authorize();
    switch (result.status) {
      case TwitterLoginStatus.loggedIn:
        print('logined successfully');
        setState(() => session = result.session);
        break;
      case TwitterLoginStatus.cancelledByUser:
        print('cancelled by user');
        break;
      case TwitterLoginStatus.error:
        print(result.errorMessage);
        break;
    }
  }
}
