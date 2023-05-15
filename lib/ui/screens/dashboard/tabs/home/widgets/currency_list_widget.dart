import 'package:crypto_monitor/blocs/home/home_bloc.dart';
import 'package:crypto_monitor/router/app_route.dart';
import 'package:crypto_monitor/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../blocs/bloc_status_enum.dart';

class CurrencyListWidget extends StatelessWidget {
  const CurrencyListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state.status == BlocStatus.error) {
          return ErrorWidget(state.error!);
        }

        if (state.status == BlocStatus.loaded) {
          final assets = state.assetsUI;
          return ListView.builder(
              shrinkWrap: true,
              itemCount: assets.length,
              itemBuilder: (context, index) {
                final currency = assets[index];
                return ListTile(
                  title: Text(currency.name!),
                  subtitle: Text(currency.symbol!),
                  leading: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      child: Image.network(currency.imgageUrl!)),
                  trailing: Text(Utils.formatCurrency(currency.priceUsd!)),
                  onTap: () {
                    context.pushNamed(AppRoute.detail.name, pathParameters: {
                      'id': currency.id!
                    }, extra: {
                      'name': currency.name!,
                      'imageUrl': currency.imgageUrl!
                    });
                    FocusScope.of(context).unfocus();
                  },
                );
              });
        }

        return const SizedBox.shrink();
      },
    );
  }
}
