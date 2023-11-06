import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatelessWidget {
  final List<ForeCastData> chartData1;
  final List<ForeCastData> chartData2;

  const ColumnChart({
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
          ColumnSeries<ForeCastData, String>(
            name: 'Nhiệt độ ( °C)',
            color: Color(0xE8DA5A5A),
            dataSource: chartData1,
            xValueMapper: (ForeCastData forecast, _) => forecast.day,
            yValueMapper: (ForeCastData forecast, _) =>
                double.tryParse(forecast.forecast),
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
          ),
          ColumnSeries<ForeCastData, String>(
            name: 'Lượng mưa (mm)',
            color: Color(0xFF9EB0DA),
            dataSource: chartData2,
            xValueMapper: (ForeCastData forecast, _) => forecast.day,
            yValueMapper: (ForeCastData forecast, _) =>
                double.tryParse(forecast.forecast),
            dataLabelSettings: DataLabelSettings(isVisible: true),
            enableTooltip: true,
          ),
        ],
        primaryXAxis: CategoryAxis(
          labelIntersectAction: AxisLabelIntersectAction.none,
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          labelPosition: ChartDataLabelPosition.outside,
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
  ForeCastData({required this.day, required this.forecast});

  String day;
  String forecast;

// Create a custom label for the data point
}
