enum Routes {
  home('/'),
  quiz('/quiz'),
  results('/results'),
  history('/history');

  final String path;

  const Routes(this.path);
}
