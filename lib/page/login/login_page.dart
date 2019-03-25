import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  final String title;
  LoginPage({Key key, this.title}) : super(key: key);

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {

  String _phoneNum = '';

  void _checkPhoneNum(val) {
    setState(() {
      _phoneNum = val;
    });
  }

  _submitLogin () {
   if (_phoneNum.length == 11) {
      return () {
        print(_phoneNum + 'xx');
      };
    } else {
      return null;
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Z.登陆'),
      ),
      backgroundColor: Colors.white,
      body: new Container(
        child: _loginFormWidget(_checkPhoneNum, _submitLogin),
      ),
    );
  }
}

Widget _loginFormWidget (_checkPhoneNum, _submitLogin) {

  return Center(
    child:  Padding(
      padding: EdgeInsets.all(ScreenUtil().setWidth(19)),
      child: Column(
        children: <Widget>[
          Image.asset('assets/images/logo.jpg', width: ScreenUtil().setWidth(70), height: ScreenUtil().setWidth(90)),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setWidth(15), bottom: ScreenUtil().setWidth(40)),
            child: Text(
              '金服互联网金融平台',
              style: TextStyle(color: Color(0xFFb3b3b3)),
            ),
          ),
          TextField(
              autofocus: false,
              keyboardType: TextInputType.numberWithOptions(),
              decoration: InputDecoration(
                  labelText: "手机号",
                  hintText: "请输入11位手机号",
                  prefixIcon: Icon(Icons.phone_iphone)
              ),
              onChanged: (val) {
                _checkPhoneNum(val);
              },
          ),
          Padding(
            padding: EdgeInsets.only(top: ScreenUtil().setWidth(25)),
            child: SizedBox(
              width: ScreenUtil().setWidth(335),
              height: ScreenUtil().setWidth(40),
              child: FlatButton(
                child: Text("下一步"),
                color: Color(0xFFed4e39),
                textColor: Colors.white,
                disabledColor: Color(0xFFDDDDDD),
                disabledTextColor:Color(0xFF8c8c8c) ,
                onPressed: _submitLogin()
              ),
            )
          )
        ],
      )
    ),
  );
}