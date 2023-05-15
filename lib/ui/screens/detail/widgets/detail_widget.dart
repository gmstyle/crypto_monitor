import 'package:crypto_monitor/blocs/detail/detail_bloc.dart';
import 'package:crypto_monitor/ui/common_widgets/loading_overlay_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../blocs/bloc_status_enum.dart';
import '../../../../utils/utils.dart';

class DetailWidget extends StatelessWidget {
  DetailWidget({
    super.key,
  });

  final loader = LoadingOverlayWidget();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DetailBloc, DetailState>(
      listener: (context, state) {
        // Loading overlay
        if (state == const DetailState.loading()) {
          loader.show(context);
        } else {
          loader.hide();
        }
      },
      builder: (context, state) {
        /*if (state.status == DetailStatus.loading) {
          return const LoadingWidget();
        }*/

        if (state.status == BlocStatus.error) {
          return ErrorWidget(state.error!);
        }

        if (state.status == BlocStatus.loaded) {
          var asset = state.data!.assetUI;
          return Column(
            children: [
              Text(
                Utils.formatCurrency(asset.priceUsd!),
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    asset.changePercent24Hr!.contains('-')
                        ? Icons.arrow_circle_down
                        : Icons.arrow_circle_up,
                    color: asset.changePercent24Hr!.contains('-')
                        ? Colors.red
                        : Colors.green,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    Utils.roundToDecimalPlaces(asset.changePercent24Hr!, 2),
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                          color: asset.changePercent24Hr!.contains('-')
                              ? Colors.red
                              : Colors.green,
                        ),
                  ),
                ],
              ),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
