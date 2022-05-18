import 'dart:async';
import 'package:flutter/material.dart';
import 'package:waste_collector/constants.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:waste_collector/screens/login.dart';

class splash extends StatefulWidget {
  const splash({Key? key}) : super(key: key);

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 6);
    return Timer(duration, route);
  }

  route() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => login()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          greenLight,
          greenDark,
        ],
      )),
      child: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(children: <Widget>[
              Text('أهلاً وسهلاً',
                  style: TextStyle(
                    fontFamily: 'El Messiri',
                    fontSize: 45,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    //
                  )),
              SizedBox(
                height: 10,
              ),
              Text('دربك أقرب',
                  style: TextStyle(
                    fontFamily: 'El Messiri',
                    fontSize: 40,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    //
                  )),
              Text('جامع النفايات الصلبة الذكي',
                  style: TextStyle(
                    fontFamily: 'El Messiri',
                    fontSize: 20,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    //
                  )),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                width: 300,
                child: Text(
                  "هنا سنتمكن من مساعدتك  بما يخص النفايات الصلبة أنشئ حساب واستمتع بالتطبيق",
                  maxLines: 3,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'El Messiri',
                    fontSize: 20,
                    color: Colors.white,
                    decoration: TextDecoration.none,
                    //
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset('assets/photos/welcome.png'),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70),
              child: SpinKitFadingCircle(
                color: Colors.white,
                size: 50,
                duration: Duration(milliseconds: 3000),
              )),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => login()),
                  );
                },
                child: Text(
                  'تخطي',
                  style: TextStyle(
                    fontFamily: 'El Messiri',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                )),
          )
        ],
      ),
    );
  }
}
