import 'package:crypto_monitor/router/app_route.dart';
import 'package:crypto_monitor/router/pages/dashboard_page.dart';
import 'package:crypto_monitor/router/pages/detail_page.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter router() => GoRouter(routes: [
        GoRoute(
            name: AppRoute.dashboard.name,
            path: AppRoute.dashboard.path,
            pageBuilder: (context, state) {
              return const DashboardPage();
            },
            routes: [
              GoRoute(
                  name: AppRoute.detail.name,
                  path: AppRoute.detail.path,
                  pageBuilder: (context, state) {
                    final id = state.pathParameters['id']!;
                    final extra = state.extra as Map<String, dynamic>;
                    final name = extra['name']!;
                    final imageUrl = extra['imageUrl']!;
                    return DetailPage(id: id, name: name, imageUrl: imageUrl);
                  })
            ])
      ]);
}
