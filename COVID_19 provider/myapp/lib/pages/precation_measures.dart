import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';

class Precaution extends StatefulWidget {
  const Precaution({Key? key}) : super(key: key);

  @override
  _PrecautionState createState() => _PrecautionState();
}

class _PrecautionState extends State<Precaution> {
  List<Map<String, String>> precaution = [
    {
      "title":
          "Clean your hands often. Use soap and water, or an alcohol-based hand rub.",
      "image": "assets/images/Precaution1.png"
    },
    {
      "title":
          'Maintain a safe distance from anyone who is coughing or sneezing.',
      "image": "assets/images/Precaution2.png"
    },
    {
      "title":
          'If you have a fever, cough and difficulty breathing, seek medical attention.',
      "image": "assets/images/Precaution3.jpg"
    },
    {
      "title": 'Wear a mask when physical distancing is not possible.',
      "image": "assets/images/Precaution4.png"
    },
    {
      "title":
          'Cover your nose and mouths with your bent elbow or a tissue when you cough or sneeze.',
      "image": "assets/images/Precaution5.jpg"
    },
  ];

  displaytile(String image, String preca) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListTile(
          title: Text(
            preca,
            style: TextStyle(
              fontSize: ScreenUtil().setSp(50),
              // fontWeight: FontWeight.bold,
              // color: Color(0xff6088c4),
            ),
          ),
          leading: Image.asset(
            image,
            height: ScreenUtil().setHeight(250),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            "PRECAUTION AND SAFETY MEASURES",
            style: appStyle,
          ),
        ),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return displaytile(
              precaution[index]['image']!, precaution[index]['title']!);
        },
        separatorBuilder: (BuildContext context, int index) => Divider(),
        itemCount: precaution.length,
      ),
    );
  }
}
