import 'package:crypto_monitor/blocs/home/home_bloc.dart';
import 'package:crypto_monitor/ui/screens/dashboard/tabs/home/widgets/currency_list_widget.dart';
import 'package:crypto_monitor/ui/screens/dashboard/tabs/home/widgets/search_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../blocs/bloc_status_enum.dart';
import '../../../../common_widgets/loading_overlay_widget.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

  final loader = LoadingOverlayWidget();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
        onRefresh: () {
          context.read<HomeBloc>().add(const LoadAssets(null));
          return Future.value();
        },
        child: BlocListener<HomeBloc, HomeState>(
          listener: (context, state) {
            // Loading overlay
            if (state.status == BlocStatus.loading) {
              loader.show(context);
            } else {
              loader.hide();
            }
          },
          child: Column(
            children: [
              SearchBarWidget(),
              const Expanded(
                child: CurrencyListWidget(),
              ),
            ],
          ),
        ));
  }
}
