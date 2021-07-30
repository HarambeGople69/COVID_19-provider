import 'dart:convert';
import 'package:myapp/controller/data_controller.dart';
import 'package:myapp/utils/styles.dart';
import 'package:myapp/widget/ToggleTitle.dart';
import 'package:myapp/widget/ourExpandedListTile.dart';
import 'package:myapp/widget/ourSizedHeight.dart';
import 'package:myapp/widget/worldPieChart.dart';
import 'package:myapp/widget/worldwidepanel.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/pages/precation_measures.dart';
import 'package:myapp/pages/symptom.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int range = 3;
  int number = 1;
  int ok = 0;

  Map? worldData;
  fetchWorldWideData() async {
    http.Response response =
        await http.get(Uri.parse("https://corona.lmao.ninja/v3/covid-19/all"));
    setState(() {
      worldData = jsonDecode(response.body);
    });
  }

  List? recoveredcountryData;
  fetchrecoveredCountryData() async {
    http.Response response = await http.get(
      Uri.parse(
          "https://corona.lmao.ninja/v3/covid-19/countries?sort=recovered"),
    );
    setState(() {
      recoveredcountryData = jsonDecode(response.body);
    });
  }

  List? countryData;
  fetchCountryData() async {
    http.Response response = await http.get(Uri.parse(
        "https://corona.lmao.ninja/v3/covid-19/countries?sort=cases"));
    setState(() {
      countryData = jsonDecode(response.body);
      print(countryData);
    });
  }

  void asia() {
    for (var i = 0; i < countryData!.length; i++) {
      if (countryData![i]['continent'] == "Asia") {
        Provider.of<APIData>(context, listen: false)
            .setAsia(countryData![i]["deaths"]);
        Provider.of<APIData>(context, listen: false)
            .setAsiaRecovered(countryData![i]["recovered"]);
        Provider.of<APIData>(context, listen: false)
            .setasiaActive(countryData![i]["active"]);
        Provider.of<APIData>(context, listen: false)
            .setAsiaConfirmed(countryData![i]["cases"]);
      }
    }
  }

  void europe() {
    for (var i = 0; i < countryData!.length; i++) {
      if (countryData![i]["continent"] == "Europe") {
        Provider.of<APIData>(context, listen: false)
            .setEurope(countryData![i]["deaths"]);
        Provider.of<APIData>(context, listen: false)
            .setEuropeRecovered(countryData![i]["recovered"]);
        Provider.of<APIData>(context, listen: false)
            .setEuropeActive(countryData![i]["active"]);
        Provider.of<APIData>(context, listen: false)
            .setEuropeConfirmed(countryData![i]["cases"]);
      }
    }
  }

  void africa() {
    for (var i = 0; i < countryData!.length; i++) {
      if (countryData![i]["continent"] == "Africa") {
        Provider.of<APIData>(context, listen: false)
            .setAfrica(countryData![i]["deaths"]);
        Provider.of<APIData>(context, listen: false)
            .setAfricaRecovered(countryData![i]["recovered"]);
        Provider.of<APIData>(context, listen: false)
            .setAfricaActive(countryData![i]["active"]);
        Provider.of<APIData>(context, listen: false)
            .setAfricaConfirmed(countryData![i]["cases"]);
      }
    }
  }

  void australia() {
    for (var i = 0; i < countryData!.length; i++) {
      if (countryData![i]["continent"] == "Australia/Oceania") {
        Provider.of<APIData>(context, listen: false)
            .setAustralia(countryData![i]["deaths"]);
        Provider.of<APIData>(context, listen: false)
            .setAustraliaRecovered(countryData![i]["recovered"]);
        Provider.of<APIData>(context, listen: false)
            .setAustraliaActive(countryData![i]["active"]);
        Provider.of<APIData>(context, listen: false)
            .setAustraliaConfirmed(countryData![i]["cases"]);
      }
    }
  }

  void northAmerica() {
    for (var i = 0; i < countryData!.length; i++) {
      if (countryData![i]["continent"] == "North America") {
        Provider.of<APIData>(context, listen: false)
            .setNorthAmerica(countryData![i]["deaths"]);
        Provider.of<APIData>(context, listen: false)
            .setNorthAmericaRecovered(countryData![i]["recovered"]);
        Provider.of<APIData>(context, listen: false)
            .setNorthAmericaActive(countryData![i]["active"]);
        Provider.of<APIData>(context, listen: false)
            .setNorthAmericaConfirmed(countryData![i]["cases"]);
      }
    }
  }

  void southAmerica() {
    for (var i = 0; i < countryData!.length; i++) {
      if (countryData![i]["cpntinent"] == "South America") {
        Provider.of<APIData>(context, listen: false)
            .setSouthAmerica(countryData![i]["deaths"]);
        Provider.of<APIData>(context, listen: false)
            .setSouthAmericaRecovered(countryData![i]["recovered"]);
        Provider.of<APIData>(context, listen: false)
            .setSouthAmericaActive(countryData![i]["active"]);
        Provider.of<APIData>(context, listen: false)
            .setSouthAmericaConfirmed(countryData![i]["cases"]);
      }
    }
  }

  void OnceOnly(int ok) {
    print("OOOOOOOONCCCCCCCEEEEEE");
    if (ok == 0) {
      setState(() {
        asia();
        europe();
        africa();
        australia();
        northAmerica();
        southAmerica();
      });
    } else {
      return null;
    }
  }

  Future fetchData() async {
    fetchCountryData();
    fetchWorldWideData();
    fetchrecoveredCountryData();
    if (countryData != null) {
      asia();
      europe();
      africa();
      australia();
      northAmerica();
      southAmerica();
    }
  }

  String InputValue = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(ScreenUtil().setSp(325)),
          child: AppBar(
              elevation: 0,
              title: Text(
                "COVID-19 Traker",
                style: appStyle,
              ),
              bottom: PreferredSize(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        onChanged: (String value) {
                          setState(() {
                            InputValue = value;
                          });
                        },
                        decoration: InputDecoration(
                          labelText: "Enter country name",
                          labelStyle: TextStyle(
                            fontSize: ScreenUtil().setSp(50),
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (InputValue != "") {
                          for (var i = 0; i < countryData!.length; i++) {
                            if (countryData![i]["country"]
                                    .toString()
                                    .toUpperCase() ==
                                InputValue.toUpperCase()) {
                              _DetailBottomSheet(context, i);

                              break;
                            }
                          }
                        } else {
                          return null;
                        }
                      },
                      icon: Icon(
                        Icons.search,
                        size: ScreenUtil().setSp(
                          90,
                        ),
                      ),
                    ),
                  ],
                ),
                preferredSize: Size.fromHeight(
                  ScreenUtil().setHeight(10),
                ),
              )),
        ),
        body: Consumer<APIData>(builder: (context, apidata, child) {
          return SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.symmetric(
                horizontal: ScreenUtil().setSp(10),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                          onTap: () {
                            setState(() {
                              range = 3;
                            });
                          },
                          child: Toggle(
                            title: "Worldwide",
                            index: 3,
                            mustindex: 3,
                          )),
                      InkWell(
                        onTap: () {
                          setState(() {
                            range = 4;
                            if (countryData != null) {
                              OnceOnly(ok);
                              ok = 1;
                            }
                          });
                        },
                        child: Toggle(
                          title: "Continent",
                          index: 4,
                          mustindex: 4,
                        ),
                      ),
                    ],
                  ),
                  OurSizeheight(),
                  (range == 3)
                      ? Column(
                          children: [
                            (worldData == null)
                                ? CircularProgressIndicator()
                                : WorldPieChart(
                                    datamap: {
                                      "Confirmed":
                                          worldData!['cases'].toDouble(),
                                      "Active": worldData!['active'].toDouble(),
                                      "Recovered":
                                          worldData!['recovered'].toDouble(),
                                      "Deaths": worldData!['deaths'].toDouble(),
                                    },
                                  ),
                            OurSizeheight(),
                            (worldData == null)
                                ? CircularProgressIndicator()
                                : WorldWidePanel(
                                    WorldData: worldData!,
                                  ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Precaution();
                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setSp(30),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/precaution.png",
                                      // height: 250,
                                      height: ScreenUtil().setHeight(250),
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(10),
                                    ),
                                    Expanded(
                                        child: Text(
                                            "Precaution and safety measures",
                                            style: appStyle.copyWith(
                                              color: Color(0xff6088c4),
                                            )))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Symptoms();
                                }));
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: ScreenUtil().setSp(30),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      "assets/images/symptoms.jpg",
                                      // height: 250,
                                      height: ScreenUtil().setHeight(250),
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      width: ScreenUtil().setWidth(30),
                                    ),
                                    Expanded(
                                        child: Text("Symptoms of COVID-19",
                                            style: appStyle.copyWith(
                                              color: Color(0xff6088c4),
                                            )))
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  (range == 4)
                      ? Column(
                          children: [
                            OurExpandedListTile(
                              name: "Asia",
                              image: "assets/images/asia.png",
                              confirm: apidata.asiaConfirmed.toDouble(),
                              active: apidata.asiaActive.toDouble(),
                              death: apidata.asia.toDouble(),
                              recover: apidata.asiaRecovered.toDouble(),
                            ),
                            OurExpandedListTile(
                              name: "Europe",
                              image: "assets/images/europe.png",
                              confirm: apidata.europeConfirmed.toDouble(),
                              active: apidata.europeActive.toDouble(),
                              death: apidata.europe.toDouble(),
                              recover: apidata.europeRecovered.toDouble(),
                            ),
                            OurExpandedListTile(
                              name: "Africa",
                              image: "assets/images/africa.png",
                              confirm: apidata.africaConfirmed.toDouble(),
                              active: apidata.africaActive.toDouble(),
                              death: apidata.africa.toDouble(),
                              recover: apidata.africaRecovered.toDouble(),
                            ),
                            OurExpandedListTile(
                              name: "North America",
                              image: "assets/images/northamerica.jpg",
                              confirm: apidata.northAmericaConfirmed.toDouble(),
                              active: apidata.northAmericaActive.toDouble(),
                              death: apidata.northAmerica.toDouble(),
                              recover: apidata.northAmericaRecovered.toDouble(),
                            ),
                          ],
                        )
                      : Container()
                ],
              ),
            ),
          );
        }));
  }

  void _DetailBottomSheet(context, index) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: ScreenUtil().setHeight(950),
            child: Column(
              children: [
                SizedBox(height: ScreenUtil().setHeight(5)),
                Image.network(
                  countryData![index]["countryInfo"]['flag'],
                  height: ScreenUtil().setHeight(100),
                  fit: BoxFit.cover,
                ),
                SizedBox(height: ScreenUtil().setHeight(5)),
                Text(
                  countryData![index]["country"],
                  style: TextStyle(
                    // fontSize: ScreenUtil().setSp(15),
                    fontWeight: FontWeight.bold,
                    color: Color(0xff6088c4),
                  ),
                ),
                // SizedBox(height: ScreenUtil().setHeight(3)),
                GridView(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2),
                  children: [
                    StatusPanel(
                      title: "CONFIRMED",
                      panalColor: Colors.red[200]!,
                      textColor: Colors.red,
                      count: countryData![index]['cases'].toString(),
                    ),
                    StatusPanel(
                      title: "ACTIVE",
                      panalColor: Colors.blue[100]!,
                      textColor: Colors.blue[900]!,
                      count: countryData![index]['active'].toString(),
                    ),
                    StatusPanel(
                      title: "RECOVERED",
                      panalColor: Colors.green[100]!,
                      textColor: Colors.green,
                      count: countryData![index]['recovered'].toString(),
                    ),
                    StatusPanel(
                      title: "DEATHS",
                      panalColor: Colors.grey[400]!,
                      textColor: Colors.grey[900]!,
                      count: countryData![index]['deaths'].toString(),
                    ),
                  ],
                ),
                SizedBox(
                  height: ScreenUtil().setHeight(50),
                ),
              ],
            ),
          );
        });
  }
}
