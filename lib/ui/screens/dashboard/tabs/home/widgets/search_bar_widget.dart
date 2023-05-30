import 'package:crypto_monitor/blocs/home/home_bloc.dart';
import 'package:crypto_monitor/models/asset.dart';
import 'package:crypto_monitor/router/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../blocs/bloc_status_enum.dart';

class SearchBarWidget extends StatelessWidget {
  SearchBarWidget({
    super.key,
  });

  late TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      List<String> suggestions = [];
      List<Asset> currencies = [];
      if (state.status == BlocStatus.loaded) {
        suggestions = state.assetsUI.map((e) => e.name!).toList();
        currencies = state.assetsUI;
      }
      return Container(
        color: Theme.of(context).appBarTheme.backgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Flexible(
                child: Autocomplete<String>(
                  optionsBuilder: (value) {
                    if (value.text.isEmpty) {
                      return const Iterable.empty();
                    } else {
                      return suggestions.where((element) => element
                          .toLowerCase()
                          .contains(value.text.toLowerCase()));
                    }
                  },
                  fieldViewBuilder:
                      (context, controller, focusNode, onEditingComplete) {
                    _controller = controller;
                    return TextField(
                      enabled: state.status == BlocStatus.loaded,
                      controller: _controller,
                      focusNode: focusNode,
                      onEditingComplete: onEditingComplete,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        isDense: true,
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: controller.text.isNotEmpty
                            ? IconButton(
                                onPressed: () {
                                  _controller.clear();
                                  context
                                      .read<HomeBloc>()
                                      .add(const LoadAssets(null));
                                  FocusScope.of(context).unfocus();
                                },
                                icon: const Icon(Icons.clear),
                              )
                            : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      /*onSubmitted: (_) {
                        controller.clear();
                        FocusScope.of(context).unfocus();
                      },*/
                    );
                  },
                  onSelected: (selected) {
                    final currency = currencies
                        .firstWhere((element) => element.name == selected);
                    context.pushNamed(AppRoute.detail.name, pathParameters: {
                      'id': currency.id!
                    }, extra: {
                      'name': currency.name!,
                      'imageUrl': currency.imgageUrl!
                    });
                    _controller.clear();
                    FocusScope.of(context).unfocus();
                  },
                ),
              )
              /*Flexible(
                  child: TextField(
                enabled:
                    state is! AssetsLoading && state is! AssetsError,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search',
                  isDense: true,
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
                onEditingComplete: () {
                  context
                      .read<HomeBloc>()
                      .add(LoadAssets(_searchController.text));
                },
                onChanged: (value) {
                  //Future.delayed(const Duration(milliseconds: 500));
                  //context.read<HomeBloc>().add(LoadAssets(value));
                },
              ))*/
            ],
          ),
        ),
      );
    });
  }
}
