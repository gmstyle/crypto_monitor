import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../blocs/bloc_status_enum.dart';
import '../../../../blocs/detail/detail_bloc.dart';

class ChartButtonsWidget extends StatefulWidget {
  const ChartButtonsWidget({super.key, required this.id});

  final String id;

  @override
  State<ChartButtonsWidget> createState() => _ChartButtonsWidgetState();
}

class _ChartButtonsWidgetState extends State<ChartButtonsWidget> {
  HistoryInterval selected = HistoryInterval.d1;

  final List<ButtonSegment<HistoryInterval>> _buttons = List.generate(
      HistoryInterval.values.length,
      (index) => ButtonSegment<HistoryInterval>(
          label: Text(HistoryInterval.values[index].name),
          value: HistoryInterval.values[index]));

  @override
  Widget build(BuildContext context) {
    final detailState = context.watch<DetailBloc>().state;

    if (detailState.status == BlocStatus.loaded) {
      return SegmentedButton<HistoryInterval>(
        showSelectedIcon: false,
        segments: _buttons,
        selected: <HistoryInterval>{selected},
        onSelectionChanged: (Set<HistoryInterval> newSelections) {
          context
              .read<DetailBloc>()
              .add(LoadDetail(id: widget.id, interval: newSelections.first));
          setState(() {
            selected = newSelections.first;
          });
        },
      );
    } else {
      return Container();
    }
  }
}
