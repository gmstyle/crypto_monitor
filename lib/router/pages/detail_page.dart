import 'package:crypto_monitor/blocs/detail/detail_bloc.dart';
import 'package:crypto_monitor/repositories/detail_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/screens/detail/detail_screen.dart';

class DetailPage extends Page {
  final String id;
  @override
  final String name;
  final String imageUrl;

  const DetailPage({
    required this.id,
    required this.name,
    required this.imageUrl,
  });

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (BuildContext context) {
        return MultiBlocProvider(providers: [
          BlocProvider<DetailBloc>(
              create: (context) =>
                  DetailBloc(detailRepository: context.read<DetailRepository>())
                    ..add(LoadDetail(id: id, interval: HistoryInterval.d1))),
        ], child: DetailScreen(id: id, name: name, imageUrl: imageUrl));
      },
    );
  }
}
