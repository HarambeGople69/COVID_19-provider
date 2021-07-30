import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/pages/homepage.dart';
import 'package:myapp/utils/styles.dart';

class smash extends StatefulWidget {
  const smash({Key? key}) : super(key: key);

  @override
  _smashState createState() => _smashState();
}

class _smashState extends State<smash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Welcome to COVID-19 Tracker", style: appStyle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));
              },
              child: Image.asset(
                "assets/images/mainvirus.png",
                height: ScreenUtil().setSp(800),
                width: ScreenUtil().setSp(800),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xff5390d9),
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setSp(35),
                  vertical: ScreenUtil().setSp(35)),
              child: Text("Smash that COVID-19 to proceed",
                  style: medStyle.copyWith(
                      color: Colors.white, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }
}
