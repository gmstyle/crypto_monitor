import 'package:crypto_monitor/blocs/detail/detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../blocs/bloc_status_enum.dart';
import '../../../../models/data/history_item.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state.status == BlocStatus.error) {
          return ErrorWidget(state.error!);
        }

        if (state.status == BlocStatus.loaded) {
          final history = state.data!.graphData;

          return SfCartesianChart(
            enableAxisAnimation: true,
            /*legend: Legend(
                            title: LegendTitle(
                                text: 'Price in USD',
                                textStyle: const TextStyle()),
                            isVisible: true,
                            position: LegendPosition.bottom),*/
            tooltipBehavior: TooltipBehavior(
              enable: true,
            ),
            primaryXAxis: DateTimeAxis(),
            primaryYAxis: NumericAxis(),
            series: <ChartSeries>[
              LineSeries<HistoryItem, DateTime>(
                dataSource: history,
                xValueMapper: (HistoryItem item, _) =>
                    DateTime.parse(item.date as String),
                yValueMapper: (HistoryItem item, _) =>
                    double.parse(item.priceUsd),
                /*dataLabelSettings: const DataLabelSettings(
                                    isVisible: true,
                                    showCumulativeValues: true)*/
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
