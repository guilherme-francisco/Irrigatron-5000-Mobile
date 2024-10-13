/// Dart import
import 'dart:math';

/// Package import
import 'package:flutter/material.dart';

/// Chart import
import 'package:syncfusion_flutter_charts/charts.dart';


/// Renders the chart with add and remove points sample.
class AddDataPoints extends StatefulWidget {
  /// Renders the chart with add and remove points sample.
  const AddDataPoints(Key key) : super(key: key);

  @override
  State<AddDataPoints> createState() => _LiveVerticalState();
}

/// State class of the chart with add and remove points options.
class _LiveVerticalState extends State<AddDataPoints> {
  _LiveVerticalState();
  ChartSeriesController? _chartSeriesController;

  /// List for storing the chart series data points.
  List<ChartSampleData>? chartData;
  late int count;

  /// Get the random value
  int _getRandomInt(int min, int max) {
    final Random random = Random();
    return min + random.nextInt(max - min);
  }

  /// Add the data point into the line series
  List<ChartSampleData> _addDataPoint() {
    chartData!.add(ChartSampleData(x: count, y: _getRandomInt(10, 100)));
    count = count + 1;
    return chartData!;
  }

  /// Remove the data point from the line series
  List<ChartSampleData> _removeDataPoint() {
    if (chartData != null && chartData!.isNotEmpty) {
      chartData!.removeAt(chartData!.length - 1);
    }
    count = count - 1;
    return chartData!;
  }

  @override
  void initState() {
    count = 11;
    chartData = <ChartSampleData>[
      ChartSampleData(x: 0, y: 10),
      ChartSampleData(x: 1, y: 13),
      ChartSampleData(x: 2, y: 80),
      ChartSampleData(x: 3, y: 30),
      ChartSampleData(x: 4, y: 72),
      ChartSampleData(x: 5, y: 19),
      ChartSampleData(x: 6, y: 30),
      ChartSampleData(x: 7, y: 92),
      ChartSampleData(x: 8, y: 48),
      ChartSampleData(x: 9, y: 20),
      ChartSampleData(x: 10, y: 51),
    ];

    if (chartData!.length > 11) {
      chartData!.removeRange(10, chartData!.length - 1);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double bottomPadding = 40;
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.fromLTRB(5, 0, 5, bottomPadding),
          child: Container(child: _buildAddRemovePointsChart()),
        )
        );
  }

  /// Returns the chart with add and remove points options.
  SfCartesianChart _buildAddRemovePointsChart() {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: NumericAxis(
          majorGridLines: MajorGridLines(width: 0),
          edgeLabelPlacement: EdgeLabelPlacement.shift),
      primaryYAxis: NumericAxis(
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0),
          minimum: 0, 
          maximum: 100),
      series: _getAddRemovePointSeries(),
    );
  }

  /// Returns the list of chart series which need to render
  /// on the chart with add and remove points.
  List<LineSeries<ChartSampleData, num>> _getAddRemovePointSeries() {
    return <LineSeries<ChartSampleData, num>>[
      LineSeries<ChartSampleData, num>(
          onRendererCreated:
              (ChartSeriesController controller) {
            _chartSeriesController = controller;
          },
          animationDuration: 0,
          dataSource: chartData!,
          xValueMapper: (ChartSampleData sales, _) => sales.x as num,
          yValueMapper: (ChartSampleData sales, _) => sales.y),
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    _chartSeriesController = null;
    super.dispose();
  }
}

class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData(
      {this.x,
      this.y,
      this.xValue,
      this.yValue,
      this.secondSeriesYValue,
      this.thirdSeriesYValue,
      this.pointColor,
      this.size,
      this.text,
      this.open,
      this.close,
      this.low,
      this.high,
      this.volume});

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;

  /// Holds y value of the datapoint(for 2nd series)
  final num? secondSeriesYValue;

  /// Holds y value of the datapoint(for 3nd series)
  final num? thirdSeriesYValue;

  /// Holds point color of the datapoint
  final Color? pointColor;

  /// Holds size of the datapoint
  final num? size;

  /// Holds datalabel/text value mapper of the datapoint
  final String? text;

  /// Holds open value of the datapoint
  final num? open;

  /// Holds close value of the datapoint
  final num? close;

  /// Holds low value of the datapoint
  final num? low;

  /// Holds high value of the datapoint
  final num? high;

  /// Holds open value of the datapoint
  final num? volume;
}
