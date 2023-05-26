import 'package:crypto_monitor/providers/api_provider.dart';
import 'package:crypto_monitor/repositories/detail_repository.dart';
import 'package:crypto_monitor/repositories/home_repository.dart';
import 'package:crypto_monitor/router/app_router.dart';
import 'package:crypto_monitor/utils/my_bloc_observer.dart';
import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pine/di/dependency_injector_helper.dart';
import 'package:provider/provider.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(DependencyInjectorHelper(providers: [
    Provider<ApiProvider>(create: (context) => ApiProvider()),
  ], repositories: [
    RepositoryProvider<HomeRepository>(
      create: (context) =>
          HomeRepository(apiProvider: context.read<ApiProvider>()),
    ),
    RepositoryProvider<DetailRepository>(
        create: (context) =>
            DetailRepository(apiProvider: context.read<ApiProvider>())),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final appRouter = AppRouter().router();

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
        builder: (ColorScheme? lightDynamic, ColorScheme? darkDynamic) {
      ColorScheme lightColorScheme;
      ColorScheme darkColorScheme;

      if (lightDynamic != null && darkDynamic != null) {
        lightColorScheme = lightDynamic.harmonized();
        darkColorScheme = darkDynamic.harmonized();
      } else {
        lightColorScheme = const ColorScheme.light(
          primary: Color(0xFF6200EE),
        );
        darkColorScheme = const ColorScheme.dark(
          primary: Color(0xFF6200EE),
          brightness: Brightness.dark,
        );
      }
      return MaterialApp.router(
        title: 'Crypto Monitor',
        theme: ThemeData(colorScheme: lightColorScheme, useMaterial3: true),
        darkTheme: ThemeData(colorScheme: darkColorScheme, useMaterial3: true),
        routerConfig: appRouter,
      );
    });
  }
}
