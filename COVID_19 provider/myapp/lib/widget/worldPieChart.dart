import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:myapp/utils/styles.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldPieChart extends StatefulWidget {
  final Map<String, double> datamap;
  const WorldPieChart({Key? key, required this.datamap}) : super(key: key);

  @override
  _WorldPieChartState createState() => _WorldPieChartState();
}

class _WorldPieChartState extends State<WorldPieChart> {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      chartLegendSpacing: 22,
      animationDuration: Duration(milliseconds: 800),
      chartRadius: MediaQuery.of(context).size.width / 1.2,
      legendOptions: LegendOptions(
        legendPosition: LegendPosition.right,
        legendTextStyle: norStyle,
      ),
      dataMap: widget.datamap,
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
    );
  }
}
