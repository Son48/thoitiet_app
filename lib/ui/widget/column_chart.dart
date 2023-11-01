import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatelessWidget {
  final List<ForeCastData1> chartData;

  const ColumnChart({
    required this.chartData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: MediaQuery.of(context).size.width - 20,
      height: MediaQuery.of(context).size.height * 0.50,
      child: SfCartesianChart(
        margin: EdgeInsets.all(0.0),
        legend: Legend(isVisible: true),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <ChartSeries>[
          ColumnSeries<ForeCastData1, String>(
            name: 'Lượng mưa (mm)',
            dataSource: chartData,
            xValueMapper: (ForeCastData1 forecast, _) => forecast.label,
            yValueMapper: (ForeCastData1 forecast, _) => double.parse(forecast.forecast),
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelAlignment: ChartDataLabelAlignment.bottom,
              labelPosition: ChartDataLabelPosition.inside,
            ),
            color: Color(0x9EB0DAFF),
            enableTooltip: true,
          ),
        ],
        primaryXAxis: CategoryAxis(
          labelIntersectAction: AxisLabelIntersectAction.none,
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelPosition: ChartDataLabelPosition.outside, // Đặt thành ChartDataLabelPosition.none
        ),
        primaryYAxis: NumericAxis(
          maximumLabels: 5,
          labelStyle: TextStyle(color: Colors.transparent),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelPosition: ChartDataLabelPosition.inside,
          isVisible: true,
        ),
      ),
    );
  }
}

class ForeCastData1 {
  ForeCastData1(this.day, this.rank, this.forecast);

  final String day;
  final String rank;
  final String forecast;

  // Create a custom label for the data point
  String get label => '$day/$rank ';
}