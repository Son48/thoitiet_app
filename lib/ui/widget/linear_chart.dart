import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class LineChart extends StatelessWidget {
  final List<ForeCastData> chartData1;
  final List<ForeCastData> chartData2;

  const LineChart({
    required this.chartData1,
    required this.chartData2,
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
            LineSeries<ForeCastData, String>(
              name: 'Nhiệt độ',
              dataSource: chartData1,
              xValueMapper: (ForeCastData forecast, _) => forecast.label,
              yValueMapper: (ForeCastData forecast, _) => double.parse(forecast.forecast),
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
            ),
            LineSeries<ForeCastData, String>(
              name: 'Khả năng có mưa',
              dataSource: chartData2,
              xValueMapper: (ForeCastData forecast, _) => forecast.label,
              yValueMapper: (ForeCastData forecast, _) => double.parse(forecast.forecast),
              dataLabelSettings: DataLabelSettings(isVisible: true),
              enableTooltip: true,
            ),
          ],

          primaryXAxis: CategoryAxis(
            labelIntersectAction: AxisLabelIntersectAction.none,
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            labelPosition: ChartDataLabelPosition.inside,
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

class ForeCastData {
  ForeCastData(this.day, this.rank, this.forecast);

  final String day;
  final String rank;
  final String forecast;

  // Create a custom label for the data point
  String get label => '$day/$rank ';


}
