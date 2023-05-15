import 'package:crypto_monitor/ui/screens/detail/widgets/chart_widget.dart';
import 'package:crypto_monitor/ui/screens/detail/widgets/chart_buttons_widget.dart';
import 'package:crypto_monitor/ui/screens/detail/widgets/detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/detail/detail_bloc.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
      {super.key,
      required this.id,
      required this.name,
      required this.imageUrl});

  final String id;
  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
                radius: 14,
                backgroundColor: Colors.transparent,
                child: Image.network(imageUrl)),
            const SizedBox(width: 8),
            Text(name),
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          context
              .read<DetailBloc>()
              .add(LoadDetail(id: id, interval: HistoryInterval.d1));
          context
              .read<DetailBloc>()
              .add(LoadDetail(interval: HistoryInterval.d1, id: id));
          return Future.value();
        },
        child: ListView(
          children: [
            // Dettaglio asset
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: DetailWidget(),
            ),
            // Grafico asset
            Column(
              children: [
                const ChartWidget(),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ChartButtonsWidget(id: id),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
