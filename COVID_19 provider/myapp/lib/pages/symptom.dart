import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';

class Symptoms extends StatefulWidget {
  const Symptoms({Key? key}) : super(key: key);

  @override
  _SymptomsState createState() => _SymptomsState();
}

class _SymptomsState extends State<Symptoms> {
  symptom(String title, String image) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: basicStyle,
                ),
              ),
              Container(
                child: Image.asset(
                  image,
                  height: ScreenUtil().setSp(250),
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: FittedBox(
            child: Text(
              "SYMPTOMS OF COVID-19",
              style: appStyle,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(ScreenUtil().setSp(30)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "COVID-19 affects different people in different ways. Most infected people will develop mild to moderate illness and recover without hospitalization",
                  style: basicStyle,
                ),
                Text(
                  "Most common symptoms:",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(60),
                      fontWeight: FontWeight.bold),
                ),
                symptom(
                  "-Fever\n-Dry cough\n-Tiredness",
                  "assets/images/symptom1.png",
                ),
                Text(
                  "Less common symptoms:",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(60),
                      fontWeight: FontWeight.bold),
                ),
                symptom(
                  "-Aches and pains\n-Sore throat\n-Diarrhoea\n-Conjunctivitis\n-Headache\n-Loss of taste or smell\n-A rash on skin, or discolouration of fingers or toes",
                  "assets/images/symptom2.jpg",
                ),
                Text(
                  "Serious symptoms:",
                  style: TextStyle(
                      fontSize: ScreenUtil().setSp(60),
                      fontWeight: FontWeight.bold),
                ),
                symptom(
                  "--Difficulty breathing or shortness of breath\n-Chest pain or pressure\n-Loss of speech or movement",
                  "assets/images/symptom3.jpg",
                ),
                Text(
                  "Seek immediate medical attention if you have serious symptoms. Always call before visiting your doctor or health facility.",
                  style: basicStyle,
                ),
                Text(
                  "People with mild symptoms who are otherwise healthy should manage their symptoms at home.",
                  style: basicStyle,
                ),
                Text(
                  "On average it takes 5–6 days from when someone is infected with the virus for symptoms to show, however it can take up to 14 days.",
                  style: basicStyle,
                ),
              ],
            ),
          ),
        ));
  }
}
