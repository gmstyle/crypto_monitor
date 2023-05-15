enum AppRoute {
  dashboard('/'),
  detail('detail/:id');

  final String path;

  const AppRoute(this.path);
}
