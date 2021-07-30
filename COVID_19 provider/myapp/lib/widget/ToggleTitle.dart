import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';

class Toggle extends StatefulWidget {
  final String title;
  final int index;
  final int mustindex;
  const Toggle(
      {Key? key,
      required this.title,
      required this.index,
      required this.mustindex})
      : super(key: key);

  @override
  _ToggleState createState() => _ToggleState();
}

class _ToggleState extends State<Toggle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(
        horizontal: ScreenUtil().setSp(
          20,
        ),
        vertical: ScreenUtil().setSp(
          20,
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
        ),
        borderRadius: BorderRadius.circular(
          ScreenUtil().setSp(25),
        ),
      ),
      child: Text(
        widget.title,
        style: norStyle,
      ),
    );
  }
}
