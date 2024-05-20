enum Pages {
  home(path: "/");

  const Pages({
    required this.path,
  });

  final String path;
}
