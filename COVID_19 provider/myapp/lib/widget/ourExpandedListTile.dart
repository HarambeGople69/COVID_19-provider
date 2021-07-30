import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:pie_chart/pie_chart.dart';

class OurExpandedListTile extends StatefulWidget {
  final String name;
  final String image;
  final double confirm;
  final double active;
  final double death;
  final double recover;
  const OurExpandedListTile(
      {Key? key,
      required this.image,
      required this.confirm,
      required this.active,
      required this.death,
      required this.recover,
      required this.name})
      : super(key: key);

  @override
  _OurExpandedListTileState createState() => _OurExpandedListTileState();
}

class _OurExpandedListTileState extends State<OurExpandedListTile> {
  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Row(
        children: [
          Image.asset(
            widget.image,
            height: ScreenUtil().setHeight(
              270,
            ),
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: ScreenUtil().setWidth(
              80,
            ),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("${widget.name}",
                  style: medStyle.copyWith(
                    color: Color(0xff6088c4),
                  )),
              Text("Deaths: ${widget.death}",
                  style: medStyle.copyWith(
                    color: Colors.red,
                  )),
              Text("Recovered: ${widget.recover}",
                  style: medStyle.copyWith(
                    color: Colors.green,
                  )),
            ],
          ))
        ],
      ),
      children: [
        PieChart(
          chartLegendSpacing: 22,
          animationDuration: Duration(milliseconds: 800),
          chartRadius: MediaQuery.of(context).size.width / 1.2,
          legendOptions: LegendOptions(
            legendPosition: LegendPosition.right,
            legendTextStyle: norStyle,
          ),
          dataMap: {
            "Confirmed": widget.confirm,
            "Active": widget.active,
            "Recovered": widget.recover,
            "Deaths": widget.death,
          },
          chartValuesOptions: ChartValuesOptions(
            chartValueStyle: TextStyle(
                fontSize: ScreenUtil().setSp(30),
                color: Colors.black,
                fontWeight: FontWeight.bold),
            showChartValueBackground: true,
            showChartValues: true,
            showChartValuesInPercentage: true,
            showChartValuesOutside: false,
          ),
          colorList: [
            Colors.red[200]!,
            Colors.blue[200]!,
            Colors.green[200]!,
            Colors.grey[600]!
          ],
        ),
      ],
    );
  }
}
