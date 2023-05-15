import 'package:crypto_monitor/blocs/home/home_bloc.dart';
import 'package:crypto_monitor/repositories/home_repository.dart';
import 'package:crypto_monitor/ui/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardPage extends Page {
  const DashboardPage({super.key});

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<HomeBloc>(
                  create: (context) =>
                      HomeBloc(homeRepository: context.read<HomeRepository>())
                        ..add(const LoadAssets(null))),
            ],
            child: const DashboardScreen(),
          );
        });
  }
}
